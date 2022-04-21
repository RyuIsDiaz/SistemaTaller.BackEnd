using System.ComponentModel.DataAnnotations;

namespace SistemaTaller.BackEnd.API.Dtos
{
    public class VehiculoClienteDto
    {
        [Required(ErrorMessage = "{0} es un campo obligatorio")]
        [MaxLength(20, ErrorMessage = "{0} tiene que tener máximo {1} caracteres")]
        public string IdentificacionCliente { get; set; }

        [Required(ErrorMessage = "{0} es un campo obligatorio")]
        [MaxLength(20, ErrorMessage = "{0} tiene que tener máximo {1} caracteres")]
        public string Placa { get; set; }

        public bool? Activo { get; set; }
    }
}
