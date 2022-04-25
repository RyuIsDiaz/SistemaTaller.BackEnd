using SistemaTaller.BackEnd.API.Models;

namespace SistemaTaller.BackEnd.API.Services.Interfaces
{
    public interface IEstadoReparacionesService
    {
        List<EstadoReparacion> SeleccionarTodos();
        EstadoReparacion SeleccionarPorId(int id);
        void Insertar(EstadoReparacion model);
        void Actualizar(EstadoReparacion model);
        void Eliminar(int id);
    }
}
