using SistemaTaller.BackEnd.API.Models;
using SistemaTaller.BackEnd.API.Services.Interfaces;
using SistemaTaller.BackEnd.API.UnitOfWork;

namespace SistemaTaller.BackEnd.API.Services
{
    public class ReparacionesService : IReparacionesService
    {
        private IUnitOfWork BD;
        public ReparacionesService(IUnitOfWork unitOfWork)
        {
            BD = unitOfWork;
        }
        public void Actualizar(Reparacion model)
        {
            using (var bd = BD.Conectar())
            {
                bd.Repositories.ReparacionesRepository.Actualizar(model);

                bd.SaveChanges();
            }
        }

        public void Eliminar(int id)
        {
            using (var bd = BD.Conectar())
            {
                bd.Repositories.ReparacionesRepository.Eliminar(id);

                bd.SaveChanges();
            }
        }

        public void Insertar(Reparacion model)
        {
            using (var bd = BD.Conectar())
            {
                bd.Repositories.ReparacionesRepository.Insertar(model);

                bd.SaveChanges();
            }
        }

        public Reparacion SeleccionarPorId(int id)
        {
            Reparacion ReparacionSeleccionada = new();

            using (var bd = BD.Conectar())
            {
                ReparacionSeleccionada = bd.Repositories.ReparacionesRepository.SeleccionarPorId(id);

                bd.SaveChanges();
            }

            return ReparacionSeleccionada;
        }

        public List<Reparacion> SeleccionarTodos()
        {
            List<Reparacion> ListaTodasLasReparaciones;

            using (var bd = BD.Conectar())
            {
                ListaTodasLasReparaciones = bd.Repositories.ReparacionesRepository.SeleccionarTodos();

                bd.SaveChanges();
            }

            return ListaTodasLasReparaciones;
        }
    }
}
