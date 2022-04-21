using SistemaTaller.BackEnd.API.Models;
using SistemaTaller.BackEnd.API.Repository.Actions;

namespace SistemaTaller.BackEnd.API.Repository
{
    public interface IMecanicosRepository : IObtenerRepository<Mecanico, string>, IInsertarRepository<Mecanico>, IActualizarRepository<Mecanico>, IEliminarRepository<string>
    {
    }
}
