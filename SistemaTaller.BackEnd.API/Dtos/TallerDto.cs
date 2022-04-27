using System.ComponentModel.DataAnnotations;

namespace SistemaTaller.BackEnd.API.Dtos
{
    public class TallerDto
    {
		[Required(ErrorMessage = "{0} es un campo obligatorio")]
		[MaxLength(45, ErrorMessage = "{0} tiene que tener máximo {1} caracteres")]
		public int Id { get; set; }
		[Required(ErrorMessage = "{0} es un campo obligatorio")]
		[MaxLength(45, ErrorMessage = "{0} tiene que tener máximo {1} caracteres")]
		public string Nombre { get; set; }

		[Required(ErrorMessage = "{0} es un campo obligatorio")]
		[MaxLength(15, ErrorMessage = "{0} tiene que tener máximo {1} caracteres")]
		public string Telefono { get; set; }

		[Required(ErrorMessage = "{0} es un campo obligatorio")]
		[MaxLength(15, ErrorMessage = "{0} tiene que tener máximo {1} caracteres")]
		public string Canton { get; set; }

		[Required(ErrorMessage = "{0} es un campo obligatorio")]
		[MaxLength(80, ErrorMessage = "{0} tiene que tener máximo {1} caracteres")]
		public string Direccion { get; set; }

		[Required(ErrorMessage = "{0} es un campo obligatorio")]
		[MaxLength(30, ErrorMessage = "{0} tiene que tener máximo {1} caracteres")]
		public string Email { get; set; }

		public bool? Activo { get; set; }
	}
}
