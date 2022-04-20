namespace SistemaTaller.BackEnd.API.UnitOfWork.SqlServer
{
    public class UnitOfWorkSqlServer : IUnitOfWork
    {
        private readonly IConfiguration _configuration;

        public UnitOfWorkSqlServer(IConfiguration configuration = null)
        {
            _configuration = configuration;
        }

        public IUnitOfWorkAdapter Conectar()
        {
            var connectionString = _configuration.GetConnectionString("CnxSqlServer");

            return new UnitOfWorkSqlServerAdapter(connectionString);
        }
    }
}
