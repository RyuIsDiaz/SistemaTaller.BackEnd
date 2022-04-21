namespace SistemaTaller.BackEnd.API.Models
{
	/// <summary>
	/// 
	/// </summary>
    public class Reparacion
    {
		public int IdReparaciones { get; set; }

		public DateTime FechasIngreso { get; set; }

		public DateTime FechasSalida { get; set; }

		public string PlacasVehiculos { get; set; }

		public string IdMecanicos { get; set; }

		public string DiagnosticosReparaciones { get; set; }

		public int? IdEstadosReparacion { get; set; }

		public decimal MontosDeObra { get; set; }

		public decimal MontosRepuestos { get; set; }

		public decimal? MontosTotales { get; set; }

		public bool? Activo { get; set; }

		public DateTime FechaCreacion { get; set; }

		public DateTime? FechaModificacion { get; set; }

		public string CreadoPor { get; set; }

		public string ModificadoPor { get; set; }
	}
}
