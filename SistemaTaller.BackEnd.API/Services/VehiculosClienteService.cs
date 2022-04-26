using SistemaTaller.BackEnd.API.Models;
using SistemaTaller.BackEnd.API.Services.Interfaces;
using SistemaTaller.BackEnd.API.UnitOfWork;

namespace SistemaTaller.BackEnd.API.Services
{
    public class VehiculosClienteService : IVehiculosClienteService
    {
        private IUnitOfWork BD;

        public VehiculosClienteService(IUnitOfWork unitOfWork)
        {
            BD = unitOfWork;
        }
        public void Actualizar(VehiculoCliente model)
        {
            using (var bd = BD.Conectar())
            {
                bd.Repositories.VehiculosClienteRepository.Actualizar(model);

                bd.SaveChanges();
            }
        }

        public void Eliminar(string id)
        {
            using (var bd = BD.Conectar())
            {
                bd.Repositories.VehiculosClienteRepository.Eliminar(id);

                bd.SaveChanges();
            }
        }

        public void Insertar(VehiculoCliente model)
        {
            using (var bd = BD.Conectar())
            {
                bd.Repositories.VehiculosClienteRepository.Insertar(model);

                bd.SaveChanges();
            }
        }

        public VehiculoCliente SeleccionarPorId(string id)
        {
            VehiculoCliente VehiculoClienteSeleccionado = new();

            using (var bd = BD.Conectar())
            {
                VehiculoClienteSeleccionado = bd.Repositories.VehiculosClienteRepository.SeleccionarPorId(id);

                bd.SaveChanges();
            }

            return VehiculoClienteSeleccionado;
        }

        public List<VehiculoCliente> SeleccionarTodos()
        {
            List<VehiculoCliente> ListaTodosLosVehiculoCliente;

            using (var bd = BD.Conectar())
            {
                ListaTodosLosVehiculoCliente = bd.Repositories.VehiculosClienteRepository.SeleccionarTodos();

                bd.SaveChanges();
            }

            return ListaTodosLosVehiculoCliente;
        }
    }
}
