using SistemaTaller.BackEnd.API.Models;
using SistemaTaller.BackEnd.API.Repository.Actions;

namespace SistemaTaller.BackEnd.API.Repository
{
    public interface IMecanicosTallerRepository : IObtenerRepository<MecanicoTaller, string>, IInsertarRepository<MecanicoTaller>, IActualizarRepository<MecanicoTaller>, IEliminarRepository<string>
    {
    }
}
