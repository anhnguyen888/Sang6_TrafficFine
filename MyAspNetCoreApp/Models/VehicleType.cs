using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;

namespace MyAspNetCoreApp.Models;

public partial class VehicleType
{
    public int VehicleTypeId { get; set; }

    [Required]
    [StringLength(50)]
    public string Name { get; set; } = null!;

    [StringLength(255)]
    public string? Description { get; set; }

    public virtual ICollection<Vehicle> Vehicles { get; set; } = new List<Vehicle>();
}