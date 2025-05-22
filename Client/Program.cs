global using Microsoft.AspNetCore.Components.Authorization;
using Blazored.LocalStorage;
using Flic;
using Flic.Client;
using Flic.Client.Services;
using Microsoft.AspNetCore.Components.Web;
using Microsoft.AspNetCore.Components.WebAssembly.Hosting;
using MudBlazor.Services;
using Radzen;

var builder = WebAssemblyHostBuilder.CreateDefault(args);
builder.RootComponents.Add<App>("#app");
builder.RootComponents.Add<HeadOutlet>("head::after");

// Configure HttpClient with the base address
builder.Services.AddScoped(sp => new HttpClient { BaseAddress = new Uri(builder.HostEnvironment.BaseAddress) });

// Add Blazored LocalStorage for storing JWT tokens
builder.Services.AddBlazoredLocalStorage();

// Add Authorization core services
builder.Services.AddAuthorizationCore();

// Add custom AuthenticationStateProvider for handling JWT tokens
builder.Services.AddScoped<AuthenticationStateProvider, ApiAuthenticationStateProvider>();
builder.Services.AddScoped<IAuthService, AuthService>();

// Add MudBlazor services
builder.Services.AddMudServices();

// Add Radzen services
builder.Services.AddScoped<DialogService>();
builder.Services.AddScoped<NotificationService>();
builder.Services.AddScoped<TooltipService>();
builder.Services.AddScoped<ContextMenuService>();

// Add NorthwindService (if applicable)
builder.Services.AddScoped<NorthwindService>();

// Build and run the application
await builder.Build().RunAsync();