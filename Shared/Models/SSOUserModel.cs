namespace Flic.Shared.Models
{
    public class SSOUserModel
    {
        public string Email { get; set; }
        public string Name { get; set; }
        public string FirstName { get; set; }
        public string LastName { get; set; }
        public string PictureUrl { get; set; }
        public string Provider { get; set; } = "Google";
    }
}
