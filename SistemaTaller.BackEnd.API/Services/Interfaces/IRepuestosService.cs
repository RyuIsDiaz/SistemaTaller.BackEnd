using SistemaTaller.BackEnd.API.Models;

namespace SistemaTaller.BackEnd.API.Services.Interfaces
{
    public interface IRepuestosService
    {
        List<Repuesto> SeleccionarTodos();
        Repuesto SeleccionarPorId(String id);
        void Insertar(Repuesto model);
        void Actualizar(Repuesto model);
        void Eliminar(String id);
    }
}
