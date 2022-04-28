using SistemaTaller.BackEnd.API.Models;
using System.Data;
using System.Data.SqlClient;

namespace SistemaTaller.BackEnd.API.Repository.SqlServer
{
    public class MarcaRepuestosRepository : ConexionBD, IMarcaRepuestosRepository
    {
        public MarcaRepuestosRepository(SqlConnection context, SqlTransaction transaction)
        {
            this._context = context;
            this._transaction = transaction;
        }

        public void Actualizar(MarcaRepuesto marcaRepuesto)
        {
            //Asi se hace cuando son consultas planas, que no se usa SPs ni Funciones.
            //var query = "UPDATE Aula SET Horario = @Horario, CodigoCurso  = @CodigoCurso, FechaModificacion = @FechaModificacion, ModificadoPor = @ModificadoPor WHERE NumeroAula = @NumeroAula";
            //var command = CreateCommand(query);

            var query = "SP_MarcaRepuestos_Actualizar";
            var command = CreateCommand(query);
            command.CommandType = System.Data.CommandType.StoredProcedure;

            command.Parameters.AddWithValue("@Id", marcaRepuesto.Id);
            command.Parameters.AddWithValue("@Nombre", marcaRepuesto.Nombre);
            command.Parameters.AddWithValue("@ModificadoPor", marcaRepuesto.ModificadoPor);
            command.Parameters.AddWithValue("@Activo", marcaRepuesto.Activo);

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

        public void Insertar(MarcaRepuesto marcaRepuesto)
        {
            var query = "SP_MarcaRepuestos_Insertar";
            var command = CreateCommand(query);
            command.CommandType = System.Data.CommandType.StoredProcedure;

            command.Parameters.AddWithValue("@Id", marcaRepuesto.Id);
            command.Parameters.AddWithValue("@Nombre", marcaRepuesto.Nombre);
            command.Parameters.AddWithValue("@CreadoPor", marcaRepuesto.CreadoPor);

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

        public MarcaRepuesto SeleccionarPorId(int id)
        {
            var query = "SELECT * FROM FN_MarcaRepuestos_SeleccionarPorId(@Id)";

            var command = CreateCommand(query);

            command.Parameters.AddWithValue("@Id", id);

            SqlDataReader reader = command.ExecuteReader();

            MarcaRepuesto marcaRepuestoSeleccionado = new();

            while (reader.Read())
            {
                marcaRepuestoSeleccionado.Id = Convert.ToInt32(reader["Id"]);
                marcaRepuestoSeleccionado.Nombre = (string)reader["Nombre"];

                marcaRepuestoSeleccionado.Activo = Convert.ToBoolean(reader["Activo"]);
                marcaRepuestoSeleccionado.FechaCreacion = Convert.ToDateTime(reader["FechaCreacion"]);
                marcaRepuestoSeleccionado.FechaModificacion = (DateTime?)(reader.IsDBNull("FechaModificacion") ? null : reader["FechaModificacion"]);
                marcaRepuestoSeleccionado.CreadoPor = (string)reader["CreadoPor"];
                marcaRepuestoSeleccionado.ModificadoPor = (string)reader["ModificadoPor"];
            }

            reader.Close();

            return marcaRepuestoSeleccionado;
        }

        public List<MarcaRepuesto> SeleccionarTodos()
        {
            var query = "SELECT * FROM FN_MarcaRepuestos_SeleccionarTodos()";
            var command = CreateCommand(query);

            SqlDataReader reader = command.ExecuteReader();

            List<MarcaRepuesto> ListaTodosLasMarcasRepuestos = new List<MarcaRepuesto>();

            while (reader.Read())
            {
                MarcaRepuesto marcaRepuestoSeleccionado = new();

                marcaRepuestoSeleccionado.Id = Convert.ToInt32(reader["Id"]);
                marcaRepuestoSeleccionado.Nombre = (string)reader["Nombre"];

                marcaRepuestoSeleccionado.Activo = Convert.ToBoolean(reader["Activo"]);
                marcaRepuestoSeleccionado.FechaCreacion = Convert.ToDateTime(reader["FechaCreacion"]);
                marcaRepuestoSeleccionado.FechaModificacion = (DateTime?)(reader.IsDBNull("FechaModificacion") ? null : reader["FechaModificacion"]);
                marcaRepuestoSeleccionado.CreadoPor = (string)reader["CreadoPor"];
                marcaRepuestoSeleccionado.ModificadoPor = (string)reader["ModificadoPor"];

                ListaTodosLasMarcasRepuestos.Add(marcaRepuestoSeleccionado);
            }

            reader.Close();

            return ListaTodosLasMarcasRepuestos;
        }
    }
}
