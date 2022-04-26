using SistemaTaller.BackEnd.API.Models;

namespace SistemaTaller.BackEnd.API.Services.Interfaces
{
    public interface IClientesService
    {
        List<Cliente> SeleccionarTodos();
        Cliente SeleccionarPorId(String id);
        void Insertar(Cliente model);
        void Actualizar(Cliente model);
        void Eliminar(string id);
    }
}
