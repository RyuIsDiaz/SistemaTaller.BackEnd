using SistemaTaller.BackEnd.API.Models;
using SistemaTaller.BackEnd.API.Services.Interfaces;
using SistemaTaller.BackEnd.API.UnitOfWork;

namespace SistemaTaller.BackEnd.API.Services
{
    public class MarcaVehiculosServices : IMarcaVehiculosService
    {
        private IUnitOfWork BD;

        public MarcaVehiculosServices(IUnitOfWork unitOfWork)
        {
            BD = unitOfWork;
        }

        public void Actualizar(MarcaVehiculo model)
        {
            using (var bd = BD.Conectar())
            {
                bd.Repositories.MarcaVehiculosRepository.Actualizar(model);

                bd.SaveChanges();
            }
        }

        public void Eliminar(int id)
        {
            using (var bd = BD.Conectar())
            {
                bd.Repositories.MarcaVehiculosRepository.Eliminar(id);

                bd.SaveChanges();
            }
        }

        public void Insertar(MarcaVehiculo model)
        {
            using (var bd = BD.Conectar())
            {
                bd.Repositories.MarcaVehiculosRepository.Insertar(model);

                bd.SaveChanges();
            }
        }

        public MarcaVehiculo SeleccionarPorId(int id)
        {
            MarcaVehiculo MarcaVehiculoSeleccionado = new();

            using (var bd = BD.Conectar())
            {
                MarcaVehiculoSeleccionado = bd.Repositories.MarcaVehiculosRepository.SeleccionarPorId(id);

                bd.SaveChanges();
            }

            return MarcaVehiculoSeleccionado;
        }

        public List<MarcaVehiculo> SeleccionarTodos()
        {
            List<MarcaVehiculo> ListaTodasLasMarcaVehiculo;

            using (var bd = BD.Conectar())
            {
                ListaTodasLasMarcaVehiculo = bd.Repositories.MarcaVehiculosRepository.SeleccionarTodos();

                bd.SaveChanges();
            }

            return ListaTodasLasMarcaVehiculo;
        }
    }
}
