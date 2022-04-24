using SistemaTaller.BackEnd.API.Models;
using System.Data;
using System.Data.SqlClient;


namespace SistemaTaller.BackEnd.API.Repository.SqlServer
{
    public class TalleresRepository : ConexionBD, ITalleresRepository
    {

        public TalleresRepository(SqlConnection context, SqlTransaction transaction)
        {
            this._context = context;
            this._transaction = transaction;
        }

        public void Actualizar(Taller taller)
        {
            //Asi se hace cuando son consultas planas, que no se usa SPs ni Funciones.
            //var query = "UPDATE Aula SET Horario = @Horario, CodigoCurso  = @CodigoCurso, FechaModificacion = @FechaModificacion, ModificadoPor = @ModificadoPor WHERE NumeroAula = @NumeroAula";
            //var command = CreateCommand(query);

            var query = "SP_talleres_Actualizar";
            var command = CreateCommand(query);
            command.CommandType = System.Data.CommandType.StoredProcedure;

            command.Parameters.AddWithValue("@Id", taller.Id);
            command.Parameters.AddWithValue("@Nombre", taller.Nombre);
            command.Parameters.AddWithValue("@Canton", taller.Canton);
            command.Parameters.AddWithValue("@Telefono", taller.Telefono);
            command.Parameters.AddWithValue("@Email", taller.Email);
            command.Parameters.AddWithValue("@Direccion",taller.Direccion);
            command.Parameters.AddWithValue("@ModificadoPor", taller.ModificadoPor);

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

        public void Insertar(Taller taller)
        {
            var query = "SP_Talleres_Insertar";
            var command = CreateCommand(query);
            command.CommandType = System.Data.CommandType.StoredProcedure;

            command.Parameters.AddWithValue("@Id", taller.Id);
            command.Parameters.AddWithValue("@Nombre", taller.Nombre);
            command.Parameters.AddWithValue("@Canton", taller.Canton);
            command.Parameters.AddWithValue("@Telefono", taller.Telefono);
            command.Parameters.AddWithValue("@Email", taller.Email);
            command.Parameters.AddWithValue("@Direccion", taller.Direccion);
            command.Parameters.AddWithValue("@CreadoPor", taller.CreadoPor);

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

        public Taller SeleccionarPorId(int Id)
        {
            var query = "SELECT * FROM FN_Talleres_SeleccionarPorId(@Id)";

            var command = CreateCommand(query);

            command.Parameters.AddWithValue("@Id", Id);

            SqlDataReader reader = command.ExecuteReader();
          
            Taller TallerSeleccionado = new();

            while (reader.Read())
            {
                TallerSeleccionado.Id = Convert.ToInt32(reader["Id"]);
                TallerSeleccionado.Nombre = Convert.ToString(reader["Nombre"]);
                TallerSeleccionado.Canton= Convert.ToString(reader["Canton"]);
                TallerSeleccionado.Telefono = Convert.ToString(reader["Telefono"]);
                TallerSeleccionado.Email = Convert.ToString(reader["Email"]);
                TallerSeleccionado.Direccion = Convert.ToString(reader["Direccion"]);

                TallerSeleccionado.Activo = Convert.ToBoolean(reader["Activo"]);
                TallerSeleccionado.FechaCreacion = Convert.ToDateTime(reader["FechaCreacion"]);
                TallerSeleccionado.FechaModificacion = (DateTime?)(reader.IsDBNull("FechaModificacion") ? null : reader["FechaModificacion"]);
                TallerSeleccionado.CreadoPor = Convert.ToString(reader["CreadoPor"]);
                TallerSeleccionado.ModificadoPor = Convert.ToString(reader["ModificadoPor"]);
            }

            reader.Close();

            return TallerSeleccionado;
        }

        public List<Taller> SeleccionarTodos()
        {
            var query = "SELECT * FROM FN_Talleres_SeleccionarTodos()";
            var command = CreateCommand(query);

            SqlDataReader reader = command.ExecuteReader();

            List<Taller> ListaTodosLosTalleres = new List<Taller>();

            while (reader.Read())
            {
                Taller TallerSeleccionado = new();

                TallerSeleccionado.Id = Convert.ToInt32(reader["Id"]);
                TallerSeleccionado.Nombre = Convert.ToString(reader["Nombre"]);
                TallerSeleccionado.Canton = Convert.ToString(reader["Canton"]);
                TallerSeleccionado.Telefono = Convert.ToString(reader["Telefono"]);
                TallerSeleccionado.Email = Convert.ToString(reader["Email"]);
                TallerSeleccionado.Direccion = Convert.ToString(reader["Direccion"]);
                TallerSeleccionado.Activo = Convert.ToBoolean(reader["Activo"]);
                TallerSeleccionado.FechaCreacion = Convert.ToDateTime(reader["FechaCreacion"]);
                TallerSeleccionado.FechaModificacion = (DateTime?)(reader.IsDBNull("FechaModificacion") ? null : reader["FechaModificacion"]);
                TallerSeleccionado.CreadoPor = Convert.ToString(reader["CreadoPor"]);
                TallerSeleccionado.ModificadoPor = Convert.ToString(reader["ModificadoPor"]);

                ListaTodosLosTalleres.Add(TallerSeleccionado);
            }

            reader.Close();

            return ListaTodosLosTalleres;
        }

    }

}
