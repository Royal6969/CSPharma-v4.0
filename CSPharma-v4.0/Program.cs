using CSPharma_v4._0_DAL.DataContexts;
using Microsoft.EntityFrameworkCore;

var builder = WebApplication.CreateBuilder(args);

// Add services to the container.
builder.Services.AddControllersWithViews();

// A�adimos nuestra conexi�n a la BBDD de PostgreSQL
builder.Services.AddEntityFrameworkNpgsql()
    .AddDbContext<CspharmaInformacionalContext>(options =>
    {
        options.UseNpgsql(builder.Configuration.GetConnectionString("PostgreSqlConnection"));
    });

AppContext.SetSwitch("Npgsql.EnableLegacyTimestampBehavior", true); // para evitar posibles errores en la vista Create por el Datetime
// AppContext.SetSwitch("Npgsql.DisableDateTimeInfinityConversions", true); // desactiva todas las conversiones del Datetime
// https://www.npgsql.org/doc/types/datetime.html

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

app.UseAuthorization();

app.MapControllerRoute(
    name: "default",
    pattern: "{controller=Home}/{action=Index}/{id?}");

app.Run();
