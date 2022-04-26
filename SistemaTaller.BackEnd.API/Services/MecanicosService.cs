using SistemaTaller.BackEnd.API.Models;
using SistemaTaller.BackEnd.API.Services.Interfaces;
using SistemaTaller.BackEnd.API.UnitOfWork;

namespace SistemaTaller.BackEnd.API.Services
{
    public class MecanicosService : IMecanicosService
    {
        private IUnitOfWork BD;
        public MecanicosService(IUnitOfWork unitOfWork)
        {
            BD = unitOfWork;
        }
        public void Actualizar(Mecanico model)
        {
            using (var bd = BD.Conectar())
            {
                bd.Repositories.MecanicosRepository.Actualizar(model);

                bd.SaveChanges();
            }
        }

        public void Eliminar(string id)
        {
            using (var bd = BD.Conectar())
            {
                bd.Repositories.MecanicosRepository.Eliminar(id);

                bd.SaveChanges();
            }
        }

        public void Insertar(Mecanico model)
        {
            using (var bd = BD.Conectar())
            {
                bd.Repositories.MecanicosRepository.Insertar(model);

                bd.SaveChanges();
            }
        }

        public Mecanico SeleccionarPorId(string id)
        {
            Mecanico MecanicoSeleccionado = new();

            using (var bd = BD.Conectar())
            {
                MecanicoSeleccionado = bd.Repositories.MecanicosRepository.SeleccionarPorId(id);

                bd.SaveChanges();
            }

            return MecanicoSeleccionado;
        }

        public List<Mecanico> SeleccionarTodos()
        {
            List<Mecanico> ListaTodosLosMecanicos;

            using (var bd = BD.Conectar())
            {
                ListaTodosLosMecanicos = bd.Repositories.MecanicosRepository.SeleccionarTodos();

                bd.SaveChanges();
            }

            return ListaTodosLosMecanicos;
        }
    }
}
