using Microsoft.AspNetCore.Mvc;
using SistemaTaller.BackEnd.API.Dtos;
using SistemaTaller.BackEnd.API.Models;
using SistemaTaller.BackEnd.API.Services.Interfaces;

// For more information on enabling Web API for empty projects, visit https://go.microsoft.com/fwlink/?LinkID=397860

namespace SistemaTaller.BackEnd.API.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class RepuestosController : ControllerBase
    {

        private readonly IRepuestosService ServicioRepuesto;
        public RepuestosController(IRepuestosService RespuestosService)
        {
            ServicioRepuesto = RespuestosService;
        }
        // GET: api/<RepuestosController>
        [HttpGet]

        public List<RepuestoDto> Get()
        {
            List<Repuesto> ListaTodosLosRepuestos = ServicioRepuesto.SeleccionarTodos();

            List<RepuestoDto> ListaTodosLosRepuestosDto = new();

            foreach (var RepuestoSeleccionado in ListaTodosLosRepuestos)
            {
                RepuestoDto RepuestoDTO = new();

                RepuestoDTO.CodigoRepuesto= RepuestoSeleccionado.CodigoRepuesto;
                RepuestoDTO.Nombre = RepuestoSeleccionado.Nombre;
                RepuestoDTO.IdMarca = RepuestoSeleccionado.IdMarca;
                RepuestoDTO.Precio = RepuestoSeleccionado.Precio;
                RepuestoDTO.Activo = RepuestoSeleccionado.Activo;



                ListaTodosLosRepuestosDto.Add(RepuestoDTO);
            }

            return ListaTodosLosRepuestosDto;
        }



     // GET api/<RepuestosController>/5
        [HttpGet("{id}")]
        public void Get(string CodigoRepuesto)
        {

        }

        // POST api/<RepuestosController>
        [HttpPost]
        public IActionResult Post([FromBody] RepuestoDto RepuestoDTO)
        {
            try
            {
                if (ModelState.IsValid)
                {
                   Repuesto RepuestoPorInsertar = new();

                    RepuestoPorInsertar.Nombre = RepuestoDTO.Nombre;
                    RepuestoPorInsertar.CodigoRepuesto = RepuestoDTO.CodigoRepuesto;
                    RepuestoPorInsertar.IdMarca = RepuestoDTO.IdMarca;
                    RepuestoPorInsertar.Precio = RepuestoDTO.Precio;
                    RepuestoPorInsertar.CreadoPor = "Sebastian";
                    ServicioRepuesto.Insertar(RepuestoPorInsertar);

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


        // PUT api/<RepuestosController>/5
        [HttpPut("{id}")]
        public IActionResult Put(string id, [FromBody] RepuestoDto RepuestoDTO)
        {

            try
            {
                if (ModelState.IsValid)
                {
                    Repuesto RepuestoPorActualizar = new();

                    RepuestoPorActualizar.CodigoRepuesto = RepuestoDTO.CodigoRepuesto;
                    RepuestoPorActualizar.Nombre = RepuestoDTO.Nombre;
                    RepuestoPorActualizar.IdMarca = RepuestoDTO.IdMarca;
                    RepuestoPorActualizar.Precio = RepuestoDTO.Precio;
            
                    RepuestoPorActualizar.ModificadoPor = "fabian";
                    RepuestoPorActualizar.Activo = true;


                    ServicioRepuesto.Actualizar(RepuestoPorActualizar);
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




        // DELETE api/<RepuestosController>/5
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
