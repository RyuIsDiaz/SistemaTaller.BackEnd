using Microsoft.AspNetCore.Mvc;
using SistemaTaller.BackEnd.API.Dtos;
using SistemaTaller.BackEnd.API.Models;
using SistemaTaller.BackEnd.API.Services.Interfaces;

// For more information on enabling Web API for empty projects, visit https://go.microsoft.com/fwlink/?LinkID=397860

namespace SistemaTaller.BackEnd.API.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class VehiculosClienteController : ControllerBase
    {

        private readonly IVehiculosClienteService ServicioVehiculosCliente;
        public VehiculosClienteController(IVehiculosClienteService VehiculosClienteService)
        {
            ServicioVehiculosCliente = VehiculosClienteService;
        }
        // GET: api/<VehiculosClienteController>
        [HttpGet]
        public List<VehiculoClienteDto> Get()
        {
            List<VehiculoCliente> ListaTodosLosVehiculosCliente = ServicioVehiculosCliente.SeleccionarTodos();

            List<VehiculoClienteDto> ListaTodasLosVehiculosClienteDto = new();

            foreach (var VehiculoClienteSeleccionado in ListaTodosLosVehiculosCliente)
            {
                VehiculoClienteDto VehiculoClienteDTO = new();
                VehiculoClienteDTO.IdentificacionCliente= VehiculoClienteSeleccionado.IdentificacionCliente;
                VehiculoClienteDTO.Placa = VehiculoClienteSeleccionado.Placa;
                VehiculoClienteDTO.Activo = VehiculoClienteSeleccionado.Activo;
                ListaTodasLosVehiculosClienteDto.Add(VehiculoClienteDTO);
            }

            return ListaTodasLosVehiculosClienteDto;
        }

        // GET api/<VehiculosClienteController>/5
        [HttpGet("{id}")]
        public string Get(int id)
        {
            return "value";
        }

        // POST api/<VehiculosClienteController>
        [HttpPost]
        public IActionResult Post([FromBody] VehiculoClienteDto VehiculosClienteDTO)
        {
            try
            {
                if (ModelState.IsValid)
                {
                    VehiculoCliente VehiculoClientePorInsertar = new();

                    VehiculoClientePorInsertar.IdentificacionCliente = VehiculosClienteDTO.IdentificacionCliente;
                    VehiculoClientePorInsertar.Placa = VehiculosClienteDTO.Placa;
                    VehiculoClientePorInsertar.Activo = VehiculosClienteDTO.Activo;
                    VehiculoClientePorInsertar.CreadoPor = "Fabián";
                    ServicioVehiculosCliente.Insertar(VehiculoClientePorInsertar);

                    return Ok();
                }
                else
                {
                    string ErroreEnElModelo = ObtenerErroresDeModeloInvalido();

                    return BadRequest(ErroreEnElModelo);
                }
            }
            catch (Exception Ex)
            {
                return BadRequest(Ex.Message);
            }
        }

        // PUT api/<VehiculosClienteController>/5
        [HttpPut("{id}")]
        public IActionResult Put(string id, [FromBody] VehiculoClienteDto VehiculosClienteDTO)
        {

            try
            {
                if (ModelState.IsValid)
                {
                    VehiculoCliente VehiculoClientePorActualizar = new();
                    VehiculoClientePorActualizar.IdentificacionCliente = VehiculosClienteDTO.IdentificacionCliente;
                    VehiculoClientePorActualizar.Placa = VehiculosClienteDTO.Placa;
                    VehiculoClientePorActualizar.Activo = VehiculosClienteDTO.Activo;
                    VehiculoClientePorActualizar.ModificadoPor = "fabian";
                    VehiculoClientePorActualizar.Activo = true;


                    ServicioVehiculosCliente.Actualizar(VehiculoClientePorActualizar);
                    return Ok();
                }
                else
                {
                    string ErroreEnElModelo = ObtenerErroresDeModeloInvalido();
                    return BadRequest(ErroreEnElModelo);
                }
            }
            catch (Exception Ex)
            {
                return BadRequest(Ex.Message);
            }
        }

        // DELETE api/<VehiculosClienteController>/5
        [HttpDelete("{id}")]
        public void Delete(int id)
        {
                
        }
        private string ObtenerErroresDeModeloInvalido()
        {

            var ListaDeErroresEnModelo = ModelState.Keys.Where(i => ModelState[i].Errors.Count > 0)
                                                     .Select(k => ModelState[k].Errors.First().ErrorMessage);

            string ListaDeErroresEnModeloConcatenados = string.Join("\n", ListaDeErroresEnModelo);

            return ListaDeErroresEnModeloConcatenados;
        }
    }
}
