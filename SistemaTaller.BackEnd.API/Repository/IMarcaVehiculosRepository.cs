using SistemaTaller.BackEnd.API.Models;
using SistemaTaller.BackEnd.API.Repository.Actions;

namespace SistemaTaller.BackEnd.API.Repository
{
    public interface IMarcaVehiculosRepository : IObtenerRepository<MarcaVehiculo, int>, IInsertarRepository<MarcaVehiculo>, IActualizarRepository<MarcaVehiculo>, IEliminarRepository<int>
    {
    }
}
