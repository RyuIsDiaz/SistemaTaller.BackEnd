using Microsoft.AspNetCore.Mvc;
using SistemaTaller.BackEnd.API.Dtos;
using SistemaTaller.BackEnd.API.Models;
using SistemaTaller.BackEnd.API.Services.Interfaces;

// For more information on enabling Web API for empty projects, visit https://go.microsoft.com/fwlink/?LinkID=397860

namespace SistemaTaller.BackEnd.API.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class VehiculosController : ControllerBase
    {

        private readonly IVehiculosService ServicioVehiculos;
        public VehiculosController(IVehiculosService VehiculosService)
        {
            ServicioVehiculos = VehiculosService;
        }
        // GET: api/<VehiculosController>
        [HttpGet]
public List<VehiculoDto> Get()
        {
            List<Vehiculos> ListaTodosLosVehiculos = ServicioVehiculos.SeleccionarTodos();

            List<VehiculoDto> ListaTodasLosVehiculosDto = new();

            foreach (var VehiculosSeleccionado in ListaTodosLosVehiculos)
            {
                VehiculoDto VehiculosDTO = new();
                VehiculosDTO.IdMarca = VehiculosSeleccionado.IdMarca;
                VehiculosDTO.Placa = VehiculosSeleccionado.Placa;
                VehiculosDTO.Modelo = VehiculosSeleccionado.Modelo;
                VehiculosDTO.Activo = VehiculosSeleccionado.Activo;
                ListaTodasLosVehiculosDto.Add(VehiculosDTO);
            }

            return ListaTodasLosVehiculosDto;
        }

        // GET api/<VehiculosController>/5
        [HttpGet("{id}")]
        public string Get(int id)
        {
            return "value";
        }

        // POST api/<VehiculosController>
        [HttpPost]
public IActionResult Post([FromBody] VehiculoDto VehiculosDTO)
        {
            try
            {
                if (ModelState.IsValid)
                {
                    Vehiculo VehiculoPorInsertar = new();

                    VehiculoPorInsertar.IdMarca = VehiculosDTO.IdMarca;
                    VehiculoPorInsertar.Placa = VehiculosDTO.Placa;
                    VehiculoPorInsertar.Modelo = VehiculosDTO.Modelo;
                    VehiculoPorInsertar.Activo = VehiculosDTO.Activo;
                    VehiculoPorInsertar.CreadoPor = "Fabián";
                    ServicioVehiculos.Insertar(VehiculoPorInsertar);

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

        // PUT api/<VehiculosController>/5
        [HttpPut("{id}")]
public IActionResult Put(string id, [FromBody] VehiculoDto VehiculosDTO)
        {

            try
            {
                if (ModelState.IsValid)
                {
                    Vehiculo VehiculoPorActualizar = new();
                    VehiculoPorActualizar.IdMarca = VehiculosDTO.IdMarca;
                    VehiculoPorActualizar.Placa = VehiculosDTO.Placa;
                    VehiculoPorActualizar.Modelo = VehiculosDTO.Modelo;
                    VehiculoPorActualizar.Activo = VehiculosDTO.Activo;
                    VehiculoPorActualizar.ModificadoPor = "fabian";
                    VehiculoPorActualizar.Activo = true;


                    ServicioVehiculos.Actualizar(VehiculoPorActualizar);
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

        // DELETE api/<VehiculosController>/5
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
