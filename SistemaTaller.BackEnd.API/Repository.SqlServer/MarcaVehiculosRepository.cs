using SistemaTaller.BackEnd.API.Models;
using System.Data;
using System.Data.SqlClient;

namespace SistemaTaller.BackEnd.API.Repository.SqlServer
{
    public class MarcaVehiculosRepository : ConexionBD, IMarcaVehiculosRepository
    {
        public MarcaVehiculosRepository(SqlConnection context, SqlTransaction transaction)
        {
            this._context = context;
            this._transaction = transaction;
        }

        public void Actualizar(MarcaVehiculo marcaVehiculo)
        {
            //Asi se hace cuando son consultas planas, que no se usa SPs ni Funciones.
            //var query = "UPDATE Aula SET Horario = @Horario, CodigoCurso  = @CodigoCurso, FechaModificacion = @FechaModificacion, ModificadoPor = @ModificadoPor WHERE NumeroAula = @NumeroAula";
            //var command = CreateCommand(query);

            var query = "SP_MarcaVehiculos_Actualizar";
            var command = CreateCommand(query);
            command.CommandType = System.Data.CommandType.StoredProcedure;

            command.Parameters.AddWithValue("@Id", marcaVehiculo.Id);
            command.Parameters.AddWithValue("@Nombre", marcaVehiculo.Nombre);
            command.Parameters.AddWithValue("@ModificadoPor", marcaVehiculo.ModificadoPor);
            command.Parameters.AddWithValue("@Activo", marcaVehiculo.Activo);

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

        public void Eliminar(int id)
        {
            throw new NotImplementedException();
        }

        public void Insertar(MarcaVehiculo marcaVehiculo)
        {
            var query = "SP_MarcaVehiuclos_Insertar";
            var command = CreateCommand(query);
            command.CommandType = System.Data.CommandType.StoredProcedure;

            command.Parameters.AddWithValue("@Id", marcaVehiculo.Id);
            command.Parameters.AddWithValue("@Nombre", marcaVehiculo.Nombre);
            command.Parameters.AddWithValue("@CreadoPor", marcaVehiculo.CreadoPor);

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

        public MarcaVehiculo SeleccionarPorId(int id)
        {
            var query = "SELECT * FROM FN_Marcavehiculos_SeleccionarPorId(@Id)";

            var command = CreateCommand(query);

            command.Parameters.AddWithValue("@Id", id);

            SqlDataReader reader = command.ExecuteReader();

            MarcaVehiculo marcaVehiuculoSeleccionado = new();

            while (reader.Read())
            {
                marcaVehiuculoSeleccionado.Id = Convert.ToInt32(reader["Id"]);
                marcaVehiuculoSeleccionado.Nombre = (string)reader["Nombre"];

                marcaVehiuculoSeleccionado.Activo = Convert.ToBoolean(reader["Activo"]);
                marcaVehiuculoSeleccionado.FechaCreacion = Convert.ToDateTime(reader["FechaCreacion"]);
                marcaVehiuculoSeleccionado.FechaModificacion = (DateTime?)(reader.IsDBNull("FechaModificacion") ? null : reader["FechaModificacion"]);
                marcaVehiuculoSeleccionado.CreadoPor = (string)reader["CreadoPor"];
                marcaVehiuculoSeleccionado.ModificadoPor = (string)reader["ModificadoPor"];
            }

            reader.Close();

            return marcaVehiuculoSeleccionado;
        }

        public List<MarcaVehiculo> SeleccionarTodos()
        {
            var query = "SELECT * FROM FN_MarcaVehiculos_SeleccionarTodos()";
            var command = CreateCommand(query);

            SqlDataReader reader = command.ExecuteReader();

            List<MarcaVehiculo> ListaTodosLasMarcasVehiuclos = new List<MarcaVehiculo>();

            while (reader.Read())
            {
                MarcaVehiculo marcaVehiuculoSeleccionado = new();

                marcaVehiuculoSeleccionado.Id = Convert.ToInt32(reader["Id"]);
                marcaVehiuculoSeleccionado.Nombre = (string)reader["Nombre"];

                marcaVehiuculoSeleccionado.Activo = Convert.ToBoolean(reader["Activo"]);
                marcaVehiuculoSeleccionado.FechaCreacion = Convert.ToDateTime(reader["FechaCreacion"]);
                marcaVehiuculoSeleccionado.FechaModificacion = (DateTime?)(reader.IsDBNull("FechaModificacion") ? null : reader["FechaModificacion"]);
                marcaVehiuculoSeleccionado.CreadoPor = (string)reader["CreadoPor"];
                marcaVehiuculoSeleccionado.ModificadoPor = (string)reader["ModificadoPor"];

                ListaTodosLasMarcasVehiuclos.Add(marcaVehiuculoSeleccionado);
            }

            reader.Close();

            return ListaTodosLasMarcasVehiuclos;
        }
    }
}
