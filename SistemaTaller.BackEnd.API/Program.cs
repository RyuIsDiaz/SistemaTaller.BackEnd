using SistemaTaller.BackEnd.API.Services;
using SistemaTaller.BackEnd.API.Services.Interfaces;
using SistemaTaller.BackEnd.API.UnitOfWork;
using SistemaTaller.BackEnd.API.UnitOfWork.SqlServer;

var builder = WebApplication.CreateBuilder(args);

// Add services to the container.

builder.Services.AddControllers();
// Learn more about configuring Swagger/OpenAPI at https://aka.ms/aspnetcore/swashbuckle
builder.Services.AddEndpointsApiExplorer();
builder.Services.AddSwaggerGen();

//Aca van todos los servicios de cada Entidad
builder.Services.AddTransient<IUnitOfWork, UnitOfWorkSqlServer>();
builder.Services.AddTransient<IClientesService, ClientesService>();
builder.Services.AddTransient<IEstadoReparacionesService, EstadoReparacionesService>();
builder.Services.AddTransient<IMarcaRepuestosService, MarcaRepuestosService>();
builder.Services.AddTransient<IMarcaVehiculosService, MarcaVehiculosServices>();
builder.Services.AddTransient<IMecanicosService, MecanicosService>();
builder.Services.AddTransient<IMecanicosTallerService, MecanicosTallerService>();
builder.Services.AddTransient<IReparacionesService, ReparacionesService>();
builder.Services.AddTransient<IRepuestoReparacionesService, RepuestoReparacionesServices>();
builder.Services.AddTransient<IRepuestosService, RepuestosService>();
builder.Services.AddTransient<ITalleresService, TalleresService>();
builder.Services.AddTransient<IVehiculosClienteService, VehiculosClienteService>();
builder.Services.AddTransient<IVehiculosService, VehiculosServices>();
var app = builder.Build();

// Configure the HTTP request pipeline.
if (app.Environment.IsDevelopment())
{
    app.UseSwagger();
    app.UseSwaggerUI();
}

app.UseHttpsRedirection();

app.UseAuthorization();

app.MapControllers();

app.Run();
