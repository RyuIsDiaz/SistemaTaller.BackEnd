using SistemaTaller.BackEnd.API.Models;
using SistemaTaller.BackEnd.API.Repository.Actions;

namespace SistemaTaller.BackEnd.API.Repository
{
    public interface IReparacionesRepository : IObtenerRepository<Reparacion, int>, IInsertarRepository<Reparacion>, IActualizarRepository<Reparacion>, IEliminarRepository<int>
    {
    }
}
