using DinkToPdf;
using DinkToPdf.Contracts;
using Flic;
using Flic.Server.Configuration;
using Flic.Server.Data;
using Flic.Server.Interfaces;
using Flic.Server.Services;
using Flic.Shared;
using Microsoft.AspNetCore.Authentication.Cookies;
using Microsoft.AspNetCore.Authentication.Google;
using Microsoft.AspNetCore.Authentication.JwtBearer;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Http.Json;
using Microsoft.AspNetCore.Identity;
using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.FileProviders;
using Microsoft.IdentityModel.Tokens;
using Radzen;
using System.Text;

var builder = WebApplication.CreateBuilder(args);
ConfigurationManager configuration = builder.Configuration;

// === 1. Database ===
var connectionString = configuration.GetConnectionString("DefaultConnection")
                       ?? throw new InvalidOperationException("Connection string 'DefaultConnection' not found.");
builder.Services.AddDbContext<ApplicationDbContext>(options =>
{
    options.UseSqlServer(connectionString);
    options.UseQueryTrackingBehavior(QueryTrackingBehavior.NoTracking);
});

// === 2. Identity ===
builder.Services.AddIdentity<IdentityUser, IdentityRole>()
    .AddEntityFrameworkStores<ApplicationDbContext>()
    .AddDefaultTokenProviders();

builder.Services.Configure<IdentityOptions>(options =>
{
    options.Password.RequireDigit = false;
    options.Password.RequireLowercase = false;
    options.Password.RequireNonAlphanumeric = false;
    options.Password.RequireUppercase = false;
    options.Password.RequiredLength = 6;
    options.Password.RequiredUniqueChars = 0;
});

// === 3. Cookie Policy ===
builder.Services.AddCookiePolicy(options =>
{
    options.MinimumSameSitePolicy = SameSiteMode.Unspecified;
});

// === 4. Authentication & Google SSO ===
builder.Services.AddAuthentication(options =>
{
    // Cookies giữ state giữa các bước OAuth
    options.DefaultAuthenticateScheme = CookieAuthenticationDefaults.AuthenticationScheme;
    options.DefaultSignInScheme = CookieAuthenticationDefaults.AuthenticationScheme;
    // Khi challenge (ví dụ gọi [Authorize]) thì bật Google
    options.DefaultChallengeScheme = GoogleDefaults.AuthenticationScheme;
})
.AddCookie(CookieAuthenticationDefaults.AuthenticationScheme, cookieOptions =>
{
    cookieOptions.Cookie.Name = "FlicAuthCookie";
    cookieOptions.Cookie.HttpOnly = true;
    cookieOptions.Cookie.SameSite = SameSiteMode.Lax;      // QUAN TRỌNG: Để Lax, KHÔNG để None trên localhost!
    cookieOptions.Cookie.SecurePolicy = CookieSecurePolicy.Always;
})

.AddGoogle(GoogleDefaults.AuthenticationScheme, googleOptions =>
{
    googleOptions.SignInScheme = CookieAuthenticationDefaults.AuthenticationScheme;
    googleOptions.ClientId = configuration["Authentication:Google:ClientId"];
    googleOptions.ClientSecret = configuration["Authentication:Google:ClientSecret"];
    googleOptions.CallbackPath = "/api/GoogleAuth/callback";
    googleOptions.Scope.Add("profile");
    googleOptions.Scope.Add("email");

    // Cookie correlation
    googleOptions.CorrelationCookie.SameSite = SameSiteMode.Lax;   // QUAN TRỌNG
    googleOptions.CorrelationCookie.SecurePolicy = CookieSecurePolicy.Always;
    googleOptions.CorrelationCookie.HttpOnly = true;
    googleOptions.CorrelationCookie.Path = "/";
})
.AddJwtBearer(JwtBearerDefaults.AuthenticationScheme, jwtOptions =>
{
    jwtOptions.SaveToken = true;
    jwtOptions.RequireHttpsMetadata = false;
    jwtOptions.TokenValidationParameters = new TokenValidationParameters
    {
        ValidateIssuerSigningKey = true,
        IssuerSigningKey = new SymmetricSecurityKey(
            Encoding.UTF8.GetBytes(configuration["JwtSecurityKey"]!)),
        ValidateIssuer = true,
        ValidIssuer = configuration["JwtIssuer"]!,
        ValidateAudience = true,
        ValidAudience = configuration["JwtAudience"]!,
        ValidateLifetime = true,
    };
});

// === 5. CORS ===
builder.Services.AddCors(options =>
{
    options.AddPolicy("CorsPolicy", policy =>
    policy.WithOrigins("https://localhost:5021")
          .AllowAnyHeader()
          .AllowAnyMethod()
          .AllowCredentials());

});

// === 6. JSON options ===
builder.Services.Configure<JsonOptions>(options =>
{
    options.SerializerOptions.PropertyNameCaseInsensitive = true;
});

// === 7. CommonInfo & các service khác ===
CommonInfo.ConnectionString = connectionString;
CommonInfo.BankApiKey = configuration["BankApiKey"];
CommonInfo.PrivateKeyPath = configuration["PrivateKeyPath"];
CommonInfo.PublicKeyPath = configuration["PublicKeyPath"];
CommonInfo.PasswordPath = configuration["PasswordPath"];
CommonInfo.BankPublicKeyPath = configuration["BankPublicKeyPath"];
CommonInfo.PROVIDERID = configuration["PROVIDERID"];
CommonInfo.VTBPublicKeyPath = configuration["VTBPublicKeyPath"];
CommonInfo.config = configuration;

builder.Services.AddControllersWithViews();
builder.Services.AddRazorPages();

// Application services
builder.Services.AddTransient<IStudent, StudentManager>();
builder.Services.AddTransient<IKhoa, KhoaService>();
builder.Services.AddTransient<ILoaiKhoanthu, LoaiKhoanthuService>();
builder.Services.AddTransient<IKhoanthu, KhoanthuService>();
builder.Services.AddTransient<IThutien, ThutienService>();
builder.Services.AddTransient<IKhoahoc, KhoahocService>();
builder.Services.AddTransient<INganh, NganhService>();
builder.Services.AddTransient<ILop, LopService>();
builder.Services.AddTransient<IKyThanhtoan, KyThanhtoanService>();
builder.Services.AddTransient<IStudentStatus, StudentStatusManager>();
builder.Services.AddTransient<IPhongKTX, PhongKTXService>();
builder.Services.AddTransient<ISinhvienPhong, SinhvienPhongService>();
builder.Services.AddTransient<IDangkyTH03, DangkyTH03Service>();
builder.Services.AddTransient<IDMTinh, DMTinhService>();
builder.Services.AddTransient<IDMDantoc, DMDantocService>();
builder.Services.AddTransient<IDotthi, DotthiService>();
builder.Services.AddTransient<IDiemthi, DiemthiService>();
builder.Services.AddTransient<ITin03Trangthai, Tin03TrangthaiService>();
builder.Services.AddTransient<ISection, SectionService>();
builder.Services.AddTransient<IArticle, ArticleService>();
builder.Services.AddTransient<ILoaiLophoc, LoaiLophocService>();
builder.Services.AddTransient<ILophoc, LophocService>();
builder.Services.AddTransient<IDKHoc, DKHocService>();
builder.Services.AddScoped<IVnPayService, VnPayService>();
builder.Services.AddTransient<IEmailService, EmailService>();
builder.Services.AddScoped<NorthwindService>();

// Email
builder.Services.Configure<EmailSettings>(configuration.GetSection("EmailConfiguration"));

// PDF converter
builder.Services.AddSingleton(typeof(IConverter), new SynchronizedConverter(new PdfTools()));

// Radzen
builder.Services.AddScoped<Radzen.DialogService>();

// Logging
var sp = builder.Services.BuildServiceProvider();
var logger = sp.GetService<ILogger<Program>>();
builder.Services.AddSingleton(typeof(ILogger), logger);
builder.Logging.ClearProviders();
builder.Logging.AddConsole();

// === 8. Build & Pipeline ===
var app = builder.Build();

if (app.Environment.IsDevelopment())
{
    app.UseWebAssemblyDebugging();
}
else
{
    app.UseExceptionHandler("/Error");
    app.UseHsts();
}

app.UseHttpsRedirection();
app.UseCookiePolicy();
app.UseCors("CorsPolicy");
app.UseBlazorFrameworkFiles();
app.UseStaticFiles();
app.UseStaticFiles(new StaticFileOptions
{
    FileProvider = new PhysicalFileProvider(
        Path.Combine(Directory.GetCurrentDirectory(), "StaticFiles")),
    RequestPath = "/StaticFiles"
});

app.UseRouting();

// **Chèn Authentication & Authorization middleware**
app.UseAuthentication();
app.UseAuthorization();

app.MapRazorPages();
app.MapControllers();
app.MapFallbackToFile("index.html");

app.Run();
