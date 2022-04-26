using SistemaTaller.BackEnd.API.Models;
using SistemaTaller.BackEnd.API.Services.Interfaces;
using SistemaTaller.BackEnd.API.UnitOfWork;

namespace SistemaTaller.BackEnd.API.Services
{
    public class RepuestoReparacionesServices : IRepuestoReparacionesService
    {
        private IUnitOfWork BD;

        public RepuestoReparacionesServices(IUnitOfWork unitOfWork)
        {
            BD = unitOfWork;
        }
        public void Actualizar(RepuestoReparacion model)
        {
            using (var bd = BD.Conectar())
            {
                bd.Repositories.RepuestoReparacionesRepository.Actualizar(model);

                bd.SaveChanges();
            }
        }

        public void Eliminar(int id)
        {
            using (var bd = BD.Conectar())
            {
                bd.Repositories.RepuestoReparacionesRepository.Eliminar(id);

                bd.SaveChanges();
            }
        }

        public void Insertar(RepuestoReparacion model)
        {
            using (var bd = BD.Conectar())
            {
                bd.Repositories.RepuestoReparacionesRepository.Insertar(model);

                bd.SaveChanges();
            }
        }

        public RepuestoReparacion SeleccionarPorId(int id)
        {
            RepuestoReparacion RepuestoReparacionSeleccionado = new();

            using (var bd = BD.Conectar())
            {
                RepuestoReparacionSeleccionado = bd.Repositories.RepuestoReparacionesRepository.SeleccionarPorId(id);

                bd.SaveChanges();
            }

            return RepuestoReparacionSeleccionado;
        }

        public List<RepuestoReparacion> SeleccionarTodos()
        {
            List<RepuestoReparacion> ListaTodosRepuestoReparacion;

            using (var bd = BD.Conectar())
            {
                ListaTodosRepuestoReparacion = bd.Repositories.RepuestoReparacionesRepository.SeleccionarTodos();

                bd.SaveChanges();
            }

            return ListaTodosRepuestoReparacion;
        }
    }
}
