using Microsoft.AspNetCore.Mvc;
using SistemaTaller.BackEnd.API.Dtos;
using SistemaTaller.BackEnd.API.Models;
using SistemaTaller.BackEnd.API.Services.Interfaces;

// For more information on enabling Web API for empty projects, visit https://go.microsoft.com/fwlink/?LinkID=397860

namespace SistemaTaller.BackEnd.API.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class RepuestoReparacionesController : ControllerBase
    {

        private readonly IRepuestoReparacionesService ServicioRepuestoReparaciones;
        public RepuestoReparacionesController(IRepuestoReparacionesService RespuestoReparacionesService)
        {
            ServicioRepuestoReparaciones = RespuestoReparacionesService;
        }
        // GET: api/<RepuestoReparacionesController>
        [HttpGet]

        public List<RepuestoReparacionesDto> Get()
        {
            List<RepuestoReparacion> ListaTodosLosRepuestosReparados = ServicioRepuestoReparaciones.SeleccionarTodos();

            List<RepuestoReparacionesDto> ListaTodosLosRepuestosReparadosDto = new();

            foreach (var RepuestoReparadoSeleccionado in ListaTodosLosRepuestosReparados)
            {
                RepuestoReparacionesDto RepuestoReparadoDTO = new();

                RepuestoReparadoDTO.IdReparaciones= RepuestoReparadoSeleccionado.IdReparaciones;
                RepuestoReparadoDTO.CodigoRepuestos= RepuestoReparadoSeleccionado.CodigoRepuestos;




                ListaTodosLosRepuestosReparadosDto.Add(RepuestoReparadoDTO);
            }

            return ListaTodosLosRepuestosReparadosDto;
        }







        // GET api/<RepuestoReparacionesController>/5
        [HttpGet("{id}")]
        public void Get(int id)
        {
            
        }

        // POST api/<RepuestoReparacionesController>
        [HttpPost]

        public IActionResult Post([FromBody] RepuestoReparacionesDto RepuestoReparacionesDTO)
        {
            try
            {
                if (ModelState.IsValid)
                {
                    RepuestoReparacion RepuestoReparadoPorInsertar = new();

                    RepuestoReparadoPorInsertar.IdReparaciones= RepuestoReparacionesDTO.IdReparaciones;
                    RepuestoReparadoPorInsertar.CodigoRepuestos= RepuestoReparacionesDTO.CodigoRepuestos;
                    RepuestoReparadoPorInsertar.CreadoPor = "Sebastian";
                    ServicioRepuestoReparaciones.Insertar(RepuestoReparadoPorInsertar);

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



        // PUT api/<RepuestoReparacionesController>/5
        [HttpPut("{id}")]

        public IActionResult Put(int id, [FromBody] RepuestoReparacionesDto RepuestoReparacionesDTO)
        {

            try
            {
                if (ModelState.IsValid)
                {
                    RepuestoReparacion RepuestoReparacionPorActualizar = new();
                   
                    RepuestoReparacionPorActualizar.IdReparaciones = RepuestoReparacionesDTO.IdReparaciones;
                    RepuestoReparacionPorActualizar.CodigoRepuestos = RepuestoReparacionesDTO.CodigoRepuestos;

                    RepuestoReparacionPorActualizar.ModificadoPor = "fabian";
                    RepuestoReparacionPorActualizar.Activo = true;


                    ServicioRepuestoReparaciones.Actualizar(RepuestoReparacionPorActualizar);
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







        // DELETE api/<RepuestoReparacionesController>/5
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
