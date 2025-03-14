using Microsoft.EntityFrameworkCore;
using MyAspNetCoreApp.Models;
using System.Text.Json.Serialization;
using Microsoft.AspNetCore.Identity;
using MyAspNetCoreApp;

var builder = WebApplication.CreateBuilder(args);

// Add services to the container.
builder.Services.AddControllersWithViews();

// Thêm DbContext
builder.Services.AddDbContext<TrafficViolationDbContext>(options =>
    options.UseSqlServer(builder.Configuration.GetConnectionString("DefaultConnection")));

// Add Identity services
builder.Services.AddIdentity<ApplicationUser, IdentityRole>(options => {
    // Password settings
    options.Password.RequireDigit = true;
    options.Password.RequireLowercase = true;
    options.Password.RequireNonAlphanumeric = true;
    options.Password.RequireUppercase = true;
    options.Password.RequiredLength = 8;
    
    // Lockout settings
    options.Lockout.DefaultLockoutTimeSpan = TimeSpan.FromMinutes(15);
    options.Lockout.MaxFailedAccessAttempts = 5;
    
    // User settings
    options.User.RequireUniqueEmail = true;
})
.AddEntityFrameworkStores<TrafficViolationDbContext>()
.AddDefaultTokenProviders();

// Add Authorization Policies
builder.Services.AddAuthorization(options =>
{
    options.AddPolicy("RequireAdminRole", policy => policy.RequireRole("Admin"));
    options.AddPolicy("RequireManagerRole", policy => policy.RequireRole("Manager"));
    options.AddPolicy("RequireAdminOrManagerRole", policy => policy.RequireRole("Admin", "Manager"));
    options.AddPolicy("RequireLoggedInUser", policy => policy.RequireAuthenticatedUser());
});

// Add cookie settings
builder.Services.ConfigureApplicationCookie(options =>
{
    options.Cookie.HttpOnly = true;
    options.ExpireTimeSpan = TimeSpan.FromMinutes(60);
    options.LoginPath = "/Account/Login";
    options.LogoutPath = "/Account/Logout";
    options.AccessDeniedPath = "/Account/AccessDenied";
    options.SlidingExpiration = true;
});

// Add JSON serialization options
builder.Services.AddControllers().AddJsonOptions(options =>
{
    options.JsonSerializerOptions.ReferenceHandler = ReferenceHandler.IgnoreCycles;
    options.JsonSerializerOptions.Converters.Add(new JsonStringEnumConverter());
});

var app = builder.Build();

// Configure the HTTP request pipeline.
if (!app.Environment.IsDevelopment())
{
    app.UseExceptionHandler("/Home/Error");
    // The default HSTS value is 30 days. You may want to change this for production scenarios, see https://aka.ms/aspnetcore-hsts.
    app.UseHsts();
}

app.UseHttpsRedirection();
app.UseStaticFiles();
app.UseRouting();

app.UseAuthentication(); // Add this before UseAuthorization
app.UseAuthorization();

app.MapStaticAssets();

app.MapControllerRoute(
    name: "default",
    pattern: "{controller=Vehicle}/{action=Index}/{id?}");

// Create roles and admin user
using (var scope = app.Services.CreateScope())
{
    var services = scope.ServiceProvider;
    try
    {
        var userManager = services.GetRequiredService<UserManager<ApplicationUser>>();
        var roleManager = services.GetRequiredService<RoleManager<IdentityRole>>();
        SeedData.InitializeAsync(userManager, roleManager).Wait();
    }
    catch (Exception ex)
    {
        var logger = services.GetRequiredService<ILogger<Program>>();
        logger.LogError(ex, "An error occurred while seeding the database.");
    }
}

app.Run();
