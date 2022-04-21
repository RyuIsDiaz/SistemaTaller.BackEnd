using SistemaTaller.BackEnd.API.Models;
using SistemaTaller.BackEnd.API.Repository.Actions;

namespace SistemaTaller.BackEnd.API.Repository
{
    public interface IClienteRepository : IObtenerRepository<Cliente, string>, IInsertarRepository<Cliente>, IActualizarRepository<Cliente>, IEliminarRepository<string>
    {
    }
}
