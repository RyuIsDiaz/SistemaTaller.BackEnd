using SistemaTaller.BackEnd.API.Models;

namespace SistemaTaller.BackEnd.API.Services.Interfaces
{
    public interface IVehiculosClienteService
    {
        List<VehiculoCliente> SeleccionarTodos();
        VehiculoCliente SeleccionarPorId(int id);
        void Insertar(VehiculoCliente model);
        void Actualizar(VehiculoCliente model);
        void Eliminar(int id);
    }
}
