using SistemaTaller.BackEnd.API.Models;
using SistemaTaller.BackEnd.API.Services.Interfaces;
using SistemaTaller.BackEnd.API.UnitOfWork;

namespace SistemaTaller.BackEnd.API.Services
{
    public class VehiculosServices : IVehiculosService
    {
        private IUnitOfWork BD;

        public VehiculosServices(IUnitOfWork unitOfWork)
        {
            BD = unitOfWork;
        }
        public void Actualizar(Vehiculo model)
        {
            using (var bd = BD.Conectar())
            {
                bd.Repositories.VehiculosRepository.Actualizar(model);

                bd.SaveChanges();
            }
        }

        public void Eliminar(string id)
        {
            using (var bd = BD.Conectar())
            {
                bd.Repositories.VehiculosRepository.Eliminar(id);

                bd.SaveChanges();
            }
        }

        public void Insertar(Vehiculo model)
        {
            using (var bd = BD.Conectar())
            {
                bd.Repositories.VehiculosRepository.Insertar(model);

                bd.SaveChanges();
            }
        }

        public Vehiculo SeleccionarPorId(string id)
        {
            Vehiculo VehiculoSeleccionado = new();

            using (var bd = BD.Conectar())
            {
                VehiculoSeleccionado = bd.Repositories.VehiculosRepository.SeleccionarPorId(id);

                bd.SaveChanges();
            }

            return VehiculoSeleccionado;
        }

        public List<Vehiculo> SeleccionarTodos()
        {
            List<Vehiculo> ListaTodosLosVehiculos;

            using (var bd = BD.Conectar())
            {
                ListaTodosLosVehiculos = bd.Repositories.VehiculosRepository.SeleccionarTodos();

                bd.SaveChanges();
            }

            return ListaTodosLosVehiculos;
        }
    }
}
