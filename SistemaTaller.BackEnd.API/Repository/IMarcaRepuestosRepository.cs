using SistemaTaller.BackEnd.API.Models;
using SistemaTaller.BackEnd.API.Repository.Actions;

namespace SistemaTaller.BackEnd.API.Repository
{
    public interface IMarcaRepuestosRepository : IObtenerRepository<MarcaRepuesto, int>, IInsertarRepository<MarcaRepuesto>, IActualizarRepository<MarcaRepuesto>, IEliminarRepository<int>
    {
    }
}
