using SistemaTaller.BackEnd.API.Models;

namespace SistemaTaller.BackEnd.API.Services.Interfaces
{
    public interface IRepuestoReparacionesService
    {
        List<RepuestoReparacion> SeleccionarTodos();
        RepuestoReparacion SeleccionarPorId(int id);
        void Insertar(RepuestoReparacion model);
        void Actualizar(RepuestoReparacion model);
        void Eliminar(int id);
    }
}
