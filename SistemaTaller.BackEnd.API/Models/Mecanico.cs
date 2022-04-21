namespace SistemaTaller.BackEnd.API.Models
{
	/// <summary>
	/// 
	/// </summary>
    public class Mecanico
    {
		public string Identificaciones { get; set; }

		public string Nombre { get; set; }

		public string Apellidos { get; set; }

		public string Telefono { get; set; }

		public string Email { get; set; }

		public bool Activo { get; set; }

		public DateTime? FechaCreacion { get; set; }

		public DateTime? FechaModificacion { get; set; }

		public string CreadoPor { get; set; }

		public string ModificadoPor { get; set; }
	}
}
