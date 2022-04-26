using SistemaTaller.BackEnd.API.Models;
using SistemaTaller.BackEnd.API.Services.Interfaces;
using SistemaTaller.BackEnd.API.UnitOfWork;

namespace SistemaTaller.BackEnd.API.Services
{
    public class EstadoReparacionesService : IEstadoReparacionesService
    {
        private IUnitOfWork BD;
        public EstadoReparacionesService(IUnitOfWork unitOfWork)
        {
            BD = unitOfWork;
        }
        public void Actualizar(EstadoReparacion model)
        {
            using (var bd = BD.Conectar())
            {
                bd.Repositories.EstadoReparacionesRepository.Actualizar(model);

                bd.SaveChanges();
            }
        }

        public void Eliminar(int id)
        {
            using (var bd = BD.Conectar())
            {
                bd.Repositories.EstadoReparacionesRepository.Eliminar(id);

                bd.SaveChanges();
            }
        }

        public void Insertar(EstadoReparacion model)
        {
            using (var bd = BD.Conectar())
            {
                bd.Repositories.EstadoReparacionesRepository.Insertar(model);

                bd.SaveChanges();
            }
        }

        public EstadoReparacion SeleccionarPorId(int id)
        {
            EstadoReparacion EstadoReparacionSeleccionado = new();

            using (var bd = BD.Conectar())
            {
                EstadoReparacionSeleccionado = bd.Repositories.EstadoReparacionesRepository.SeleccionarPorId(id);

                bd.SaveChanges();
            }

            return EstadoReparacionSeleccionado;
        }

        public List<EstadoReparacion> SeleccionarTodos()
        {
            List<EstadoReparacion> ListaTodosLosEstadosDeReparacion;

            using (var bd = BD.Conectar())
            {
                ListaTodosLosEstadosDeReparacion = bd.Repositories.EstadoReparacionesRepository.SeleccionarTodos();

                bd.SaveChanges();
            }

            return ListaTodosLosEstadosDeReparacion;
        }
    }
}
