using SistemaTaller.BackEnd.API.Models;
using SistemaTaller.BackEnd.API.Repository.Actions;

namespace SistemaTaller.BackEnd.API.Repository
{
    public interface IVehiculosClienteRepository : IObtenerRepository<VehiculoCliente, string>, IInsertarRepository<VehiculoCliente>, IActualizarRepository<VehiculoCliente>, IEliminarRepository<string>
    {
    }
}
