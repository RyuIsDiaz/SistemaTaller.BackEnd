using SistemaTaller.BackEnd.API.Models;

namespace SistemaTaller.BackEnd.API.Services.Interfaces
{
    public interface IMecanicosTallerService
    {
        List<MecanicoTaller> SeleccionarTodos();
        MecanicoTaller SeleccionarPorId(string id);
        void Insertar(MecanicoTaller model);
        void Actualizar(MecanicoTaller model);
        void Eliminar(string id);
    }
}
