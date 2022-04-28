using SistemaTaller.BackEnd.API.Models;
using System.Data;
using System.Data.SqlClient;

namespace SistemaTaller.BackEnd.API.Repository.SqlServer
{
    public class VehiculosRepository : ConexionBD, IVehiculosRepository
    {
        public VehiculosRepository(SqlConnection context, SqlTransaction transaction)
        {
            this._context = context;
            this._transaction = transaction;
        }

        public void Actualizar(Vehiculo vehiculo)
        {
            //Asi se hace cuando son consultas planas, que no se usa SPs ni Funciones.
            //var query = "UPDATE Aula SET Horario = @Horario, CodigoCurso  = @CodigoCurso, FechaModificacion = @FechaModificacion, ModificadoPor = @ModificadoPor WHERE NumeroAula = @NumeroAula";
            //var command = CreateCommand(query);

            var query = "SP_Vehiuculo_Actualizar";
            var command = CreateCommand(query);
            command.CommandType = System.Data.CommandType.StoredProcedure;

            command.Parameters.AddWithValue("@IdMarca", vehiculo.IdMarca);
            command.Parameters.AddWithValue("@Modelo", vehiculo.Modelo);
            command.Parameters.AddWithValue("@ModificadoPor",vehiculo.ModificadoPor);
            command.Parameters.AddWithValue("@Activo", vehiculo.Activo);

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

        public void Insertar(Vehiculo vehiculo)
        {
            var query = "SP_Vehiculos_Insertar";
            var command = CreateCommand(query);
            command.CommandType = System.Data.CommandType.StoredProcedure;

            command.Parameters.AddWithValue("@Placa", vehiculo.Placa);
            command.Parameters.AddWithValue("@Modelo", vehiculo.Modelo);
            command.Parameters.AddWithValue("@IdMarca", vehiculo.IdMarca);
            command.Parameters.AddWithValue("@CreadoPor", vehiculo.CreadoPor);

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

        public Vehiculo SeleccionarPorId(string Id)
        {
            var query = "SELECT * FROM FN_Vehiculos_SeleccionarPorId(@Id)";

            var command = CreateCommand(query);

            command.Parameters.AddWithValue("@Id", Id);

            SqlDataReader reader = command.ExecuteReader();

            Vehiculo VehiculoSeleccionado = new();

            while (reader.Read())
            {
                VehiculoSeleccionado.IdMarca = Convert.ToInt32(reader["IdMarca"]);
                VehiculoSeleccionado.Modelo = Convert.ToInt32(reader["Modelo"]);
                VehiculoSeleccionado.Activo = Convert.ToBoolean(reader["Activo"]);
                VehiculoSeleccionado.FechaCreacion = Convert.ToDateTime(reader["FechaCreacion"]);
                VehiculoSeleccionado.FechaModificacion = (DateTime?)(reader.IsDBNull("FechaModificacion") ? null : reader["FechaModificacion"]);
                VehiculoSeleccionado.CreadoPor = Convert.ToString(reader["CreadoPor"]);
                VehiculoSeleccionado.ModificadoPor = Convert.ToString(reader["ModificadoPor"]);
            }

            reader.Close();

            return VehiculoSeleccionado;
        }

        public List<Vehiculo> SeleccionarTodos()
        {
            var query = "SELECT * FROM FN_Vehiculos_SeleccionarTodos()";
            var command = CreateCommand(query);

            SqlDataReader reader = command.ExecuteReader();

            List<Vehiculo> ListaTodosLosVehiculos = new List<Vehiculo>();

            while (reader.Read())
            {
                Vehiculo VehiculoSeleccionado = new();

                VehiculoSeleccionado.Placa = Convert.ToString(reader["Placa"]);
                VehiculoSeleccionado.IdMarca = Convert.ToInt32(reader["IdMarca"]);
                VehiculoSeleccionado.Modelo = Convert.ToInt32(reader["Modelo"]);
                VehiculoSeleccionado.Activo = Convert.ToBoolean(reader["Activo"]);
                VehiculoSeleccionado.FechaCreacion = Convert.ToDateTime(reader["FechaCreacion"]);
                VehiculoSeleccionado.FechaModificacion = (DateTime?)(reader.IsDBNull("FechaModificacion") ? null : reader["FechaModificacion"]);
                VehiculoSeleccionado.CreadoPor = Convert.ToString(reader["CreadoPor"]);
                VehiculoSeleccionado.ModificadoPor = Convert.ToString(reader["ModificadoPor"]);


                ListaTodosLosVehiculos.Add(VehiculoSeleccionado);
            }

            reader.Close();

            return ListaTodosLosVehiculos;
        }

    }
}

