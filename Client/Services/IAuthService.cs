using Flic.Shared;
using Flic.Shared.Models;

namespace Flic.Client.Services
{
    public interface IAuthService
    {
        Task<LoginResult> Login(LoginModel loginModel);
        Task<bool> SetAuthenticationToken(string token);
        Task Logout();
        Task<HttpResponseMessage> Register(RegisterModel registerModel);
        Task<HttpResponseMessage> Update(RegisterModel registerModel);
        //Task<RegisterModel> GetUser(string username);
        Task<RegisterModel> GetUserByUsername(string username);
        Task<RegisterModel> GetUserById(string Id);
        Task<Student> GetStudentByUserName(string username);

    }
}
