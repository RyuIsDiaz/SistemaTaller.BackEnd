using Microsoft.AspNetCore.Mvc;
using SistemaTaller.BackEnd.API.Dtos;
using SistemaTaller.BackEnd.API.Models;
using SistemaTaller.BackEnd.API.Services.Interfaces;

// For more information on enabling Web API for empty projects, visit https://go.microsoft.com/fwlink/?LinkID=397860

namespace SistemaTaller.BackEnd.API.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class MarcaVehiculosController : ControllerBase
    {

        private readonly IMarcaVehiculosService ServicioMarcaVehiculos;
        public MarcaVehiculosController(IMarcaVehiculosService MarcaVehiculosService)
        {
            ServicioMarcaVehiculos = MarcaVehiculosService;
        }
        // GET: api/<MarcaVehiculosController>
        [HttpGet]
        public List<MarcaVehiculoDto> Get()
        {
            List<MarcaVehiculo> ListaTodosLasMarcaVehiculo = ServicioMarcaVehiculos.SeleccionarTodos();

            List<MarcaVehiculoDto> ListaTodosLasMarcaVehiculoDto = new();

            foreach (var MarcaVehiculoSeleccionado in ListaTodosLasMarcaVehiculo)
            {
                MarcaVehiculoDto MarcaVehiculoDTO = new();

                MarcaVehiculoDTO.Id = MarcaVehiculoSeleccionado.Id;
                MarcaVehiculoDTO.Nombre = MarcaVehiculoSeleccionado.Nombre;

                MarcaVehiculoDTO.Activo = MarcaVehiculoSeleccionado.Activo;



                ListaTodosLasMarcaVehiculoDto.Add(MarcaVehiculoDTO);
            }

            return ListaTodosLasMarcaVehiculoDto;
        }

        // GET api/<MarcaVehiculosController>/5
        [HttpGet("{id}")]
        public string Get(int id)
        {
            return "value";
        }

        // POST api/<MarcaVehiculosController>
        [HttpPost]
        public IActionResult Post([FromBody] MarcaVehiculoDto MarcaVehiculoDTO)
        {
            try
            {
                if (ModelState.IsValid)
                {
                    MarcaVehiculo MarcaMarcaVehiculoPorInsertar = new();

                    MarcaMarcaVehiculoPorInsertar.Id = MarcaVehiculoDTO.Id;
                    MarcaMarcaVehiculoPorInsertar.Nombre = MarcaVehiculoDTO.Nombre;

                    MarcaMarcaVehiculoPorInsertar.CreadoPor = "Roy";
                    ServicioMarcaVehiculos.Insertar(MarcaMarcaVehiculoPorInsertar);

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

            // PUT api/<MarcaVehiculosController>/5
            [HttpPut("{id}")]
            public IActionResult Put(int id, [FromBody] MarcaVehiculoDto MarcaVehiculoDTO)
            {

            try
            {
                if (ModelState.IsValid)
                {
                    MarcaVehiculo MarcaVehiculoPorActualizar = new();
                    MarcaVehiculoPorActualizar.Id = MarcaVehiculoDTO.Id;
                    MarcaVehiculoPorActualizar.Nombre = MarcaVehiculoDTO.Nombre;
                    
                    MarcaVehiculoPorActualizar.ModificadoPor = "fabian";
                    MarcaVehiculoPorActualizar.Activo = true;


                    ServicioMarcaVehiculos.Actualizar(MarcaVehiculoPorActualizar);
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

            // DELETE api/<MarcaVehiculosController>/5
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

