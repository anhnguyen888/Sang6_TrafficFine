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

    protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
#warning To protect potentially sensitive information in your connection string, you should move it out of source code. You can avoid scaffolding the connection string by using the Name= syntax to read it from configuration - see https://go.microsoft.com/fwlink/?linkid=2131148. For more guidance on storing connection strings, see https://go.microsoft.com/fwlink/?LinkId=723263.
        => optionsBuilder.UseSqlServer("Server=localhost\\SQLEXPRESS;Database=TrafficViolationDB;Trusted_Connection=True;MultipleActiveResultSets=true;TrustServerCertificate=true");

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
            entity.Property(e => e.VehicleType).HasMaxLength(50);
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

        OnModelCreatingPartial(modelBuilder);
    }

    partial void OnModelCreatingPartial(ModelBuilder modelBuilder);
}
