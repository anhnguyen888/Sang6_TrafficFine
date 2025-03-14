using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using MyAspNetCoreApp.Models;
using System.Linq;
using System.Threading.Tasks;

namespace MyAspNetCoreApp.Controllers
{
    public class VehicleController : Controller
    {
        private readonly TrafficViolationDbContext _context;

        public VehicleController(TrafficViolationDbContext context)
        {
            _context = context;
        }

        // Everyone can access this
        public async Task<IActionResult> Lookup()
        {
            return View();
        }

        // Requires the user to be authenticated
        [Authorize]
        public async Task<IActionResult> Index()
        {
            var vehicles = await _context.Vehicles.ToListAsync();
            return View(vehicles);
        }

        // Only managers and admins can create
        [Authorize(Roles = "Admin,Manager")]
        public IActionResult Create()
        {
            return View();
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        [Authorize(Roles = "Admin,Manager")]
        public async Task<IActionResult> Create(Vehicle vehicle)
        {
            if (ModelState.IsValid)
            {
                _context.Add(vehicle);
                await _context.SaveChangesAsync();
                return RedirectToAction(nameof(Index));
            }
            return View(vehicle);
        }

        // GET: Vehicle/Details/5
        public async Task<IActionResult> Details(int? id)
        {
            if (id == null)
            {
                return NotFound();
            }

            var vehicle = await _context.Vehicles
                .Include(v => v.Violations)
                .FirstOrDefaultAsync(m => m.VehicleId == id);
                
            if (vehicle == null)
            {
                return NotFound();
            }

            return View(vehicle);
        }

        // GET: Vehicle/Edit/5
        public async Task<IActionResult> Edit(int? id)
        {
            if (id == null)
            {
                return NotFound();
            }

            // var vehicle = await _context.Vehicles.FindAsync(id);
            var vehicle = await _context.Vehicles
                .FromSqlRaw("SELECT * FROM Vehicles WHERE VehicleId = {0}", id)
                .FirstOrDefaultAsync();
            if (vehicle == null)
            {
                return NotFound();
            }
            return View(vehicle);
        }

        // POST: Vehicle/Edit/5
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Edit(int id, [Bind("VehicleId,LicensePlate,OwnerName,VehicleType,RegistrationDate")] Vehicle vehicle)
        {
            if (id != vehicle.VehicleId)
            {
                return NotFound();
            }

            if (ModelState.IsValid)
            {
                try
                {
                    _context.Update(vehicle);
                    await _context.SaveChangesAsync();
                }
                catch (DbUpdateConcurrencyException)
                {
                    if (!VehicleExists(vehicle.VehicleId))
                    {
                        return NotFound();
                    }
                    else
                    {
                        throw;
                    }
                }
                return RedirectToAction(nameof(Index));
            }
            return View(vehicle);
        }

        // Only admins can delete
        [Authorize(Roles = "Admin")]
        public async Task<IActionResult> Delete(int? id)
        {
            if (id == null)
            {
                return NotFound();
            }

            var vehicle = await _context.Vehicles
                .FirstOrDefaultAsync(m => m.VehicleId == id);
            if (vehicle == null)
            {
                return NotFound();
            }

            return View(vehicle);
        }

        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        [Authorize(Roles = "Admin")]
        public async Task<IActionResult> DeleteConfirmed(int id)
        {
            var vehicle = await _context.Vehicles.FindAsync(id);
            if (vehicle != null)
            {
                _context.Vehicles.Remove(vehicle);
                await _context.SaveChangesAsync();
            }
            
            return RedirectToAction(nameof(Index));
        }

        // POST: Vehicle/Lookup
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Lookup(string licensePlate)
        {
            if (string.IsNullOrWhiteSpace(licensePlate))
            {
                ModelState.AddModelError("", "License plate is required");
                return View();
            }

            var violations = await _context.Violations
                .Include(v => v.Vehicle)
                .Where(v => v.Vehicle.LicensePlate.Contains(licensePlate))
                .ToListAsync();

            ViewBag.LicensePlate = licensePlate;
            return View("LookupResults", violations);
        }

        private bool VehicleExists(int id)
        {
            return _context.Vehicles.Any(e => e.VehicleId == id);
        }
    }
}
