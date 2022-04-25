using SistemaTaller.BackEnd.API.Models;

namespace SistemaTaller.BackEnd.API.Services.Interfaces
{
    public interface ITalleresService
    {
        List<Taller> SeleccionarTodos();
        Taller SeleccionarPorId(int id);
        void Insertar(Taller model);
        void Actualizar(Taller model);
        void Eliminar(int id);
    }
}
