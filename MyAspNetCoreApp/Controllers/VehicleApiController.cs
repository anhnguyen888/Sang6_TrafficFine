using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using MyAspNetCoreApp.Models;

namespace MyAspNetCoreApp.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class VehicleApiController : ControllerBase
    {
        private readonly TrafficViolationDbContext _context;

        public VehicleApiController(TrafficViolationDbContext context)
        {
            _context = context;
        }

        // GET: http://localhost:5202/api/VehicleApi
        [HttpGet]
        public async Task<ActionResult<IEnumerable<Vehicle>>> GetVehicles()
        {
            return await _context.Vehicles.ToListAsync();
        }

        // GET: api/VehicleApi/5
        [HttpGet("{id}")]
        public async Task<ActionResult<Vehicle>> GetVehicle(int id)
        {
            var vehicle = await _context.Vehicles
                .Include(v => v.Violations)
                .FirstOrDefaultAsync(v => v.VehicleId == id);

            if (vehicle == null)
            {
                return NotFound();
            }

            return vehicle;
        }

        // GET: api/VehicleApi/plate/ABC123
        [HttpGet("plate/{licensePlate}")]
        public async Task<ActionResult<Vehicle>> GetVehicleByLicensePlate(string licensePlate)
        {
            var vehicle = await _context.Vehicles
                .FirstOrDefaultAsync(v => v.LicensePlate == licensePlate);

            if (vehicle == null)
            {
                return NotFound();
            }

            return vehicle;
        }

        // PUT: api/VehicleApi/5
        [HttpPut("{id}")]
        public async Task<IActionResult> PutVehicle(int id, Vehicle vehicle)
        {
            if (id != vehicle.VehicleId)
            {
                return BadRequest();
            }

            _context.Entry(vehicle).State = EntityState.Modified;

            try
            {
                await _context.SaveChangesAsync();
            }
            catch (DbUpdateConcurrencyException)
            {
                if (!VehicleExists(id))
                {
                    return NotFound();
                }
                else
                {
                    throw;
                }
            }

            return NoContent();
        }

        // POST: api/VehicleApi
        [HttpPost]
        public async Task<ActionResult<Vehicle>> PostVehicle(Vehicle vehicle)
        {
            _context.Vehicles.Add(vehicle);
            await _context.SaveChangesAsync();

            return CreatedAtAction("GetVehicle", new { id = vehicle.VehicleId }, vehicle);
        }

        // DELETE: api/VehicleApi/5
        [HttpDelete("{id}")]
        public async Task<IActionResult> DeleteVehicle(int id)
        {
            var vehicle = await _context.Vehicles.FindAsync(id);
            if (vehicle == null)
            {
                return NotFound();
            }

            _context.Vehicles.Remove(vehicle);
            await _context.SaveChangesAsync();

            return NoContent();
        }

        private bool VehicleExists(int id)
        {
            return _context.Vehicles.Any(e => e.VehicleId == id);
        }
    }
}
