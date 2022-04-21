using SistemaTaller.BackEnd.API.Models;
using SistemaTaller.BackEnd.API.Repository.Actions;

namespace SistemaTaller.BackEnd.API.Repository
{
    public interface IEstadoReparacionesRepository : IObtenerRepository<EstadoReparacion, int>, IInsertarRepository<EstadoReparacion>, IActualizarRepository<EstadoReparacion>, IEliminarRepository<int>
    {
    }
}
