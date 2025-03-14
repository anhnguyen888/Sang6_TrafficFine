using Microsoft.AspNetCore.Identity;

namespace MyAspNetCoreApp.Models
{
    public class ApplicationUser : IdentityUser
    {
        // Add custom user properties here
        public string FirstName { get; set; } = string.Empty;
        public string LastName { get; set; } = string.Empty;
        public DateTime RegistrationDate { get; set; } = DateTime.Now;
    }
}
