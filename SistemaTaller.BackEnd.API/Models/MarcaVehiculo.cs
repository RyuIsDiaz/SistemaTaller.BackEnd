namespace SistemaTaller.BackEnd.API.Models
{
	/// <summary>
	/// 
	/// </summary>
    public class MarcaVehiculo
    {
		public int Id { get; set; }

		public string Nombre { get; set; }

		public bool? Activo { get; set; }

		public DateTime? FechaCreacion { get; set; }

		public DateTime? FechaModificacion { get; set; }

		public string CreadoPor { get; set; }

		public string ModificadoPor { get; set; }
	}
}
