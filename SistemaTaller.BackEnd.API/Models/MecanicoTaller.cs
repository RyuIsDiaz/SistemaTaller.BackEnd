namespace SistemaTaller.BackEnd.API.Models
{
	/// <summary>
	/// 
	/// </summary>
    public class MecanicoTaller
    {
		public string IdMecanicos { get; set; }

		public int IdTalleres { get; set; }

		public bool? Activo { get; set; }

		public DateTime? FechaCreacion { get; set; }

		public DateTime? FechaModificacion { get; set; }

		public string CreadoPor { get; set; }

		public string ModificadoPor { get; set; }
	}
}
