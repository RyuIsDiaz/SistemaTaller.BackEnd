namespace SistemaTaller.BackEnd.API.Models
{
    public class EstadoReparacion
    {
		/// <summary>
		/// 
		/// </summary>
		public int Id { get; set; }

		public string Estados { get; set; }

		public bool? Activo { get; set; }

		public DateTime? FechaCreacion { get; set; }

		public DateTime? FechaModificacion { get; set; }

		public string CreadoPor { get; set; }

		public string ModificadoPor { get; set; }
	}
}
