using System.Collections.Generic;

namespace MyAspNetCoreApp.ViewModels
{
    public class UserRolesViewModel
    {
        public string UserId { get; set; } = string.Empty;
        public string UserName { get; set; } = string.Empty;
        public string Email { get; set; } = string.Empty;
        public List<RoleSelection> Roles { get; set; } = new List<RoleSelection>();
    }

    public class RoleSelection
    {
        public string RoleId { get; set; } = string.Empty;
        public string RoleName { get; set; } = string.Empty;
        public bool IsSelected { get; set; }
    }
}
