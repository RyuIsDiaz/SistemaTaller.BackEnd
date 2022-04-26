using SistemaTaller.BackEnd.API.Models;

namespace SistemaTaller.BackEnd.API.Services.Interfaces
{
    public interface IVehiculosService
    {
        List<Vehiculo> SeleccionarTodos();
        Vehiculo SeleccionarPorId(String id);
        void Insertar(Vehiculo model);
        void Actualizar(Vehiculo model);
        void Eliminar(String id);
    }
}
