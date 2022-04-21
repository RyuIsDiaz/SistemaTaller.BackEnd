using SistemaTaller.BackEnd.API.Models;
using SistemaTaller.BackEnd.API.Repository.Actions;

namespace SistemaTaller.BackEnd.API.Repository
{
    public interface IRepuestoReparacionesRepository : IObtenerRepository<RepuestoReparacion, int>, IInsertarRepository<RepuestoReparacion>, IActualizarRepository<RepuestoReparacion>, IEliminarRepository<int>
    {
    }
}
