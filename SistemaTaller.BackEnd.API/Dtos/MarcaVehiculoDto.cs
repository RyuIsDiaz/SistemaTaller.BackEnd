using System.ComponentModel.DataAnnotations;

namespace SistemaTaller.BackEnd.API.Dtos
{
    /// <summary>
    /// 
    /// </summary>
    public class MarcaVehiculoDto
    {
        [Required(ErrorMessage = "{0} es un campo obligatorio")]
        [MaxLength(20, ErrorMessage = "{0} tiene que tener máximo {1} caracteres")]
        public string Nombre { get; set; }

        public bool? Activo { get; set; }
    }
}
