using System.ComponentModel.DataAnnotations;

namespace SistemaTaller.BackEnd.API.Dtos
{
    public class VehiculoDto
    {
        [Required(ErrorMessage = "{0} es un campo obligatorio")]
        [MaxLength(10, ErrorMessage = "{0} tiene que tener máximo {1} caracteres")]
        public string Placa { get; set; }

        [Required(ErrorMessage = "{0} es un campo obligatorio")]
        public int? IdMarca { get; set; }

        [Required(ErrorMessage = "{0} es un campo obligatorio")]
        public int Modelo { get; set; }

        public bool? Activo { get; set; }
    }
}
