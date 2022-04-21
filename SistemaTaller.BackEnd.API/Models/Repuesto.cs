namespace SistemaTaller.BackEnd.API.Models
{
	/// <summary>
	/// 
	/// </summary>
    public class Repuesto
    {
		public string CodigoRepuesto { get; set; }

		public string Nombre { get; set; }

		public int? IdMarca { get; set; }

		public decimal Precio { get; set; }

		public bool? Activo { get; set; }

		public DateTime? FechaCreacion { get; set; }

		public DateTime? FechaModificacion { get; set; }

		public string CreadoPor { get; set; }

		public string ModificadoPor { get; set; }
	}
}
