using SistemaTaller.BackEnd.API.Models;
using SistemaTaller.BackEnd.API.Services.Interfaces;
using SistemaTaller.BackEnd.API.UnitOfWork;

namespace SistemaTaller.BackEnd.API.Services
{
    public class RepuestosService : IRepuestosService
    {
        private IUnitOfWork BD;

        public RepuestosService(IUnitOfWork unitOfWork)
        {
            BD = unitOfWork;
        }
        public void Actualizar(Repuesto model)
        {
            using (var bd = BD.Conectar())
            {
                bd.Repositories.RepuestosRepository.Actualizar(model);

                bd.SaveChanges();
            }
        }

        public void Eliminar(string id)
        {
            using (var bd = BD.Conectar())
            {
                bd.Repositories.RepuestosRepository.Eliminar(id);

                bd.SaveChanges();
            }
        }

        public void Insertar(Repuesto model)
        {
            using (var bd = BD.Conectar())
            {
                bd.Repositories.RepuestosRepository.Insertar(model);

                bd.SaveChanges();
            }
        }

        public Repuesto SeleccionarPorId(string id)
        {
            Repuesto RepuestoSeleccionado = new();

            using (var bd = BD.Conectar())
            {
                RepuestoSeleccionado = bd.Repositories.RepuestosRepository.SeleccionarPorId(id);

                bd.SaveChanges();
            }

            return RepuestoSeleccionado;


        }
        public List<Repuesto> SeleccionarTodos()
        {
            List<Repuesto> ListaTodosLosRepuesto;
            using (var bd = BD.Conectar())
            {
                ListaTodosLosRepuesto = bd.Repositories.RepuestosRepository.SeleccionarTodos();

                bd.SaveChanges();
            }

            return ListaTodosLosRepuesto;
        }

    }
       
 }
