using System;
using System.Collections.Generic;

namespace MyAspNetCoreApp.Models;

public partial class Vehicle
{
    public int VehicleId { get; set; }

    public string LicensePlate { get; set; } = null!;

    public string OwnerName { get; set; } = null!;

    public string VehicleType { get; set; } = null!;

    public DateOnly RegistrationDate { get; set; }

    public virtual ICollection<Violation> Violations { get; set; } = new List<Violation>();
}
