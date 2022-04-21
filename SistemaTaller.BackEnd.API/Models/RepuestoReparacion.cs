namespace SistemaTaller.BackEnd.API.Models
{
	/// <summary>
	/// 
	/// </summary>
    public class RepuestoReparacion
    {
		public int IdReparaciones { get; set; }

		public string CodigoRepuestos { get; set; }

		public bool? Activo { get; set; }

		public DateTime FechaCreacion { get; set; }

		public DateTime? FechaModificacion { get; set; }

		public string CreadoPor { get; set; }

		public string ModificadoPor { get; set; }
	}
}
