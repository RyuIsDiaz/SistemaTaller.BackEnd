using System.ComponentModel.DataAnnotations;

namespace SistemaTaller.BackEnd.API.Dtos
{
    /// <summary>
    /// 
    /// </summary>
    public class MecanicoTaller
    {
        [Required(ErrorMessage = "{0} es un campo obligatorio")]
        [MaxLength(20, ErrorMessage = "{0} tiene que tener máximo {1} caracteres")]
        public string IdMecanicos { get; set; }

        [Required(ErrorMessage = "{0} es un campo obligatorio")]
        public int IdTalleres { get; set; }

        public bool? Activo { get; set; }
    }
}
