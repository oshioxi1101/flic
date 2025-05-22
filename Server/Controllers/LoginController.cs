using Flic.Shared;
using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Configuration;
using Microsoft.IdentityModel.Tokens;
using System;
using System.Collections.Generic;
using System.IdentityModel.Tokens.Jwt;
using System.Linq;
using System.Security.Claims;
using System.Text;
using System.Threading.Tasks;
using Flic.Server.Data;
using Microsoft.EntityFrameworkCore;

namespace Flic.Server.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class LoginController : ControllerBase
    {
        private readonly IConfiguration _configuration;
        private readonly SignInManager<IdentityUser> _signInManager;
        private readonly ApplicationDbContext _dbContext;

        public LoginController(
            IConfiguration configuration,
            SignInManager<IdentityUser> signInManager,
            ApplicationDbContext dbContext)
        {
            _configuration = configuration;
            _signInManager = signInManager;
            _dbContext = dbContext;
        }

        [HttpPost]
        public async Task<IActionResult> Login([FromBody] LoginModel login)
        {
            try
            {
                // 1. Tìm user bằng email hoặc username
                IdentityUser user = login.Username.Contains("@")
                    ? await _signInManager.UserManager.FindByEmailAsync(login.Username)
                    : await _signInManager.UserManager.FindByNameAsync(login.Username);

                if (user != null)
                {
                    // Dùng UserName thực để sign in
                    var result = await _signInManager.PasswordSignInAsync(
                        user.UserName, login.Password, isPersistent: false, lockoutOnFailure: false);

                    if (result.Succeeded)
                    {
                        // Lấy roles và tạo JWT
                        var roles = await _signInManager.UserManager.GetRolesAsync(user);
                        var claims = new List<Claim> { new Claim(ClaimTypes.Name, user.UserName) };
                        claims.AddRange(roles.Select(r => new Claim(ClaimTypes.Role, r)));

                        var key = new SymmetricSecurityKey(Encoding.UTF8.GetBytes(_configuration["JwtSecurityKey"]));
                        var creds = new SigningCredentials(key, SecurityAlgorithms.HmacSha256);
                        var expiry = DateTime.Now.AddDays(int.Parse(_configuration["JwtExpiryInDays"]));

                        var token = new JwtSecurityToken(
                            issuer: _configuration["JwtIssuer"],
                            audience: _configuration["JwtAudience"],
                            claims: claims,
                            expires: expiry,
                            signingCredentials: creds
                        );

                        return Ok(new LoginResult
                        {
                            Successful = true,
                            Token = new JwtSecurityTokenHandler().WriteToken(token)
                        });
                    }
                }

                // 2. Fallback: kiểm tra bảng Students
                var std = await _dbContext.Students
                    .FirstOrDefaultAsync(m => m.MaSV == login.Username);

                if (std == null)
                {
                    return BadRequest(new LoginResult
                    {
                        Successful = false,
                        Error = "Không tìm thấy tài khoản"
                    });
                }

                if (std.Ngaysinh != login.Password)
                {
                    return BadRequest(new LoginResult
                    {
                        Successful = false,
                        Error = "Sai mật khẩu"
                    });
                }

                // Tạo token cho sinh viên
                var studentClaims = new List<Claim>
                {
                    new Claim(ClaimTypes.Name, login.Username),
                    new Claim(ClaimTypes.Role, "SINHVIEN")
                };

                var studentKey = new SymmetricSecurityKey(Encoding.UTF8.GetBytes(_configuration["JwtSecurityKey"]));
                var studentCreds = new SigningCredentials(studentKey, SecurityAlgorithms.HmacSha256);
                var studentExpiry = DateTime.Now.AddDays(int.Parse(_configuration["JwtExpiryInDays"]));

                var studentToken = new JwtSecurityToken(
                    issuer: _configuration["JwtIssuer"],
                    audience: _configuration["JwtAudience"],
                    claims: studentClaims,
                    expires: studentExpiry,
                    signingCredentials: studentCreds
                );

                return Ok(new LoginResult
                {
                    Successful = true,
                    Token = new JwtSecurityTokenHandler().WriteToken(studentToken)
                });
            }
            catch (Exception ex)
            {
                return BadRequest(new LoginResult
                {
                    Successful = false,
                    Error = "Lỗi khi đăng nhập: " + ex.Message
                });
            }
        }
    }
}
