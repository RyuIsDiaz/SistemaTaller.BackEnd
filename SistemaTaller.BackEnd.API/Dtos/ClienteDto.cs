using System.ComponentModel.DataAnnotations;

namespace SistemaTaller.BackEnd.API.Dtos
{
    public class ClienteDto
    {
		[Required(ErrorMessage = "{0} es un campo obligatorio")]
		[MaxLength(20, ErrorMessage = "{0} tiene que tener máximo {1} caracteres")]
		public string Identificacion { get; set; }

		
		public string Nombre { get; set; }

		
		public string Apellidos { get; set; }

		public string Telefono { get; set; }

		
		public string Email { get; set; }

		
		public string Direccion { get; set; }

		public bool? Activo { get; set; }

	}
}
