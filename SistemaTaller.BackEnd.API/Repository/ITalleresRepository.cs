using SistemaTaller.BackEnd.API.Models;
using SistemaTaller.BackEnd.API.Repository.Actions;

namespace SistemaTaller.BackEnd.API.Repository
{
    public interface ITalleresRepository : IObtenerRepository<Taller, int>, IInsertarRepository<Taller>, IActualizarRepository<Taller>, IEliminarRepository<int>
    {
    }
}
