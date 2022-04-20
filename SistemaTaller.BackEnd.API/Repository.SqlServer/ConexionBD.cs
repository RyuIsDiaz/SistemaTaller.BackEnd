using System.Data.SqlClient;

namespace SistemaTaller.BackEnd.API.Repository.SqlServer
{
    public abstract class ConexionBD
    {
        protected SqlConnection _context;
        protected SqlTransaction _transaction;

        protected SqlCommand CreateCommand(string query)
        {
            return new SqlCommand(query, _context, _transaction);
        }
    }
}
