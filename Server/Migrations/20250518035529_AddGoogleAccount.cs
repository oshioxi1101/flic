using System;
using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

#pragma warning disable CA1814 // Prefer jagged arrays over multidimensional

namespace Flic.Server.Migrations
{
    /// <inheritdoc />
    public partial class AddGoogleAccount : Migration
    {
        /// <inheritdoc />
        protected override void Up(MigrationBuilder migrationBuilder)
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

            migrationBuilder.CreateTable(
                name: "GoogleAccounts",
                columns: table => new
                {
                    Id = table.Column<int>(type: "int", nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    GoogleId = table.Column<string>(type: "nvarchar(450)", nullable: false),
                    Email = table.Column<string>(type: "nvarchar(max)", nullable: false),
                    DisplayName = table.Column<string>(type: "nvarchar(max)", nullable: false),
                    PhotoUrl = table.Column<string>(type: "nvarchar(max)", nullable: false),
                    IdentityUserId = table.Column<string>(type: "nvarchar(450)", nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_GoogleAccounts", x => x.Id);
                    table.ForeignKey(
                        name: "FK_GoogleAccounts_AspNetUsers_IdentityUserId",
                        column: x => x.IdentityUserId,
                        principalTable: "AspNetUsers",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Cascade);
                });

            migrationBuilder.InsertData(
                table: "AspNetRoles",
                columns: new[] { "Id", "ConcurrencyStamp", "Name", "NormalizedName" },
                values: new object[,]
                {
                    { "33c610a3-913e-4fa2-b3e5-d03fb40633dc", "986c2c66-c1f9-41f3-b237-9448e3c65f42", "Admin", "ADMIN" },
                    { "3b67b8af-2951-4861-bafd-bebd3c95da6a", "6b0963ed-894a-484a-9419-e808f65747cc", "Student", "TEACHER" },
                    { "527abf9d-00e5-4247-8677-e4bc9e53fb2c", "d230098f-e67f-4940-9e07-88a5014f1e10", "User", "USER" },
                    { "65e67e52-e78a-4140-84e7-5292c120e76b", "d6d0694e-3564-4012-b881-0d2267e49cdb", "Student", "STUDENT" },
                    { "d9f414d1-1de0-4458-a2f4-fff1fe20746a", "e46703d3-08b7-4296-8456-94ecf89d0b0c", "Manager", "MANAGER" }
                });

            migrationBuilder.CreateIndex(
                name: "IX_GoogleAccounts_GoogleId",
                table: "GoogleAccounts",
                column: "GoogleId",
                unique: true);

            migrationBuilder.CreateIndex(
                name: "IX_GoogleAccounts_IdentityUserId",
                table: "GoogleAccounts",
                column: "IdentityUserId");
        }

        /// <inheritdoc />
        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropTable(
                name: "GoogleAccounts");

            migrationBuilder.DeleteData(
                table: "AspNetRoles",
                keyColumn: "Id",
                keyValue: "33c610a3-913e-4fa2-b3e5-d03fb40633dc");

            migrationBuilder.DeleteData(
                table: "AspNetRoles",
                keyColumn: "Id",
                keyValue: "3b67b8af-2951-4861-bafd-bebd3c95da6a");

            migrationBuilder.DeleteData(
                table: "AspNetRoles",
                keyColumn: "Id",
                keyValue: "527abf9d-00e5-4247-8677-e4bc9e53fb2c");

            migrationBuilder.DeleteData(
                table: "AspNetRoles",
                keyColumn: "Id",
                keyValue: "65e67e52-e78a-4140-84e7-5292c120e76b");

            migrationBuilder.DeleteData(
                table: "AspNetRoles",
                keyColumn: "Id",
                keyValue: "d9f414d1-1de0-4458-a2f4-fff1fe20746a");

            migrationBuilder.CreateTable(
                name: "GoogleSsoLogs",
                columns: table => new
                {
                    Id = table.Column<int>(type: "int", nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    CreatedDate = table.Column<DateTime>(type: "datetime2", nullable: false),
                    Email = table.Column<string>(type: "nvarchar(256)", maxLength: 256, nullable: false),
                    ErrorMessage = table.Column<string>(type: "nvarchar(500)", maxLength: 500, nullable: false),
                    Status = table.Column<string>(type: "nvarchar(50)", maxLength: 50, nullable: false)
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
    }
}
