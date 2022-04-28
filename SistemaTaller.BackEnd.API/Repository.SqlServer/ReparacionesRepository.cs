using SistemaTaller.BackEnd.API.Models;
using System.Data;
using System.Data.SqlClient;

namespace SistemaTaller.BackEnd.API.Repository.SqlServer
{
    public class ReparacionesRepository : ConexionBD, IReparacionesRepository
    {
        public ReparacionesRepository(SqlConnection context, SqlTransaction transaction)
        {
            this._context = context;
            this._transaction = transaction;
        }

        public void Actualizar(Reparacion reparacion)
        {
            //Asi se hace cuando son consultas planas, que no se usa SPs ni Funciones.
            //var query = "UPDATE Aula SET Horario = @Horario, CodigoCurso  = @CodigoCurso, FechaModificacion = @FechaModificacion, ModificadoPor = @ModificadoPor WHERE NumeroAula = @NumeroAula";
            //var command = CreateCommand(query);

            var query = "SP_Reparaciones_Actualizar";
            var command = CreateCommand(query);
            command.CommandType = System.Data.CommandType.StoredProcedure;

            command.Parameters.AddWithValue("@IdReparaciones", reparacion.IdReparaciones);
            command.Parameters.AddWithValue("@FechasIngreso", reparacion.FechasIngreso);
            command.Parameters.AddWithValue("@FechasSalidas", reparacion.FechasSalida);
            command.Parameters.AddWithValue("@PlacasVehiculos", reparacion.PlacasVehiculos);
            command.Parameters.AddWithValue("@DiagnosticosReparaciones", reparacion.ModificadoPor);
            command.Parameters.AddWithValue("@MontosDeObra", reparacion.MontosDeObra);
            command.Parameters.AddWithValue("@MontosRepuestos", reparacion.MontosRepuestos);
            command.Parameters.AddWithValue("@MontosTotales", reparacion.MontosTotales);
            command.Parameters.AddWithValue("@ModificadoPor", reparacion.ModificadoPor);
            command.Parameters.AddWithValue("@Activo", reparacion.Activo);
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

        public void Insertar(Reparacion reparacion)
        {
            var query = "SP_Reparaciones_Insertar";
            var command = CreateCommand(query);
            command.CommandType = System.Data.CommandType.StoredProcedure;

            command.Parameters.AddWithValue("@IdReparaciones", reparacion.IdReparaciones);
            command.Parameters.AddWithValue("@FechasIngreso", reparacion.FechasIngreso);
            command.Parameters.AddWithValue("@FechasSalidas", reparacion.FechasSalida);
            command.Parameters.AddWithValue("@PlacasVehiculos", reparacion.PlacasVehiculos);
            command.Parameters.AddWithValue("@IdMecanicos", reparacion.IdMecanicos);
            command.Parameters.AddWithValue("@DiagnosticosReparaciones", reparacion.ModificadoPor);
            command.Parameters.AddWithValue("@Id EstadosReparacion", reparacion.IdEstadosReparacion);
            command.Parameters.AddWithValue("@MontosDeObra", reparacion.MontosDeObra);
            command.Parameters.AddWithValue("@MontosRepuestos", reparacion.MontosRepuestos);
            command.Parameters.AddWithValue("@MontosTotales", reparacion.MontosTotales);
            command.Parameters.AddWithValue("@CreadoPor", reparacion.CreadoPor);
            
           


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

        public Reparacion SeleccionarPorId(int IdReparaciones)
        {
            var query = "SELECT * FROM FN_Reparaciones_SeleccionarPorIdReparaciones@IdReparaciones)";

            var command = CreateCommand(query);

            command.Parameters.AddWithValue("@IdReparaciones", IdReparaciones);

            SqlDataReader reader = command.ExecuteReader();

            Reparacion ReparacionSeleccionado = new();

            while (reader.Read())
            {
                ReparacionSeleccionado.IdReparaciones = Convert.ToInt32(reader["Identificacion"]);
                ReparacionSeleccionado.FechasIngreso = Convert.ToDateTime(reader["FechasIngreso"]);
                ReparacionSeleccionado.FechasSalida = Convert.ToDateTime(reader["FechasSalida"]);
                ReparacionSeleccionado.PlacasVehiculos = Convert.ToString(reader["PlacasVehiculos"]);
                ReparacionSeleccionado.DiagnosticosReparaciones = Convert.ToString(reader["DIagnosticosReparaciones"]);
                ReparacionSeleccionado.MontosDeObra = Convert.ToDecimal(reader["MontosDeObra"]);
                ReparacionSeleccionado.MontosRepuestos = Convert.ToDecimal(reader["MontosRepuestos"]);
                ReparacionSeleccionado.MontosTotales = Convert.ToDecimal(reader["MontosTotales"]);
                ReparacionSeleccionado.Activo = Convert.ToBoolean(reader["Activo"]);
                ReparacionSeleccionado.FechaCreacion = Convert.ToDateTime(reader["FechaCreacion"]);
                ReparacionSeleccionado.FechaModificacion = (DateTime?)(reader.IsDBNull("FechaModificacion") ? null : reader["FechaModificacion"]);
                ReparacionSeleccionado.CreadoPor = Convert.ToString(reader["CreadoPor"]);
                ReparacionSeleccionado.ModificadoPor = Convert.ToString(reader["ModificadoPor"]);
            }

            reader.Close();

            return ReparacionSeleccionado;
        }

        public List<Reparacion> SeleccionarTodos()
        {
            var query = "SELECT * FROM FN_Reparaciones_SeleccionarTodos()";
            var command = CreateCommand(query);

            SqlDataReader reader = command.ExecuteReader();

            List<Reparacion> ListaTodasLasReparaciones = new List<Reparacion>();

            while (reader.Read())
            {
               Reparacion ReparacionSeleccionado = new();

                ReparacionSeleccionado.IdReparaciones = Convert.ToInt32(reader["Identificacion"]);
                ReparacionSeleccionado.FechasIngreso = Convert.ToDateTime(reader["FechasIngreso"]);
                ReparacionSeleccionado.FechasSalida = Convert.ToDateTime(reader["FechasSalida"]);
                ReparacionSeleccionado.PlacasVehiculos = Convert.ToString(reader["PlacasVehiculos"]);
                ReparacionSeleccionado.IdMecanicos = Convert.ToString(reader["IdMecanicos"]);
                ReparacionSeleccionado.DiagnosticosReparaciones = Convert.ToString(reader["DIagnosticosReparaciones"]);
                ReparacionSeleccionado.IdEstadosReparacion = Convert.ToInt32(reader["IdEstadosReparacion"]);
                ReparacionSeleccionado.MontosDeObra = Convert.ToDecimal(reader["MontosDeObra"]);
                ReparacionSeleccionado.MontosRepuestos = Convert.ToDecimal(reader["MontosRepuestos"]);
                ReparacionSeleccionado.MontosTotales = Convert.ToDecimal(reader["MontosTotales"]);
                ReparacionSeleccionado.Activo = Convert.ToBoolean(reader["Activo"]);
                ReparacionSeleccionado.FechaCreacion = Convert.ToDateTime(reader["FechaCreacion"]);
                ReparacionSeleccionado.FechaModificacion = (DateTime?)(reader.IsDBNull("FechaModificacion") ? null : reader["FechaModificacion"]);
                ReparacionSeleccionado.CreadoPor = Convert.ToString(reader["CreadoPor"]);
                ReparacionSeleccionado.ModificadoPor = Convert.ToString(reader["ModificadoPor"]);


                ListaTodasLasReparaciones.Add(ReparacionSeleccionado);
            }

            reader.Close();

            return ListaTodasLasReparaciones;
        }
    }
}
