using System.ComponentModel.DataAnnotations;

namespace SistemaTaller.BackEnd.API.Dtos
{
    /// <summary>
    /// 
    /// </summary>
    public class EstadoReparacionDto
    {
        [Required(ErrorMessage = "{0} es un campo obligatorio")]
        [MaxLength(15, ErrorMessage = "{0} tiene que tener máximo {1} caracteres")]
        public string Estados { get; set; }

        public bool? Activo { get; set; }
    }
}
