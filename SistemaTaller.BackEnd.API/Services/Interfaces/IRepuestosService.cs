using SistemaTaller.BackEnd.API.Models;

namespace SistemaTaller.BackEnd.API.Services.Interfaces
{
    public interface IRepuestosService
    {
        List<Repuesto> SeleccionarTodos();
        Repuesto SeleccionarPorId(string id);
        void Insertar(Repuesto model);
        void Actualizar(Repuesto model);
        void Eliminar(string id);
    }
}
