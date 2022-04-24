using SistemaTaller.BackEnd.API.Models;
using System.Data;
using System.Data.SqlClient;


namespace SistemaTaller.BackEnd.API.Repository.SqlServer
{
   
      public class RepuestosRepository : ConexionBD, IRepuestosRepository
      {
        public RepuestosRepository(SqlConnection context, SqlTransaction transaction)
        {
            this._context = context;
            this._transaction = transaction;
        }

        public void Actualizar(Repuesto repuesto)
        {
            //Asi se hace cuando son consultas planas, que no se usa SPs ni Funciones.
            //var query = "UPDATE Aula SET Horario = @Horario, CodigoCurso  = @CodigoCurso, FechaModificacion = @FechaModificacion, ModificadoPor = @ModificadoPor WHERE NumeroAula = @NumeroAula";
            //var command = CreateCommand(query);

            var query = "SP_Repuestos_Actualizar";
            var command = CreateCommand(query);
            command.CommandType = System.Data.CommandType.StoredProcedure;

            command.Parameters.AddWithValue("@CodigoRepuesto", repuesto.CodigoRepuesto);
            command.Parameters.AddWithValue("@Nombre", repuesto.Nombre);
            command.Parameters.AddWithValue("@Precio", repuesto.Precio);
            command.Parameters.AddWithValue("@ModificadoPor", repuesto.ModificadoPor);

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

        public void Eliminar(string codigo)
        {
            throw new NotImplementedException();
        }

        public void Insertar(Repuesto repuesto)
        {
            var query = "SP_Repuestos_Insertar";
            var command = CreateCommand(query);
            command.CommandType = System.Data.CommandType.StoredProcedure;

            command.Parameters.AddWithValue("@CodigoRepuesto", repuesto.CodigoRepuesto);
            command.Parameters.AddWithValue("@Nombre", repuesto.Nombre);
            command.Parameters.AddWithValue("@IdMarca", repuesto.IdMarca);
            command.Parameters.AddWithValue("@Precio", repuesto.Precio);
            command.Parameters.AddWithValue("@CreadoPor", repuesto.CreadoPor);

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

        public Repuesto SeleccionarPorCodigoRepuesto(string CodigoRepuesto)
        {
            var query = "SELECT * FROM FN_Repuestos_SeleccionarPorCodigoRepuesto(@CodigoRepuesto)";

            var command = CreateCommand(query);

            command.Parameters.AddWithValue("@CodigoRepuesto", CodigoRepuesto);

            SqlDataReader reader = command.ExecuteReader();

            Repuesto RepuestoSeleccionado = new();

            while (reader.Read())
            {
                RepuestoSeleccionado.CodigoRepuesto = Convert.ToString(reader["CodigoRepuesto"]);
                RepuestoSeleccionado.Nombre = Convert.ToString(reader["Nombre"]);
                RepuestoSeleccionado.Precio = Convert.ToDecimal(reader["Precio"]);
                RepuestoSeleccionado.Activo = Convert.ToBoolean(reader["Activo"]);
                RepuestoSeleccionado.FechaCreacion = Convert.ToDateTime(reader["FechaCreacion"]);
                RepuestoSeleccionado.FechaModificacion = (DateTime?)(reader.IsDBNull("FechaModificacion") ? null : reader["FechaModificacion"]);
                RepuestoSeleccionado.CreadoPor = Convert.ToString(reader["CreadoPor"]);
                RepuestoSeleccionado.ModificadoPor = Convert.ToString(reader["ModificadoPor"]);
            }

            reader.Close();

            return RepuestoSeleccionado;
        }

        public List<Repuesto> SeleccionarTodos()
        {
            var query = "SELECT * FROM FN_Repuestos_SeleccionarTodos()";
            var command = CreateCommand(query);

            SqlDataReader reader = command.ExecuteReader();

            List<Repuesto> ListaTodosLosRepuestos= new List<Repuesto>();

            while (reader.Read())
            {
                Repuesto RepuestoSeleccionado = new();

                RepuestoSeleccionado.CodigoRepuesto = Convert.ToString(reader["CodigoRepuesto"]);
                RepuestoSeleccionado.Nombre = Convert.ToString(reader["Nombre"]);
                RepuestoSeleccionado.IdMarca = Convert.ToInt32(reader["IdMarca"]);
                RepuestoSeleccionado.Precio = Convert.ToDecimal(reader["Precio"]);
                RepuestoSeleccionado.Activo = Convert.ToBoolean(reader["Activo"]);
                RepuestoSeleccionado.FechaCreacion = Convert.ToDateTime(reader["FechaCreacion"]);
                RepuestoSeleccionado.FechaModificacion = (DateTime?)(reader.IsDBNull("FechaModificacion") ? null : reader["FechaModificacion"]);
                RepuestoSeleccionado.CreadoPor = Convert.ToString(reader["CreadoPor"]);
                RepuestoSeleccionado.ModificadoPor = Convert.ToString(reader["ModificadoPor"]);

                ListaTodosLosRepuestos.Add(RepuestoSeleccionado);
            }

            reader.Close();

            return ListaTodosLosRepuestos;
        }
    }
}
