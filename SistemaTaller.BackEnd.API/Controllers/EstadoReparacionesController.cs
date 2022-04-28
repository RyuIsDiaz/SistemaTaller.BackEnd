using Microsoft.AspNetCore.Mvc;
using SistemaTaller.BackEnd.API.Dtos;
using SistemaTaller.BackEnd.API.Models;
using SistemaTaller.BackEnd.API.Services.Interfaces;

// For more information on enabling Web API for empty projects, visit https://go.microsoft.com/fwlink/?LinkID=397860

namespace SistemaTaller.BackEnd.API.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class EstadoReparacionesController : ControllerBase
    {

         private readonly IEstadoReparacionesService ServicioEstadoReparaciones;
        public EstadoReparacionesController(IEstadoReparacionesService EstadoReparacionesService)
        {
            ServicioEstadoReparaciones = EstadoReparacionesService;
        }
        // GET: api/<EstadoReparacionesController>
        [HttpGet]
        public List<EstadoReparacionDto> Get()
        {
            List<EstadoReparacion> ListaTodosLosEstadoReparacion = ServicioEstadoReparaciones.SeleccionarTodos();

            List<EstadoReparacionDto> ListaTodosLosEstadoReparacionDto = new();

            foreach (var EstadoReparacionSeleccionado in ListaTodosLosEstadoReparacion)
            {
                EstadoReparacionDto EstadoReparacionDTO = new();

                EstadoReparacionDTO.Id = EstadoReparacionSeleccionado.Id;
                EstadoReparacionDTO.Estados = EstadoReparacionSeleccionado.Estados;
              
                EstadoReparacionDTO.Activo = EstadoReparacionSeleccionado.Activo;



                ListaTodosLosEstadoReparacionDto.Add(EstadoReparacionDTO);
            }

            return ListaTodosLosEstadoReparacionDto;

        }

        // GET api/<EstadoReparacionesController>/5
        [HttpGet("{id}")]
        public string Get(int id)
        {
            return "value";
        }

        // POST api/<EstadoReparacionesController>
        [HttpPost]
        public IActionResult Post([FromBody] EstadoReparacionDto EstadoReparacionDTO)
        {
            try
            {
                if (ModelState.IsValid)
                {
                    EstadoReparacion EstadoReparacionPorInsertar = new();

                    EstadoReparacionPorInsertar.Id = EstadoReparacionDTO.Id;
                    EstadoReparacionPorInsertar.Estados = EstadoReparacionDTO.Estados;
                    EstadoReparacionPorInsertar.CreadoPor = "Roy";
                   
                    ServicioEstadoReparaciones.Insertar(EstadoReparacionPorInsertar);

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

        // PUT api/<EstadoReparacionesController>/5
        [HttpPut("{id}")]
        public IActionResult Put(int id, [FromBody] EstadoReparacionDto EstadoReparacionDTO)
        {
            try
            {
                if (ModelState.IsValid)
                {
                    EstadoReparacion EstadoReparacionPorActualizar = new();
                    EstadoReparacionPorActualizar.Id = EstadoReparacionDTO.Id;
                    EstadoReparacionPorActualizar.Estados = EstadoReparacionDTO.Estados;
                    EstadoReparacionPorActualizar.ModificadoPor = EstadoReparacionDTO.ModificadoPor;

                    EstadoReparacionPorActualizar.Activo = true;


                    ServicioEstadoReparaciones.Actualizar(EstadoReparacionPorActualizar);
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

        // DELETE api/<EstadoReparacionesController>/5
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
