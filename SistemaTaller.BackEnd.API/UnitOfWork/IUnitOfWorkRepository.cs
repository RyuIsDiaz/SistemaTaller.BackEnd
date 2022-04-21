using SistemaTaller.BackEnd.API.Repository;

namespace SistemaTaller.BackEnd.API.UnitOfWork
{
    public interface IUnitOfWorkRepository
    {
        //Acá van todos los repositorios del sistema
        IClienteRepository ClientesRepository { get; }
        IEstadoReparacionesRepository EstadoReparacionesRepository { get; }
        IMarcaRepuestosRepository MarcaRepuestosRepository { get; }
        IMarcaVehiculosRepository MarcaVehiculosRepository { get; }
        IMecanicosRepository MecanicosRepository { get; }
        IMecanicosTallerRepository MecanicosTallerRepository { get; }
        IReparacionesRepository ReparacionesRepository { get; }
        IRepuestoReparacionesRepository RepuestoReparacionesRepository { get; }
        IRepuestosRepository RepuestosRepository { get; }
        ITalleresRepository TalleresRepository { get; }
        IVehiculosClienteRepository VehiculosClienteRepository { get; }
        IVehiculosRepository VehiculosRepository { get; }
    }
}
