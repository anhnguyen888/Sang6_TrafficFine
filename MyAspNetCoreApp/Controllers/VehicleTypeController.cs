using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using MyAspNetCoreApp.Models;

namespace MyAspNetCoreApp.Controllers
{
    // [Authorize(Roles = "Admin,Manager")]
    public class VehicleTypeController : Controller
    {
        private readonly TrafficViolationDbContext _context;

        public VehicleTypeController(TrafficViolationDbContext context)
        {
            _context = context;
        }

        // GET: VehicleType
        public async Task<IActionResult> Index()
        {
            return View(await _context.VehicleTypes.ToListAsync());
        }

        // GET: VehicleType/Create
        public IActionResult Create()
        {
            return View();
        }

        // POST: VehicleType/Create
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Create([Bind("Name,Description")] VehicleType vehicleType)
        {
            if (ModelState.IsValid)
            {
                _context.Add(vehicleType);
                await _context.SaveChangesAsync();
                return RedirectToAction(nameof(Index));
            }
            return View(vehicleType);
        }

        // GET: VehicleType/Edit/5
        public async Task<IActionResult> Edit(int? id)
        {
            if (id == null)
            {
                return NotFound();
            }

            var vehicleType = await _context.VehicleTypes.FindAsync(id);
            if (vehicleType == null)
            {
                return NotFound();
            }
            return View(vehicleType);
        }

        // POST: VehicleType/Edit/5
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Edit(int id, [Bind("VehicleTypeId,Name,Description")] VehicleType vehicleType)
        {
            if (id != vehicleType.VehicleTypeId)
            {
                return NotFound();
            }

            if (ModelState.IsValid)
            {
                try
                {
                    _context.Update(vehicleType);
                    await _context.SaveChangesAsync();
                }
                catch (DbUpdateConcurrencyException)
                {
                    if (!VehicleTypeExists(vehicleType.VehicleTypeId))
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
            return View(vehicleType);
        }

        // GET: VehicleType/Delete/5
        [Authorize(Roles = "Admin")]
        public async Task<IActionResult> Delete(int? id)
        {
            if (id == null)
            {
                return NotFound();
            }

            var vehicleType = await _context.VehicleTypes
                .FirstOrDefaultAsync(m => m.VehicleTypeId == id);
            if (vehicleType == null)
            {
                return NotFound();
            }

            return View(vehicleType);
        }

        // POST: VehicleType/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        // [Authorize(Roles = "Admin")]
        public async Task<IActionResult> DeleteConfirmed(int id)
        {
            var vehicleType = await _context.VehicleTypes.FindAsync(id);
            if (vehicleType != null)
            {
                _context.VehicleTypes.Remove(vehicleType);
                await _context.SaveChangesAsync();
            }
            return RedirectToAction(nameof(Index));
        }

        private bool VehicleTypeExists(int id)
        {
            return _context.VehicleTypes.Any(e => e.VehicleTypeId == id);
        }
    }
}