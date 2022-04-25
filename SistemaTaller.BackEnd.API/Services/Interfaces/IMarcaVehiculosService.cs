using SistemaTaller.BackEnd.API.Models;

namespace SistemaTaller.BackEnd.API.Services.Interfaces
{
    public interface IMarcaVehiculosService
    {
        List<MarcaVehiculo> SeleccionarTodos();
        MarcaVehiculo SeleccionarPorId(int id);
        void Insertar(MarcaVehiculo model);
        void Actualizar(MarcaVehiculo model);
        void Eliminar(int id);
    }
}
