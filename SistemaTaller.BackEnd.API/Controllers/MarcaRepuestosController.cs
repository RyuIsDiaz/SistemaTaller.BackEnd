using Microsoft.AspNetCore.Mvc;
using SistemaTaller.BackEnd.API.Dtos;
using SistemaTaller.BackEnd.API.Models;
using SistemaTaller.BackEnd.API.Services.Interfaces;

// For more information on enabling Web API for empty projects, visit https://go.microsoft.com/fwlink/?LinkID=397860

namespace SistemaTaller.BackEnd.API.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class MarcaRepuestosController : ControllerBase
    {
        private readonly IMarcaRepuestosService ServicioMarcaRepuestos;
        public MarcaRepuestosController(IMarcaRepuestosService MarcaRepuestosService)
        {
            ServicioMarcaRepuestos = MarcaRepuestosService;
        }
        // GET: api/<MarcaRepuestosController>
        [HttpGet]
        public List<MarcaRepuestoDto> Get()
        {
            List<MarcaRepuesto> ListaTodosLasMarcaRepuesto = ServicioMarcaRepuestos.SeleccionarTodos();

            List<MarcaRepuestoDto> ListaTodasLasMarcaRepuestoDto = new();

            foreach (var MarcaRepuestoSeleccionado in ListaTodosLasMarcaRepuesto)
            {
                MarcaRepuestoDto MarcaRepuestoDTO = new();

                MarcaRepuestoDTO.Id = MarcaRepuestoSeleccionado.Id;
                MarcaRepuestoDTO.Nombre = MarcaRepuestoSeleccionado.Nombre;
                MarcaRepuestoDTO.Activo = MarcaRepuestoSeleccionado.Activo;




                ListaTodasLasMarcaRepuestoDto.Add(MarcaRepuestoDTO);
            }

            return ListaTodasLasMarcaRepuestoDto;
        }

        // GET api/<MarcaRepuestosController>/5
        [HttpGet("{id}")]
        public string Get(int id)
        {
            return "value";
        }

        // POST api/<MarcaRepuestosController>
        [HttpPost]
        public IActionResult Post([FromBody] MarcaRepuestoDto MarcaRepuestoDTO)
        {
            try
            {
                if (ModelState.IsValid)
                {
                    MarcaRepuesto MarcaRepuestoPorInsertar = new();

                    MarcaRepuestoPorInsertar.Id = MarcaRepuestoDTO.Id;
                    MarcaRepuestoPorInsertar.Nombre = MarcaRepuestoDTO.Nombre;

                    MarcaRepuestoPorInsertar.CreadoPor = "Roy";
                    ServicioMarcaRepuestos.Insertar(MarcaRepuestoPorInsertar);

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

        // PUT api/<MarcaRepuestosController>/5
        [HttpPut("{id}")]
        public IActionResult Put(int id, [FromBody] MarcaRepuestoDto MarcaRepuestoDTO)
        {
            try
            {
                if (ModelState.IsValid)
                {
                    MarcaRepuesto MarcaRepuestoPorActualizar = new();
                    MarcaRepuestoPorActualizar.Id = MarcaRepuestoDTO.Id;
                    MarcaRepuestoPorActualizar.Nombre = MarcaRepuestoDTO.Nombre;
                   
                   
                    MarcaRepuestoPorActualizar.ModificadoPor = "Roy";
                    MarcaRepuestoPorActualizar.Activo = true;


                    ServicioMarcaRepuestos.Actualizar(MarcaRepuestoPorActualizar);
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

        // DELETE api/<MarcaRepuestosController>/5
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
