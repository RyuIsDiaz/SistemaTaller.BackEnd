using SistemaTaller.BackEnd.API.Models;
using SistemaTaller.BackEnd.API.Services.Interfaces;
using SistemaTaller.BackEnd.API.UnitOfWork;

namespace SistemaTaller.BackEnd.API.Services
{
    public class ClientesService : IClientesService
    {
        private IUnitOfWork BD;

        public ClientesService(IUnitOfWork unitOfWork)
        {
         BD = unitOfWork;
        }
        public void Actualizar(Cliente model)
        {
            using (var bd = BD.Conectar())
            {
                bd.Repositories.ClientesRepository.Actualizar(model);

                bd.SaveChanges();
            }
        }

        public void Eliminar(String id)
        {
            using (var bd = BD.Conectar())
            {
                bd.Repositories.ClientesRepository.Eliminar(id);

                bd.SaveChanges();
            }
        }

        public void Insertar(Cliente model)
        {
            using (var bd = BD.Conectar())
            {
                bd.Repositories.ClientesRepository.Insertar(model);

                bd.SaveChanges();
            }
        }

        public Cliente SeleccionarPorId(String id)
        {
            Cliente ClienteSeleccionado = new();

            using (var bd = BD.Conectar())
            {
                ClienteSeleccionado = bd.Repositories.ClientesRepository.SeleccionarPorId(id);

                bd.SaveChanges();
            }

            return ClienteSeleccionado;
        }

        public List<Cliente> SeleccionarTodos()
        {
            List<Cliente> ListaTodosLosClientes;

            using (var bd = BD.Conectar())
            {
                ListaTodosLosClientes = bd.Repositories.ClientesRepository.SeleccionarTodos();

                bd.SaveChanges();
            }

            return ListaTodosLosClientes;
        }
    }
}
