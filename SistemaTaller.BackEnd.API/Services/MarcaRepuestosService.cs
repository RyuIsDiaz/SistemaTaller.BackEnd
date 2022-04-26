using SistemaTaller.BackEnd.API.Models;
using SistemaTaller.BackEnd.API.Services.Interfaces;
using SistemaTaller.BackEnd.API.UnitOfWork;

namespace SistemaTaller.BackEnd.API.Services
{
    public class MarcaRepuestosService : IMarcaRepuestosService
    {
        private IUnitOfWork BD;

        public MarcaRepuestosService(IUnitOfWork unitOfWork)
        {
            BD = unitOfWork;
        }

        public void Actualizar(MarcaRepuesto model)
        {
             using (var bd = BD.Conectar())
            {
                bd.Repositories.MarcaRepuestosRepository.Actualizar(model);

                bd.SaveChanges();
            }
        }

        public void Eliminar(int id)
        {
            using (var bd = BD.Conectar())
            {
                bd.Repositories.MarcaRepuestosRepository.Eliminar(id);

                bd.SaveChanges();
            }
        }

        public void Insertar(MarcaRepuesto model)
        {
            using (var bd = BD.Conectar())
            {
                bd.Repositories.MarcaRepuestosRepository.Insertar(model);

                bd.SaveChanges();
            }
        }

        public MarcaRepuesto SeleccionarPorId(int id)
        {
            MarcaRepuesto MarcaRepuestoSeleccionado = new();

            using (var bd = BD.Conectar())
            {
                MarcaRepuestoSeleccionado = bd.Repositories.MarcaRepuestosRepository.SeleccionarPorId(id);

                bd.SaveChanges();
            }

            return MarcaRepuestoSeleccionado;
        }

        public List<MarcaRepuesto> SeleccionarTodos()
        {
            List<MarcaRepuesto> ListaTodosLasMarcasDeRepuestos;

            using (var bd = BD.Conectar())
            {
                ListaTodosLasMarcasDeRepuestos = bd.Repositories.MarcaRepuestosRepository.SeleccionarTodos();

                bd.SaveChanges();
            }

            return ListaTodosLasMarcasDeRepuestos;
        }
    }
}
