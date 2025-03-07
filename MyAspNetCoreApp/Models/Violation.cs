using System;
using System.Collections.Generic;

namespace MyAspNetCoreApp.Models;

public partial class Violation
{
    public int ViolationId { get; set; }

    public int VehicleId { get; set; }

    public DateTime ViolationDate { get; set; }

    public string Location { get; set; } = null!;

    public string ViolationType { get; set; } = null!;

    public decimal FineAmount { get; set; }

    public bool? IsPaid { get; set; }

    public virtual Vehicle Vehicle { get; set; } = null!;
}
