using SistemaTaller.BackEnd.API.Models;
using SistemaTaller.BackEnd.API.Repository.Actions;

namespace SistemaTaller.BackEnd.API.Repository
{
    public interface IRepuestosRepository : IObtenerRepository<Repuesto, string>, IInsertarRepository<Repuesto>, IActualizarRepository<Repuesto>, IEliminarRepository<string>
    {
    }
}
