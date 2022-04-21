using SistemaTaller.BackEnd.API.Models;
using SistemaTaller.BackEnd.API.Repository.Actions;

namespace SistemaTaller.BackEnd.API.Repository
{
    public interface IVehiculosRepository : IObtenerRepository<Vehiculo, string>, IInsertarRepository<Vehiculo>, IActualizarRepository<Vehiculo>, IEliminarRepository<string>
    {
    }
}
