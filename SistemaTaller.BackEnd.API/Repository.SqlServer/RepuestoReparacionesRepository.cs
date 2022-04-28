using SistemaTaller.BackEnd.API.Models;
using System.Data;
using System.Data.SqlClient;


namespace SistemaTaller.BackEnd.API.Repository.SqlServer
{
    public class RepuestoReparacionesRepository : ConexionBD, IRepuestoReparacionesRepository
    {
        public RepuestoReparacionesRepository(SqlConnection context, SqlTransaction transaction)
        {
            this._context = context;
            this._transaction = transaction;
        }

        public void Actualizar(RepuestoReparacion repuestoReparacion)
        {
            //Asi se hace cuando son consultas planas, que no se usa SPs ni Funciones.
            //var query = "UPDATE Aula SET Horario = @Horario, CodigoCurso  = @CodigoCurso, FechaModificacion = @FechaModificacion, ModificadoPor = @ModificadoPor WHERE NumeroAula = @NumeroAula";
            //var command = CreateCommand(query);

            var query = "SP_RepuestoReparaciones_Actualizar";
            var command = CreateCommand(query);
            command.CommandType = System.Data.CommandType.StoredProcedure;

            command.Parameters.AddWithValue("@IdReparaciones", repuestoReparacion.IdReparaciones);
            command.Parameters.AddWithValue("@ModificadoPor", repuestoReparacion.ModificadoPor);
            command.Parameters.AddWithValue("@Activo", repuestoReparacion.Activo);

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

        public void Insertar(RepuestoReparacion repuestoReparacion)
        {
            var query = "SP_RepuestoReparaciones_Insertar";
            var command = CreateCommand(query);
            command.CommandType = System.Data.CommandType.StoredProcedure;

            command.Parameters.AddWithValue("@IdReparaciones", repuestoReparacion.IdReparaciones);
            command.Parameters.AddWithValue("@CodigoRepuestos", repuestoReparacion.CodigoRepuestos);
            
            command.Parameters.AddWithValue("@CreadoPor", repuestoReparacion.CreadoPor);

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

      

        public RepuestoReparacion SeleccionarPorId(int IdReparaciones)
        {
            var query = "SELECT * FROM FN_RepuestoReparaciones_SeleccionarPorIdReparaciones(@IdReparaciones)";

            var command = CreateCommand(query);

            command.Parameters.AddWithValue("@IdReparaciones", IdReparaciones);

            SqlDataReader reader = command.ExecuteReader();

           RepuestoReparacion RepuestoReparadoSeleccionado = new();

            while (reader.Read())
            {
                RepuestoReparadoSeleccionado.IdReparaciones = Convert.ToInt32(reader["IdReparaciones"]);
                RepuestoReparadoSeleccionado.Activo = Convert.ToBoolean(reader["Activo"]);
                RepuestoReparadoSeleccionado.FechaCreacion = Convert.ToDateTime(reader["FechaCreacion"]);
                RepuestoReparadoSeleccionado.FechaModificacion = (DateTime?)(reader.IsDBNull("FechaModificacion") ? null : reader["FechaModificacion"]);
                RepuestoReparadoSeleccionado.CreadoPor = Convert.ToString(reader["CreadoPor"]);
                RepuestoReparadoSeleccionado.ModificadoPor = Convert.ToString(reader["ModificadoPor"]);
            }

            reader.Close();

            return RepuestoReparadoSeleccionado;
        }

        public List<RepuestoReparacion> SeleccionarTodos()
        {
            var query = "SELECT * FROM FN_RepuestoReparaciones_SeleccionarTodos()";
            var command = CreateCommand(query);

            SqlDataReader reader = command.ExecuteReader();

            List<RepuestoReparacion> ListaTodosLosRepuestosReparados= new List<RepuestoReparacion>();

            while (reader.Read())
            {
                RepuestoReparacion RepuestoReparadoSeleccionado = new();

                RepuestoReparadoSeleccionado.IdReparaciones = Convert.ToInt32(reader["IdReparaciones"]);
                RepuestoReparadoSeleccionado.CodigoRepuestos = Convert.ToString(reader["CodigoRepuestos"]);
                RepuestoReparadoSeleccionado.Activo = Convert.ToBoolean(reader["Activo"]);
                RepuestoReparadoSeleccionado.FechaCreacion = Convert.ToDateTime(reader["FechaCreacion"]);
                RepuestoReparadoSeleccionado.FechaModificacion = (DateTime?)(reader.IsDBNull("FechaModificacion") ? null : reader["FechaModificacion"]);
                RepuestoReparadoSeleccionado.CreadoPor = Convert.ToString(reader["CreadoPor"]);
                RepuestoReparadoSeleccionado.ModificadoPor = Convert.ToString(reader["ModificadoPor"]);

                ListaTodosLosRepuestosReparados.Add(RepuestoReparadoSeleccionado);
            }

            reader.Close();

            return ListaTodosLosRepuestosReparados;
        }
    }
}
