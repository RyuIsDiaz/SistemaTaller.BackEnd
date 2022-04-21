using System.ComponentModel.DataAnnotations;

namespace SistemaTaller.BackEnd.API.Dtos
{
	/// <summary>
	/// 
	/// </summary>
    public class ClienteDto
    {
		[Required(ErrorMessage = "{0} es un campo obligatorio")]
		[MaxLength(20, ErrorMessage = "{0} tiene que tener máximo {1} caracteres")]
		public string Identificacion { get; set; }

		[Required(ErrorMessage = "{0} es un campo obligatorio")]
		[MaxLength(20, ErrorMessage = "{0} tiene que tener máximo {1} caracteres")]
		public string Nombre { get; set; }

		[Required(ErrorMessage = "{0} es un campo obligatorio")]
		[MaxLength(30, ErrorMessage = "{0} tiene que tener máximo {1} caracteres")]
		public string Apellidos { get; set; }

		[Required(ErrorMessage = "{0} es un campo obligatorio")]
		[MaxLength(15, ErrorMessage = "{0} tiene que tener máximo {1} caracteres")]
		public string Telefono { get; set; }

		[Required(ErrorMessage = "{0} es un campo obligatorio")]
		[MaxLength(30, ErrorMessage = "{0} tiene que tener máximo {1} caracteres")]
		public string Email { get; set; }

		[Required(ErrorMessage = "{0} es un campo obligatorio")]
		[MaxLength(15, ErrorMessage = "{0} tiene que tener máximo {1} caracteres")]
		public string Direccion { get; set; }

		public bool? Activo { get; set; }

	}
}
