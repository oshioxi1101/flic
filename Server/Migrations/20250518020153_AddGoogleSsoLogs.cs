using System;
using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

#pragma warning disable CA1814 // Prefer jagged arrays over multidimensional

namespace Flic.Server.Migrations
{
    /// <inheritdoc />
    public partial class AddGoogleSsoLogs : Migration
    {
        /// <inheritdoc />
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DeleteData(
                table: "AspNetRoles",
                keyColumn: "Id",
                keyValue: "11ec8170-fceb-4a8e-8fb1-15463c2aa3a2");

            migrationBuilder.DeleteData(
                table: "AspNetRoles",
                keyColumn: "Id",
                keyValue: "28af4c4a-84cc-4d35-87a7-c5b12c4b9012");

            migrationBuilder.DeleteData(
                table: "AspNetRoles",
                keyColumn: "Id",
                keyValue: "5198c87e-b597-4837-b21d-079d91736800");

            migrationBuilder.DeleteData(
                table: "AspNetRoles",
                keyColumn: "Id",
                keyValue: "56ded522-0cc7-4e5a-b5d0-9e8c956b621e");

            migrationBuilder.DeleteData(
                table: "AspNetRoles",
                keyColumn: "Id",
                keyValue: "ce1cc22a-0514-4820-89fa-d3d679359547");

            migrationBuilder.CreateTable(
                name: "GoogleSsoLogs",
                columns: table => new
                {
                    Id = table.Column<int>(type: "int", nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    Email = table.Column<string>(type: "nvarchar(256)", maxLength: 256, nullable: false),
                    Status = table.Column<string>(type: "nvarchar(50)", maxLength: 50, nullable: false),
                    CreatedDate = table.Column<DateTime>(type: "datetime2", nullable: false),
                    ErrorMessage = table.Column<string>(type: "nvarchar(500)", maxLength: 500, nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_GoogleSsoLogs", x => x.Id);
                });

            migrationBuilder.InsertData(
                table: "AspNetRoles",
                columns: new[] { "Id", "ConcurrencyStamp", "Name", "NormalizedName" },
                values: new object[,]
                {
                    { "1a0d8032-7d85-4bf3-b838-2e45c749e053", "0c87b917-f443-4c4a-b9fa-87f65e6e8d6c", "Admin", "ADMIN" },
                    { "27cf2637-58c0-4e91-998a-cca27d431074", "1798a8db-9835-4b09-b010-e75b27a303f0", "Manager", "MANAGER" },
                    { "8f5b53c7-c9cd-41b8-9051-26809ec3be07", "3015bd87-8317-4931-acef-f6b6dd1e1213", "User", "USER" },
                    { "b76796dc-4653-45ad-8501-a98721d12fea", "9da69727-3c5a-4c6d-b271-1486ecbf24f0", "Student", "STUDENT" }
                });
        }

        /// <inheritdoc />
        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropTable(
                name: "GoogleSsoLogs");

            migrationBuilder.DeleteData(
                table: "AspNetRoles",
                keyColumn: "Id",
                keyValue: "1a0d8032-7d85-4bf3-b838-2e45c749e053");

            migrationBuilder.DeleteData(
                table: "AspNetRoles",
                keyColumn: "Id",
                keyValue: "27cf2637-58c0-4e91-998a-cca27d431074");

            migrationBuilder.DeleteData(
                table: "AspNetRoles",
                keyColumn: "Id",
                keyValue: "8f5b53c7-c9cd-41b8-9051-26809ec3be07");

            migrationBuilder.DeleteData(
                table: "AspNetRoles",
                keyColumn: "Id",
                keyValue: "b76796dc-4653-45ad-8501-a98721d12fea");

            migrationBuilder.InsertData(
                table: "AspNetRoles",
                columns: new[] { "Id", "ConcurrencyStamp", "Name", "NormalizedName" },
                values: new object[,]
                {
                    { "11ec8170-fceb-4a8e-8fb1-15463c2aa3a2", "078c0bfe-50fc-4f67-b57b-55efb0816952", "Manager", "MANAGER" },
                    { "28af4c4a-84cc-4d35-87a7-c5b12c4b9012", "e6b7414d-007f-43d8-b9fd-0827eb8f261d", "Admin", "ADMIN" },
                    { "5198c87e-b597-4837-b21d-079d91736800", "cf6d08a4-2df8-4a30-ae77-2391ae83451f", "User", "USER" },
                    { "56ded522-0cc7-4e5a-b5d0-9e8c956b621e", "05ce2622-b804-4dba-8d76-92f5b4d7f077", "Teacher", "TEACHER" },
                    { "ce1cc22a-0514-4820-89fa-d3d679359547", "b56d750d-6c7c-4506-b97f-39a3e2d32ea4", "Student", "STUDENT" }
                });
        }
    }
}
