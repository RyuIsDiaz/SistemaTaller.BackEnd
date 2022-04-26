using SistemaTaller.BackEnd.API.Models;

namespace SistemaTaller.BackEnd.API.Services.Interfaces
{
    public interface IMecanicosService
    {
        List<Mecanico> SeleccionarTodos();
        Mecanico SeleccionarPorId(String id);
        void Insertar(Mecanico model);
        void Actualizar(Mecanico model);
        void Eliminar(String id);
    }
}
