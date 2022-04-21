using SistemaTaller.BackEnd.API.Models;
using System.Data;
using System.Data.SqlClient;

namespace SistemaTaller.BackEnd.API.Repository.SqlServer
{
    public class ClienteRepository : ConexionBD, IClienteRepository
    {
        public ClienteRepository(SqlConnection context, SqlTransaction transaction)
        {
            this._context = context;
            this._transaction = transaction;
        }

        public void Actualizar(Cliente cliente)
        {
            //Asi se hace cuando son consultas planas, que no se usa SPs ni Funciones.
            //var query = "UPDATE Aula SET Horario = @Horario, CodigoCurso  = @CodigoCurso, FechaModificacion = @FechaModificacion, ModificadoPor = @ModificadoPor WHERE NumeroAula = @NumeroAula";
            //var command = CreateCommand(query);

            var query = "SP_Clientes_Actualizar";
            var command = CreateCommand(query);
            command.CommandType = System.Data.CommandType.StoredProcedure;

            command.Parameters.AddWithValue("@Identificacion", cliente.Identificacion);
            command.Parameters.AddWithValue("@Nombre", cliente.Nombre);
            command.Parameters.AddWithValue("@Apellidos", cliente.Apellidos);
            command.Parameters.AddWithValue("@Telefono", cliente.Telefono);
            command.Parameters.AddWithValue("@Email", cliente.Email);
            command.Parameters.AddWithValue("@Direccion", cliente.Direccion);
            command.Parameters.AddWithValue("@ModificadoPor", cliente.ModificadoPor);

            command.Parameters.Add("@DetalleError", SqlDbType.VarChar, 60).Direction = ParameterDirection.Output;
            command.Parameters.Add("@ExisteError", SqlDbType.Bit).Direction = ParameterDirection.Output;

            command.ExecuteNonQuery();

            bool ExisteError = Convert.ToBoolean(command.Parameters["@ExisteError"].Value);
            string? DetalleError = Convert.ToString(command.Parameters["@DetalleError"].Value);

            if (ExisteError)
            {
                throw new Exception(DetalleError);
            }
        }

        public void Eliminar(string id)
        {
            throw new NotImplementedException();
        }

        public void Insertar(Cliente cliente)
        {
            var query = "SP_Clientes_Insertar";
            var command = CreateCommand(query);
            command.CommandType = System.Data.CommandType.StoredProcedure;

            command.Parameters.AddWithValue("@Identificacion", cliente.Identificacion);
            command.Parameters.AddWithValue("@Nombre", cliente.Nombre);
            command.Parameters.AddWithValue("@Apellidos", cliente.Apellidos);
            command.Parameters.AddWithValue("@Telefono", cliente.Telefono);
            command.Parameters.AddWithValue("@Email", cliente.Email);
            command.Parameters.AddWithValue("@Direccion", cliente.Direccion);
            command.Parameters.AddWithValue("@CreadoPor", cliente.CreadoPor);

            command.Parameters.Add("@DetalleError", SqlDbType.VarChar, 60).Direction = ParameterDirection.Output;
            command.Parameters.Add("@ExisteError", SqlDbType.Bit).Direction = ParameterDirection.Output;

            command.ExecuteNonQuery();

            bool ExisteError = Convert.ToBoolean(command.Parameters["@ExisteError"].Value);
            string? DetalleError = Convert.ToString(command.Parameters["@DetalleError"].Value);

            if (ExisteError)
            {
                throw new Exception(DetalleError);
            }
        }

        public Cliente SeleccionarPorId(string Identificacion)
        {
            var query = "SELECT * FROM FN_Clientes_SeleccionarPorIdentificacion(@Identificacion)";

            var command = CreateCommand(query);

            command.Parameters.AddWithValue("@Identificacion", Identificacion);

            SqlDataReader reader = command.ExecuteReader();

            Cliente ClienteSeleccionado = new();

            while (reader.Read())
            {
                ClienteSeleccionado.Identificacion = Convert.ToString(reader["Identificacion"]);
                ClienteSeleccionado.Nombre = Convert.ToString(reader["Nombre"]);
                ClienteSeleccionado.Apellidos = Convert.ToString(reader["Apellidos"]);
                ClienteSeleccionado.Telefono = Convert.ToString(reader["Telefono"]);
                ClienteSeleccionado.Email = Convert.ToString(reader["Email"]);
                ClienteSeleccionado.Direccion = Convert.ToString(reader["Direccion"]);

                ClienteSeleccionado.Activo = Convert.ToBoolean(reader["Activo"]);
                ClienteSeleccionado.FechaCreacion = Convert.ToDateTime(reader["FechaCreacion"]);
                ClienteSeleccionado.FechaModificacion = (DateTime?)(reader.IsDBNull("FechaModificacion") ? null : reader["FechaModificacion"]);
                ClienteSeleccionado.CreadoPor = Convert.ToString(reader["CreadoPor"]);
                ClienteSeleccionado.ModificadoPor = Convert.ToString(reader["ModificadoPor"]);
            }

            reader.Close();

            return ClienteSeleccionado;
        }

        public List<Cliente> SeleccionarTodos()
        {
            var query = "SELECT * FROM FN_Clientes_SeleccionarTodos()";
            var command = CreateCommand(query);

            SqlDataReader reader = command.ExecuteReader();

            List<Cliente> ListaTodosLosClientes = new List<Cliente>();

            while (reader.Read())
            {
                Cliente ClienteSeleccionado = new();

                ClienteSeleccionado.Identificacion = Convert.ToString(reader["Identificacion"]);
                ClienteSeleccionado.Nombre = Convert.ToString(reader["Nombre"]);
                ClienteSeleccionado.Apellidos = Convert.ToString(reader["Apellidos"]);
                ClienteSeleccionado.Telefono = Convert.ToString(reader["Telefono"]);
                ClienteSeleccionado.Email = Convert.ToString(reader["Email"]);
                ClienteSeleccionado.Direccion = Convert.ToString(reader["Direccion"]);

                ClienteSeleccionado.Activo = Convert.ToBoolean(reader["Activo"]);
                ClienteSeleccionado.FechaCreacion = Convert.ToDateTime(reader["FechaCreacion"]);
                ClienteSeleccionado.FechaModificacion = (DateTime?)(reader.IsDBNull("FechaModificacion") ? null : reader["FechaModificacion"]);
                ClienteSeleccionado.CreadoPor = Convert.ToString(reader["CreadoPor"]);
                ClienteSeleccionado.ModificadoPor = Convert.ToString(reader["ModificadoPor"]);

                ListaTodosLosClientes.Add(ClienteSeleccionado);
            }

            reader.Close();

            return ListaTodosLosClientes;
        }
    }
}
