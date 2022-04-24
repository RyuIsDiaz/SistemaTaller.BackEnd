using SistemaTaller.BackEnd.API.Models;
using System.Data;
using System.Data.SqlClient;

namespace SistemaTaller.BackEnd.API.Repository.SqlServer
{
    public class MecanicosRepository : ConexionBD, IMecanicosRepository
    {
        public MecanicosRepository(SqlConnection context, SqlTransaction transaction)
        {
            this._context = context;
            this._transaction = transaction;
        }

        public void Actualizar(Mecanico mecanico)
        {
            //Asi se hace cuando son consultas planas, que no se usa SPs ni Funciones.
            //var query = "UPDATE Aula SET Horario = @Horario, CodigoCurso  = @CodigoCurso, FechaModificacion = @FechaModificacion, ModificadoPor = @ModificadoPor WHERE NumeroAula = @NumeroAula";
            //var command = CreateCommand(query);

            var query = "SP_Mecanico_Actualizar";
            var command = CreateCommand(query);
            command.CommandType = System.Data.CommandType.StoredProcedure;

            command.Parameters.AddWithValue("@Identificaciones", mecanico.Identificaciones);
            command.Parameters.AddWithValue("@Nombre", mecanico.Nombre);
            command.Parameters.AddWithValue("@Apellidos", mecanico.Apellidos);
            command.Parameters.AddWithValue("@Telefono", mecanico.Telefono);
            command.Parameters.AddWithValue("@Email", mecanico.Email);
            command.Parameters.AddWithValue("@ModificadoPor", mecanico.ModificadoPor);

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

        public void Insertar(Mecanico mecanico)
        {
            var query = "SP_Mecanicos_Insertar";
            var command = CreateCommand(query);
            command.CommandType = System.Data.CommandType.StoredProcedure;

            command.Parameters.AddWithValue("@Identificaciones", mecanico.Identificaciones);
            command.Parameters.AddWithValue("@Nombre", mecanico.Nombre);
            command.Parameters.AddWithValue("@Apellidos", mecanico.Apellidos);
            command.Parameters.AddWithValue("@Telefono", mecanico.Telefono);
            command.Parameters.AddWithValue("@Email", mecanico.Email);
            command.Parameters.AddWithValue("@CreadoPor", mecanico.CreadoPor);

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

        public Mecanico SeleccionarPorId(string Identificaciones)
        {
            var query = "SELECT * FROM FN_Mecanicos_SeleccionarPorIdentificaciones(@Identificacion)";

            var command = CreateCommand(query);

            command.Parameters.AddWithValue("@Identificaciones", Identificaciones);

            SqlDataReader reader = command.ExecuteReader();

            Mecanico MecanicoSeleccionado = new();

            while (reader.Read())
            {
                MecanicoSeleccionado.Identificaciones = Convert.ToString(reader["Identificaciones"]);
                MecanicoSeleccionado.Nombre = Convert.ToString(reader["Nombre"]);
                MecanicoSeleccionado.Apellidos = Convert.ToString(reader["Apellidos"]);
                MecanicoSeleccionado.Telefono = Convert.ToString(reader["Telefono"]);
                MecanicoSeleccionado.Email = Convert.ToString(reader["Email"]);
                MecanicoSeleccionado.Activo = Convert.ToBoolean(reader["Activo"]);
                MecanicoSeleccionado.FechaCreacion = Convert.ToDateTime(reader["FechaCreacion"]);
                MecanicoSeleccionado.FechaModificacion = (DateTime?)(reader.IsDBNull("FechaModificacion") ? null : reader["FechaModificacion"]);
                MecanicoSeleccionado.CreadoPor = Convert.ToString(reader["CreadoPor"]);
                MecanicoSeleccionado.ModificadoPor = Convert.ToString(reader["ModificadoPor"]);
            }

                reader.Close();

            return MecanicoSeleccionado;
        }

        public List<Mecanico> SeleccionarTodos()
        {
            var query = "SELECT * FROM FN_Mecanicos_SeleccionarTodos()";
            var command = CreateCommand(query);

            SqlDataReader reader = command.ExecuteReader();

            List<Mecanico> ListaTodosLosMecanicos = new List<Mecanico>();

            while (reader.Read())
            {
                Mecanico MecanicoSeleccionado = new();

                MecanicoSeleccionado.Identificaciones = Convert.ToString(reader["Identificaciones"]);
                MecanicoSeleccionado.Nombre = Convert.ToString(reader["Nombre"]);
                MecanicoSeleccionado.Apellidos = Convert.ToString(reader["Apellidos"]);
                MecanicoSeleccionado.Telefono = Convert.ToString(reader["Telefono"]);
                MecanicoSeleccionado.Email = Convert.ToString(reader["Email"]);


                MecanicoSeleccionado.Activo = Convert.ToBoolean(reader["Activo"]);
                MecanicoSeleccionado.FechaCreacion = Convert.ToDateTime(reader["FechaCreacion"]);
                MecanicoSeleccionado.FechaModificacion = (DateTime?)(reader.IsDBNull("FechaModificacion") ? null : reader["FechaModificacion"]);
                MecanicoSeleccionado.CreadoPor = Convert.ToString(reader["CreadoPor"]);
                MecanicoSeleccionado.ModificadoPor = Convert.ToString(reader["ModificadoPor"]);

                ListaTodosLosMecanicos.Add(MecanicoSeleccionado);
            }

            reader.Close();

            return ListaTodosLosMecanicos;
        }

    }
}
