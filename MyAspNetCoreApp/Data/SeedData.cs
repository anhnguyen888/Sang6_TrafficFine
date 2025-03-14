using Microsoft.AspNetCore.Identity;
using MyAspNetCoreApp.Models;

namespace MyAspNetCoreApp
{
    public static class SeedData
    {
        public static async Task InitializeAsync(UserManager<ApplicationUser> userManager, RoleManager<IdentityRole> roleManager)
        {
            // Create roles if they don't exist
            string[] roles = new string[] { "Admin", "Manager", "User" };

            foreach (string role in roles)
            {
                if (!await roleManager.RoleExistsAsync(role))
                {
                    await roleManager.CreateAsync(new IdentityRole(role));
                }
            }

            // Create admin user if it doesn't exist
            var adminEmail = "admin@trafficfine.com";
            var adminUser = await userManager.FindByEmailAsync(adminEmail);

            if (adminUser == null)
            {
                adminUser = new ApplicationUser
                {
                    UserName = adminEmail,
                    Email = adminEmail,
                    EmailConfirmed = true,
                    FirstName = "System",
                    LastName = "Administrator"
                };

                var result = await userManager.CreateAsync(adminUser, "Admin@123");

                if (result.Succeeded)
                {
                    await userManager.AddToRoleAsync(adminUser, "Admin");
                }
            }
        }
    }
}
