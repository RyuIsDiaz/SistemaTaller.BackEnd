using SistemaTaller.BackEnd.API.Models;
using System.Data;
using System.Data.SqlClient;

namespace SistemaTaller.BackEnd.API.Repository.SqlServer
{
    public class EstadoReparacionesRepository : ConexionBD, IClienteRepository
    {
        public EstadoReparacionesRepository(SqlConnection context, SqlTransaction transaction)
        {
            this._context = context;
            this._transaction = transaction;
        }

        public void Actualizar(EstadoReparacion estadoReparacion)
        {
            //Asi se hace cuando son consultas planas, que no se usa SPs ni Funciones.
            //var query = "UPDATE Aula SET Horario = @Horario, CodigoCurso  = @CodigoCurso, FechaModificacion = @FechaModificacion, ModificadoPor = @ModificadoPor WHERE NumeroAula = @NumeroAula";
            //var command = CreateCommand(query);

            var query = "SP_EstadosReparaciones_Actualizar";
            var command = CreateCommand(query);
            command.CommandType = System.Data.CommandType.StoredProcedure;

            command.Parameters.AddWithValue("@Id", estadoReparacion.Id);
            command.Parameters.AddWithValue("@Estados", estadoReparacion.Estados);
            command.Parameters.AddWithValue("@ModificadoPor", estadoReparacion.ModificadoPor);

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

        public void Insertar(EstadoReparacion estadoReparacion)
        {
            var query = "SP_EstadosReparaciones_Insertar";
            var command = CreateCommand(query);
            command.CommandType = System.Data.CommandType.StoredProcedure;

            command.Parameters.AddWithValue("@Id", estadoReparacion.Id);
            command.Parameters.AddWithValue("@Estados", estadoReparacion.Estados);
            command.Parameters.AddWithValue("@CreadoPor", estadoReparacion.CreadoPor);

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

        public EstadoReparacion SeleccionarPorId(int id)
        {
            var query = "SELECT * FROM FN_EstadoReparaciones_SeleccionarPorId(@Id)";

            var command = CreateCommand(query);

            command.Parameters.AddWithValue("@Id", id);

            SqlDataReader reader = command.ExecuteReader();

            EstadoReparacion estadoReparacionSeleccionado = new();

            while (reader.Read())
            {
                estadoReparacionSeleccionado.Id = Convert.ToInt32(reader["Id"]);
                estadoReparacionSeleccionado.Estados = (string)reader["Nombre"];              

                estadoReparacionSeleccionado.Activo = Convert.ToBoolean(reader["Activo"]);
                estadoReparacionSeleccionado.FechaCreacion = Convert.ToDateTime(reader["FechaCreacion"]);
                estadoReparacionSeleccionado.FechaModificacion = (DateTime?)(reader.IsDBNull("FechaModificacion") ? null : reader["FechaModificacion"]);
                estadoReparacionSeleccionado.CreadoPor = (string)reader["CreadoPor"];
                estadoReparacionSeleccionado.ModificadoPor = (string)reader["ModificadoPor"];
            }

            reader.Close();

            return estadoReparacionSeleccionado;
        }

        public List<EstadoReparacion> SeleccionarTodos()
        {
            var query = "SELECT * FROM FN_EStadoReparaciones_SeleccionarTodos()";
            var command = CreateCommand(query);

            SqlDataReader reader = command.ExecuteReader();

            List<EstadoReparacion> ListaTodosLosEstadoReparacion = new List<EstadoReparacion>();

            while (reader.Read())
            {
                EstadoReparacion estadoReparacionSeleccionado = new();

                estadoReparacionSeleccionado.Id = Convert.ToInt32(reader["Id"]);
                estadoReparacionSeleccionado.Estados = (string)reader["Nombre"];

                estadoReparacionSeleccionado.Activo = Convert.ToBoolean(reader["Activo"]);
                estadoReparacionSeleccionado.FechaCreacion = Convert.ToDateTime(reader["FechaCreacion"]);
                estadoReparacionSeleccionado.FechaModificacion = (DateTime?)(reader.IsDBNull("FechaModificacion") ? null : reader["FechaModificacion"]);
                estadoReparacionSeleccionado.CreadoPor = (string)reader["CreadoPor"];
                estadoReparacionSeleccionado.ModificadoPor = (string)reader["ModificadoPor"];

                ListaTodosLosEstadoReparacion.Add(estadoReparacionSeleccionado);
            }

            reader.Close();

            return ListaTodosLosEstadoReparacion;
        }
    }
}

