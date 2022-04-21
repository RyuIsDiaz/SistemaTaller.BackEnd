using SistemaTaller.BackEnd.API.Repository;
using SistemaTaller.BackEnd.API.Repository.SqlServer;
using System.Data.SqlClient;

namespace SistemaTaller.BackEnd.API.UnitOfWork.SqlServer
{
    public class UnitOfWorkSqlServerRepository : IUnitOfWorkRepository
    {
        //Acá van todos los otros repositorios
        //public IAulasRepository AulasRepository { get; }
        public IClienteRepository ClientesRepository { get; }
        public IEstadoReparacionesRepository EstadoReparacionesRepository { get; }
        public IMarcaRepuestosRepository MarcaRepuestosRepository { get; }
        public IMarcaVehiculosRepository MarcaVehiculosRepository { get; }
        public IMecanicosRepository MecanicosRepository { get; }
        public IMecanicosTallerRepository MecanicosTallerRepository { get; }
        public IReparacionesRepository ReparacionesRepository { get; }
        public IRepuestoReparacionesRepository RepuestoReparacionesRepository { get; }
        public IRepuestosRepository RepuestosRepository { get; }
        public ITalleresRepository TalleresRepository { get; }
        public IVehiculosClienteRepository VehiculosClienteRepository { get; }
        public IVehiculosRepository VehiculosRepository { get; }

        public UnitOfWorkSqlServerRepository(SqlConnection context, SqlTransaction transaction)
        {
            //Acá van todos los otros repositorios.

            ClientesRepository = new ClienteRepository(context, transaction);

        }

    }
}
