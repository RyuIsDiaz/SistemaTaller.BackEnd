using SistemaTaller.BackEnd.API.Models;
using SistemaTaller.BackEnd.API.Services.Interfaces;
using SistemaTaller.BackEnd.API.UnitOfWork;

namespace SistemaTaller.BackEnd.API.Services
{
    public class MecanicosTallerService : IMecanicosTallerService
    {
        private IUnitOfWork BD;
        public MecanicosTallerService(IUnitOfWork unitOfWork)
        {
            BD = unitOfWork;
        }
        public void Actualizar(MecanicoTaller model)
        {
            using (var bd = BD.Conectar())
            {
                bd.Repositories.MecanicosTallerRepository.Actualizar(model);

                bd.SaveChanges();
            }
        }

        public void Eliminar(string id)
        {
            using (var bd = BD.Conectar())
            {
                bd.Repositories.MecanicosTallerRepository.Eliminar(id);

                bd.SaveChanges();
            }
        }

        public void Insertar(MecanicoTaller model)
        {
            using (var bd = BD.Conectar())
            {
                bd.Repositories.MecanicosTallerRepository.Insertar(model);

                bd.SaveChanges();
            }
        }

        public MecanicoTaller SeleccionarPorId(string id)
        {
            MecanicoTaller MecanicoTallerSeleccionado = new();

            using (var bd = BD.Conectar())
            {
                MecanicoTallerSeleccionado = bd.Repositories.MecanicosTallerRepository.SeleccionarPorId(id);

                bd.SaveChanges();
            }

            return MecanicoTallerSeleccionado;
        }

        public List<MecanicoTaller> SeleccionarTodos()
        {
            List<MecanicoTaller> ListaTodosLosMecanicoTaller;

            using (var bd = BD.Conectar())
            {
                ListaTodosLosMecanicoTaller = bd.Repositories.MecanicosTallerRepository.SeleccionarTodos();

                bd.SaveChanges();
            }

            return ListaTodosLosMecanicoTaller;
        }
    }
}
