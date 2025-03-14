using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace MyAspNetCoreApp.Migrations
{
    /// <inheritdoc />
    public partial class AddVehicleTypeTable : Migration
    {
        /// <inheritdoc />
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropColumn(
                name: "VehicleType",
                table: "Vehicles");

            migrationBuilder.AddColumn<int>(
                name: "VehicleTypeID",
                table: "Vehicles",
                type: "int",
                nullable: false,
                defaultValue: 0);

            migrationBuilder.CreateTable(
                name: "VehicleTypes",
                columns: table => new
                {
                    VehicleTypeId = table.Column<int>(type: "int", nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    Name = table.Column<string>(type: "nvarchar(50)", maxLength: 50, nullable: false),
                    Description = table.Column<string>(type: "nvarchar(255)", maxLength: 255, nullable: true)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_VehicleTypes", x => x.VehicleTypeId);
                });

            migrationBuilder.CreateIndex(
                name: "IX_Vehicles_VehicleTypeID",
                table: "Vehicles",
                column: "VehicleTypeID");

            migrationBuilder.AddForeignKey(
                name: "FK_Vehicle_VehicleType",
                table: "Vehicles",
                column: "VehicleTypeID",
                principalTable: "VehicleTypes",
                principalColumn: "VehicleTypeId",
                onDelete: ReferentialAction.Restrict);
        }

        /// <inheritdoc />
        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropForeignKey(
                name: "FK_Vehicle_VehicleType",
                table: "Vehicles");

            migrationBuilder.DropTable(
                name: "VehicleTypes");

            migrationBuilder.DropIndex(
                name: "IX_Vehicles_VehicleTypeID",
                table: "Vehicles");

            migrationBuilder.DropColumn(
                name: "VehicleTypeID",
                table: "Vehicles");

            migrationBuilder.AddColumn<string>(
                name: "VehicleType",
                table: "Vehicles",
                type: "nvarchar(50)",
                maxLength: 50,
                nullable: false,
                defaultValue: "");
        }
    }
}
