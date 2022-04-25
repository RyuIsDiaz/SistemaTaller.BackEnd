using SistemaTaller.BackEnd.API.Models;

namespace SistemaTaller.BackEnd.API.Services.Interfaces
{
    public interface IReparacionesService
    {
        List<Reparacion> SeleccionarTodos();
        Reparacion SeleccionarPorId(int id);
        void Insertar(Reparacion model);
        void Actualizar(Reparacion model);
        void Eliminar(int id);
    }
}
