using System;
using System.Collections.Generic;
using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Identity.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore;

namespace MyAspNetCoreApp.Models;

public partial class TrafficViolationDbContext : IdentityDbContext<ApplicationUser>
{
    public TrafficViolationDbContext()
    {
    }

    public TrafficViolationDbContext(DbContextOptions<TrafficViolationDbContext> options)
        : base(options)
    {
    }

    public virtual DbSet<Vehicle> Vehicles { get; set; }

    public virtual DbSet<Violation> Violations { get; set; }

    public virtual DbSet<VehicleType> VehicleTypes { get; set; }

    protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
    {
        //todo: remove this before production
    }

    protected override void OnModelCreating(ModelBuilder modelBuilder)
    {
        base.OnModelCreating(modelBuilder); // This is important for Identity tables

        modelBuilder.Entity<Vehicle>(entity =>
        {
            entity.HasKey(e => e.VehicleId).HasName("PK__Vehicles__476B54B23C011882");

            entity.HasIndex(e => e.LicensePlate, "UQ__Vehicles__026BC15CA00AA89E").IsUnique();

            entity.Property(e => e.VehicleId).HasColumnName("VehicleID");
            entity.Property(e => e.LicensePlate).HasMaxLength(20);
            entity.Property(e => e.OwnerName).HasMaxLength(100);
            entity.Property(e => e.VehicleTypeId).HasColumnName("VehicleTypeID");

            entity.HasOne(d => d.VehicleType)
                .WithMany(p => p.Vehicles)
                .HasForeignKey(d => d.VehicleTypeId)
                .OnDelete(DeleteBehavior.Restrict)
                .HasConstraintName("FK_Vehicle_VehicleType");
        });

        modelBuilder.Entity<Violation>(entity =>
        {
            entity.HasKey(e => e.ViolationId).HasName("PK__Violatio__18B6DC289F2CEB85");

            entity.Property(e => e.ViolationId).HasColumnName("ViolationID");
            entity.Property(e => e.FineAmount).HasColumnType("decimal(10, 2)");
            entity.Property(e => e.IsPaid).HasDefaultValue(false);
            entity.Property(e => e.Location).HasMaxLength(200);
            entity.Property(e => e.VehicleId).HasColumnName("VehicleID");
            entity.Property(e => e.ViolationDate).HasColumnType("datetime");
            entity.Property(e => e.ViolationType).HasMaxLength(255);

            entity.HasOne(d => d.Vehicle).WithMany(p => p.Violations)
                .HasForeignKey(d => d.VehicleId)
                .HasConstraintName("FK_Vehicle_Violation");
        });

        modelBuilder.Entity<VehicleType>(entity =>
        {
            entity.HasKey(e => e.VehicleTypeId);
            entity.Property(e => e.Name).HasMaxLength(50).IsRequired();
            entity.Property(e => e.Description).HasMaxLength(255);
        });

        OnModelCreatingPartial(modelBuilder);
    }

    partial void OnModelCreatingPartial(ModelBuilder modelBuilder);
}
