using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace MyAspNetCoreApp.Models;

public partial class Vehicle
{
    public int VehicleId { get; set; }

    [Required]
    [StringLength(20)]
    public string LicensePlate { get; set; } = null!;

    [Required]
    [StringLength(100)]
    public string OwnerName { get; set; } = null!;

    [Required]
    [Display(Name = "Vehicle Type")]
    public int VehicleTypeId { get; set; }

    public DateOnly RegistrationDate { get; set; }

    // Navigation property
    public virtual VehicleType? VehicleType { get; set; }

    public virtual ICollection<Violation> Violations { get; set; } = new List<Violation>();
}
