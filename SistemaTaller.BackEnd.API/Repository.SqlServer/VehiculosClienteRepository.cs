using SistemaTaller.BackEnd.API.Models;
using System.Data;
using System.Data.SqlClient;

namespace SistemaTaller.BackEnd.API.Repository.SqlServer
{
    public class VehiculosClienteRepository : ConexionBD, IVehiculosClienteRepository
    {
        public VehiculosClienteRepository(SqlConnection context, SqlTransaction transaction)
        {
            this._context = context;
            this._transaction = transaction;
        }

        public void Actualizar(VehiculoCliente vehiculocliente)
        {
            //Asi se hace cuando son consultas planas, que no se usa SPs ni Funciones.
            //var query = "UPDATE Aula SET Horario = @Horario, CodigoCurso  = @CodigoCurso, FechaModificacion = @FechaModificacion, ModificadoPor = @ModificadoPor WHERE NumeroAula = @NumeroAula";
            //var command = CreateCommand(query);

            var query = "SP_VehiculosCliente_Actualizar";
            var command = CreateCommand(query);
            command.CommandType = System.Data.CommandType.StoredProcedure;

            command.Parameters.AddWithValue("@IdentificacionCliente", vehiculocliente.IdentificacionCliente);
            command.Parameters.AddWithValue("@ModificadoPor", vehiculocliente.ModificadoPor);

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

        public void Insertar(VehiculoCliente vehiculocliente)
        {
            var query = "SP_VehiculosCliente_Insertar";
            var command = CreateCommand(query);
            command.CommandType = System.Data.CommandType.StoredProcedure;

            command.Parameters.AddWithValue("@Placa", vehiculocliente.Placa);
            command.Parameters.AddWithValue("@IdentificacionCliente", vehiculocliente.IdentificacionCliente);
            command.Parameters.AddWithValue("@CreadoPor", vehiculocliente.CreadoPor);

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

        public VehiculoCliente SeleccionarPorId(int Id)
        {
            var query = "SELECT * FROM FN_VehiculosCliente_SeleccionarPorId(@IdentificacionCliente)";

            var command = CreateCommand(query);

            command.Parameters.AddWithValue("@IdentificacionCliente", Id);

            SqlDataReader reader = command.ExecuteReader();

            VehiculoCliente VehiculoClienteSeleccionado = new();

            while (reader.Read())
            {
                VehiculoClienteSeleccionado.IdentificacionCliente = Convert.ToString(reader["IdentificacionCliente"]);
                VehiculoClienteSeleccionado.Placa = Convert.ToString(reader["Placa"]);
                VehiculoClienteSeleccionado.Activo = Convert.ToBoolean(reader["Activo"]);
                VehiculoClienteSeleccionado.FechaCreacion = Convert.ToDateTime(reader["FechaCreacion"]);
                VehiculoClienteSeleccionado.FechaModificacion = (DateTime?)(reader.IsDBNull("FechaModificacion") ? null : reader["FechaModificacion"]);
                VehiculoClienteSeleccionado.CreadoPor = Convert.ToString(reader["CreadoPor"]);
                VehiculoClienteSeleccionado.ModificadoPor = Convert.ToString(reader["ModificadoPor"]);
            }

            reader.Close();

            return VehiculoClienteSeleccionado;
        }

        public List<VehiculoCliente> SeleccionarTodos()
        {
            var query = "SELECT * FROM FN_VehiculosCliente_SeleccionarTodos()";
            var command = CreateCommand(query);

            SqlDataReader reader = command.ExecuteReader();

            List<VehiculoCliente> ListaTodosLosVehiculosCliente = new List<VehiculoCliente>();

            while (reader.Read())
            {
                VehiculoCliente VehiculoClienteSeleccionado = new();

                VehiculoClienteSeleccionado.Placa = Convert.ToString(reader["Placa"]);
                VehiculoClienteSeleccionado.IdentificacionCliente = Convert.ToString(reader["IdentificacionCliente"]);
                VehiculoClienteSeleccionado.Activo = Convert.ToBoolean(reader["Activo"]);
                VehiculoClienteSeleccionado.FechaCreacion = Convert.ToDateTime(reader["FechaCreacion"]);
                VehiculoClienteSeleccionado.FechaModificacion = (DateTime?)(reader.IsDBNull("FechaModificacion") ? null : reader["FechaModificacion"]);
                VehiculoClienteSeleccionado.CreadoPor = Convert.ToString(reader["CreadoPor"]);
                VehiculoClienteSeleccionado.ModificadoPor = Convert.ToString(reader["ModificadoPor"]);


                ListaTodosLosVehiculosCliente.Add(VehiculoClienteSeleccionado);
            }

            reader.Close();

            return ListaTodosLosVehiculosCliente;
        }

    }

}   


