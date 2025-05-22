using Microsoft.AspNetCore.Authentication;
using Microsoft.AspNetCore.Authentication.Cookies;
using Microsoft.AspNetCore.Authentication.Google;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Mvc;
using System.Security.Claims;

namespace Flic.Server.Controllers
{
    [ApiController]
    [Route("api/[controller]")]
    public class GoogleAuthController : ControllerBase
    {
        private readonly UserManager<IdentityUser> _userManager;
        private readonly SignInManager<IdentityUser> _signInManager;

        public GoogleAuthController(UserManager<IdentityUser> userManager, SignInManager<IdentityUser> signInManager)
        {
            _userManager = userManager;
            _signInManager = signInManager;
        }

        // 1. Bắt đầu quá trình login Google
        [HttpGet("signin")]
        public IActionResult SignInWithGoogle([FromQuery] string returnUrl = "/")
        {
            var properties = new AuthenticationProperties
            {
                RedirectUri = Url.Action(nameof(GoogleCallback), new { returnUrl })
            };
            return Challenge(properties, GoogleDefaults.AuthenticationScheme);
        }

        // 2. Google trả về callback sau khi xác thực thành công
        [HttpGet("callback")]
        public async Task<IActionResult> GoogleCallback([FromQuery] string returnUrl = "/")
        {
            // Đọc thông tin từ Google
            var authenticateResult = await HttpContext.AuthenticateAsync(CookieAuthenticationDefaults.AuthenticationScheme);

            if (!authenticateResult.Succeeded)
            {
                var errorMsg = "Đăng nhập Google thất bại. Vui lòng thử lại hoặc chọn tài khoản Google khác.";
                return Redirect($"/login?error={Uri.EscapeDataString(errorMsg)}");
            }



            // Lấy email, tên từ Google
            var email = authenticateResult.Principal.FindFirst(ClaimTypes.Email)?.Value;
            var name = authenticateResult.Principal.FindFirst(ClaimTypes.Name)?.Value;
            var googleId = authenticateResult.Principal.FindFirst(ClaimTypes.NameIdentifier)?.Value;

            if (string.IsNullOrEmpty(email))
                return Redirect($"/login?error={Uri.EscapeDataString("Không nhận được email từ Google. Vui lòng chọn tài khoản khác.")}");


            // Check user trong Identity (theo Email)
            var user = await _userManager.FindByEmailAsync(email);

            if (user == null)
            {
                // Nếu chưa có thì tạo user mới
                user = new IdentityUser
                {
                    UserName = email, // hoặc googleId tuỳ bạn, nhưng email là chuẩn
                    Email = email
                };
                var result = await _userManager.CreateAsync(user);

                if (result.Succeeded)
                {
                    // Gán role mặc định
                    await _userManager.AddToRoleAsync(user, "SINHVIEN");
                }
                else
                {
                    // Có lỗi khi tạo user
                    return Redirect($"/login?error={Uri.EscapeDataString("Không thể tạo tài khoản Google. Vui lòng liên hệ quản trị.")}");
                }
            }

            // Đăng nhập cho user này (set Cookie)
            await _signInManager.SignInAsync(user, isPersistent: true);

            // Đăng nhập xong thì redirect về returnUrl (hoặc trang chủ)
            if (string.IsNullOrEmpty(returnUrl) || returnUrl == "/")
                return Redirect("/flic"); // Trang chủ app của bạn
            else
                return Redirect(returnUrl);
        }

        // 3. Đăng xuất
        [HttpGet("signout")]
        public async Task<IActionResult> SignOut()
        {
            await _signInManager.SignOutAsync();
            return Redirect("/");
        }
    }
}
