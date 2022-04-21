using System.ComponentModel.DataAnnotations;

namespace SistemaTaller.BackEnd.API.Dtos
{
    public class RepuestoDto
    {
        [Required(ErrorMessage = "{0} es un campo obligatorio")]
        [MaxLength(25, ErrorMessage = "{0} tiene que tener máximo {1} caracteres")]
        public string CodigoRepuesto { get; set; }

        [Required(ErrorMessage = "{0} es un campo obligatorio")]
        [MaxLength(20, ErrorMessage = "{0} tiene que tener máximo {1} caracteres")]
        public string Nombre { get; set; }

        [Required(ErrorMessage = "{0} es un campo obligatorio")]      
        public int? IdMarca { get; set; }

        [Required(ErrorMessage = "{0} es un campo obligatorio")]
        public decimal Precio { get; set; }

        public bool? Activo { get; set; }

    }
}
