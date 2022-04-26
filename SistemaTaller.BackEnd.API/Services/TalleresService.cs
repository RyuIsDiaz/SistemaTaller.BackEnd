using SistemaTaller.BackEnd.API.Models;
using SistemaTaller.BackEnd.API.Services.Interfaces;
using SistemaTaller.BackEnd.API.UnitOfWork;

namespace SistemaTaller.BackEnd.API.Services
{
    public class TalleresService : ITalleresService
    {
        private IUnitOfWork BD;

        public TalleresService(IUnitOfWork unitOfWork)
        {
            BD = unitOfWork;
        }
        public void Actualizar(Taller model)
        {
            using (var bd = BD.Conectar())
            {
                bd.Repositories.TalleresRepository.Actualizar(model);

                bd.SaveChanges();
            }
        }

        public void Eliminar(int id)
        {
            using (var bd = BD.Conectar())
            {
                bd.Repositories.TalleresRepository.Eliminar(id);

                bd.SaveChanges();
            }
        }

        public void Insertar(Taller model)
        {
            using (var bd = BD.Conectar())
            {
                bd.Repositories.TalleresRepository.Insertar(model);

                bd.SaveChanges();
            }
        }

        public Taller SeleccionarPorId(int id)
        {
            Taller TallerSeleccionado = new();

            using (var bd = BD.Conectar())
            {
                TallerSeleccionado = bd.Repositories.TalleresRepository.SeleccionarPorId(id);

                bd.SaveChanges();
            }

            return TallerSeleccionado;
        }

        public List<Taller> SeleccionarTodos()
        {
            List<Taller> ListaTodosLosTalleres;

            using (var bd = BD.Conectar())
            {
                ListaTodosLosTalleres = bd.Repositories.TalleresRepository.SeleccionarTodos();

                bd.SaveChanges();
            }

            return ListaTodosLosTalleres;
        }
    }
}
