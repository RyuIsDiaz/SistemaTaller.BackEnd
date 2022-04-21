namespace SistemaTaller.BackEnd.API.Models
{
	/// <summary>
	/// 
	/// </summary>
    public class Vehiculo
    {
		public string Placa { get; set; }

		public int? IdMarca { get; set; }

		public int Modelo { get; set; }

		public bool? Activo { get; set; }

		public DateTime? FechaCreacion { get; set; }

		public DateTime? FechaModificacion { get; set; }

		public string CreadoPor { get; set; }

		public string ModificadoPor { get; set; }
	}
}
