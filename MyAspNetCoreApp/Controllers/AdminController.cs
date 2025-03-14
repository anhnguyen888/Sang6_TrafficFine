using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Mvc;
using MyAspNetCoreApp.Models;
using MyAspNetCoreApp.ViewModels;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace MyAspNetCoreApp.Controllers
{
    [Authorize(Roles = "Admin")]
    public class AdminController : Controller
    {
        private readonly UserManager<ApplicationUser> _userManager;
        private readonly RoleManager<IdentityRole> _roleManager;

        public AdminController(
            UserManager<ApplicationUser> userManager,
            RoleManager<IdentityRole> roleManager)
        {
            _userManager = userManager;
            _roleManager = roleManager;
        }

        public IActionResult Index()
        {
            return View();
        }

        [HttpGet]
        public IActionResult UserList()
        {
            var users = _userManager.Users
                .Select(u => new UserViewModel
                {
                    Id = u.Id,
                    UserName = u.UserName,
                    Email = u.Email,
                    FirstName = u.FirstName,
                    LastName = u.LastName
                })
                .ToList();

            return View(users);
        }

        [HttpGet]
        public IActionResult RoleList()
        {
            var roles = _roleManager.Roles
                .Select(r => new RoleViewModel
                {
                    Id = r.Id,
                    Name = r.Name
                })
                .ToList();

            return View(roles);
        }

        [HttpGet]
        public async Task<IActionResult> EditUserRoles(string userId)
        {
            var user = await _userManager.FindByIdAsync(userId);
            
            if (user == null)
            {
                return NotFound();
            }

            var model = new UserRolesViewModel
            {
                UserId = user.Id,
                UserName = user.UserName,
                Email = user.Email
            };

            // Get all available roles
            var roles = _roleManager.Roles.ToList();
            
            // Get roles this user belongs to
            var userRoles = await _userManager.GetRolesAsync(user);
            
            // Create role selections
            model.Roles = roles.Select(role => new RoleSelection
            {
                RoleId = role.Id,
                RoleName = role.Name,
                IsSelected = userRoles.Contains(role.Name)
            }).ToList();

            return View(model);
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> EditUserRoles(UserRolesViewModel model)
        {
            var user = await _userManager.FindByIdAsync(model.UserId);
            
            if (user == null)
            {
                return NotFound();
            }

            var userRoles = await _userManager.GetRolesAsync(user);
            
            // Remove user from all selected roles
            await _userManager.RemoveFromRolesAsync(user, userRoles);

            // Add user to selected roles
            var selectedRoles = model.Roles.Where(r => r.IsSelected).Select(r => r.RoleName).ToList();
            
            await _userManager.AddToRolesAsync(user, selectedRoles);

            return RedirectToAction(nameof(UserList));
        }
    }
}
