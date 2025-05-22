using Microsoft.AspNetCore.Identity;

namespace Flic.Shared.Models.Auth
{
    public class GoogleAccount
    {
        public int Id { get; set; }
        public string GoogleId { get; set; }
        public string Email { get; set; }
        public string DisplayName { get; set; }
        public string PhotoUrl { get; set; }
        public string IdentityUserId { get; set; }
        public IdentityUser User { get; set; }
    }

}
