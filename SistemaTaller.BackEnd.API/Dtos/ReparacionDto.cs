using System.ComponentModel.DataAnnotations;

namespace SistemaTaller.BackEnd.API.Dtos
{
	/// <summary>
	/// 
	/// </summary>
    public class ReparacionDto
    {
		[Required(ErrorMessage = "{0} es un campo obligatorio")]
		public DateTime FechasIngreso { get; set; }

		[Required(ErrorMessage = "{0} es un campo obligatorio")]
		public DateTime FechasSalida { get; set; }

		[Required(ErrorMessage = "{0} es un campo obligatorio")]
		[MaxLength(10, ErrorMessage = "{0} tiene que tener máximo {1} caracteres")]
		public string PlacasVehiculos { get; set; }

		[Required(ErrorMessage = "{0} es un campo obligatorio")]
		[MaxLength(20, ErrorMessage = "{0} tiene que tener máximo {1} caracteres")]
		public string IdMecanicos { get; set; }

		[Required(ErrorMessage = "{0} es un campo obligatorio")]
		[MaxLength(100, ErrorMessage = "{0} tiene que tener máximo {1} caracteres")]
		public string DiagnosticosReparaciones { get; set; }

		[Required(ErrorMessage = "{0} es un campo obligatorio")]
		public int? IdEstadosReparacion { get; set; }

		[Required(ErrorMessage = "{0} es un campo obligatorio")]
		public decimal MontosDeObra { get; set; }

		[Required(ErrorMessage = "{0} es un campo obligatorio")]
		public decimal MontosRepuestos { get; set; }

		public bool? Activo { get; set; }

	}
}
