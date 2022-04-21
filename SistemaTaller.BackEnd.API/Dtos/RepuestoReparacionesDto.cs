using System.ComponentModel.DataAnnotations;

namespace SistemaTaller.BackEnd.API.Dtos
{
    public class RepuestoReparacionesDto
    {
        [Required(ErrorMessage = "{0} es un campo obligatorio")]
        public int IdReparaciones { get; set; }

        [Required(ErrorMessage = "{0} es un campo obligatorio")]
        [MaxLength(25, ErrorMessage = "{0} tiene que tener máximo {1} caracteres")]
        public string CodigoRepuestos { get; set; }

        public bool? Activo { get; set; }
    }
}
