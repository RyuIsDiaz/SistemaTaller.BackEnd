using SistemaTaller.BackEnd.API.Models;

namespace SistemaTaller.BackEnd.API.Services.Interfaces
{
    public interface IMarcaRepuestosService
    {
        List<MarcaRepuesto> SeleccionarTodos();
        MarcaRepuesto SeleccionarPorId(int id);
        void Insertar(MarcaRepuesto model);
        void Actualizar(MarcaRepuesto model);
        void Eliminar(int id);
    }
}
