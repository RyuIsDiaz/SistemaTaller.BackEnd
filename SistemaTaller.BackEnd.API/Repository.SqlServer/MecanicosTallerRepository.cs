using SistemaTaller.BackEnd.API.Models;
using System.Data;
using System.Data.SqlClient;


namespace SistemaTaller.BackEnd.API.Repository.SqlServer
{
    public class MecanicosTallerRepository : ConexionBD, IMecanicosTallerRepository
    {
        public MecanicosTallerRepository(SqlConnection context, SqlTransaction transaction)
        {
            this._context = context;
            this._transaction = transaction;
        }

        public void Actualizar(MecanicoTaller mecanicotaller)
        {
            //Asi se hace cuando son consultas planas, que no se usa SPs ni Funciones.
            //var query = "UPDATE Aula SET Horario = @Horario, CodigoCurso  = @CodigoCurso, FechaModificacion = @FechaModificacion, ModificadoPor = @ModificadoPor WHERE NumeroAula = @NumeroAula";
            //var command = CreateCommand(query);

            var query = "SP_MecanicosTaller_Actualizar";
            var command = CreateCommand(query);
            command.CommandType = System.Data.CommandType.StoredProcedure;

            command.Parameters.AddWithValue("@IdMecanicos", mecanicotaller.IdMecanicos);
            command.Parameters.AddWithValue("@ModificadoPor", mecanicotaller.ModificadoPor);

            
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





        public void Insertar(MecanicoTaller mecanicotaller)
        {
            var query = "SP_MecanicosTaller_Insertar";
            var command = CreateCommand(query);
            command.CommandType = System.Data.CommandType.StoredProcedure;

            command.Parameters.AddWithValue("@IdMecanicos", mecanicotaller.IdMecanicos);
            command.Parameters.AddWithValue("@IdTaller", mecanicotaller.IdTalleres);
            

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

        public MecanicoTaller SeleccionarPorId( string id)
        {
            var query = "SELECT * FROM FN_MecanicosTaller_SeleccionarPorId(@Id)";



            var command = CreateCommand(query);

            command.Parameters.AddWithValue("@Id", id);

            SqlDataReader reader = command.ExecuteReader();

            MecanicoTaller mecanicotallerSeleccionado = new();

            while (reader.Read())
            {
               mecanicotallerSeleccionado.IdMecanicos = Convert.ToString(reader["Id"]);
               

                mecanicotallerSeleccionado.Activo = Convert.ToBoolean(reader["Activo"]);
                mecanicotallerSeleccionado.FechaCreacion = Convert.ToDateTime(reader["FechaCreacion"]);
                mecanicotallerSeleccionado.FechaModificacion = (DateTime?)(reader.IsDBNull("FechaModificacion") ? null : reader["FechaModificacion"]);
                mecanicotallerSeleccionado.CreadoPor = (string)reader["CreadoPor"];
                mecanicotallerSeleccionado.ModificadoPor = (string)reader["ModificadoPor"];
            }

            reader.Close();

            return mecanicotallerSeleccionado;
        }

        public List<MecanicoTaller> SeleccionarTodos()
        {
            var query = "SELECT * FROM FN_MecanicosTaller_SeleccionarTodos()";
            var command = CreateCommand(query);

            SqlDataReader reader = command.ExecuteReader();

            List<MecanicoTaller> ListaTodosLosMecanicosTaller = new List<MecanicoTaller>();

            while (reader.Read())
            {
                MecanicoTaller MecanicotallerSeleccionado = new();

                MecanicotallerSeleccionado.IdMecanicos = Convert.ToString(reader["IdMecanicos"]);
                MecanicotallerSeleccionado.IdTalleres = Convert.ToInt32(reader["IdTalleres"]);
              


                MecanicotallerSeleccionado.Activo = Convert.ToBoolean(reader["Activo"]);
                MecanicotallerSeleccionado.FechaCreacion = Convert.ToDateTime(reader["FechaCreacion"]);
                MecanicotallerSeleccionado.FechaModificacion = (DateTime?)(reader.IsDBNull("FechaModificacion") ? null : reader["FechaModificacion"]);
                MecanicotallerSeleccionado.CreadoPor = Convert.ToString(reader["CreadoPor"]);
                MecanicotallerSeleccionado.ModificadoPor = Convert.ToString(reader["ModificadoPor"]);

                ListaTodosLosMecanicosTaller.Add(MecanicotallerSeleccionado);
            }

            reader.Close();

            return ListaTodosLosMecanicosTaller;
        }

    }
}
