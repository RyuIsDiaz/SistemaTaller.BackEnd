using Microsoft.AspNetCore.Mvc;
using SistemaTaller.BackEnd.API.Dtos;
using SistemaTaller.BackEnd.API.Models;
using SistemaTaller.BackEnd.API.Services.Interfaces;

// For more information on enabling Web API for empty projects, visit https://go.microsoft.com/fwlink/?LinkID=397860

namespace SistemaTaller.BackEnd.API.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class ReparacionesController : ControllerBase
    {
        private readonly IReparacionesService ServicioReparaciones;
        public ReparacionesController(IReparacionesService ReparacionesService)
        {
            ServicioReparaciones = ReparacionesService;
        }
        // GET: api/<ReparacionesController>
        [HttpGet]
        public List<ReparacionDto> Get()
        {
            List<Reparacion> ListaTodasLasReparaciones = ServicioReparaciones.SeleccionarTodos();

            List<ReparacionDto> ListaTodasLasReparacionesDto = new();

            foreach (var ReparacionSeleccionada in ListaTodasLasReparaciones)
            {
                ReparacionDto ReparacionDTO = new();

                ReparacionDTO.IdReparaciones= ReparacionSeleccionada.IdReparaciones;
                ReparacionDTO.IdEstadosReparacion = ReparacionSeleccionada.IdEstadosReparacion;
                ReparacionDTO.PlacasVehiculos= ReparacionSeleccionada.PlacasVehiculos;
                ReparacionDTO.IdMecanicos= ReparacionSeleccionada.IdMecanicos;
                ReparacionDTO.DiagnosticosReparaciones = ReparacionSeleccionada.DiagnosticosReparaciones;
                ReparacionDTO.MontosDeObra = ReparacionSeleccionada.MontosDeObra;
                ReparacionDTO.MontosRepuestos = ReparacionSeleccionada.MontosRepuestos;
                ReparacionDTO.MontosTotales = ReparacionSeleccionada.MontosTotales;

                ReparacionDTO.Activo = ReparacionSeleccionada.Activo;





                ListaTodasLasReparacionesDto.Add(ReparacionDTO);
            }

            return ListaTodasLasReparacionesDto;
        }


        // GET api/<ReparacionesController>/5
        [HttpGet("{id}")]
        public void Get (int id)
        {
           
        }

        // POST api/<ReparacionesController>
        [HttpPost]
        public IActionResult Post([FromBody] ReparacionDto ReparacionDTO)
        {
            try
            {
                if (ModelState.IsValid)
                {
                    Reparacion ReparacionPorInsertar = new();

                    ReparacionPorInsertar.IdReparaciones = ReparacionDTO.IdReparaciones;
                    ReparacionPorInsertar.IdMecanicos = ReparacionDTO.IdMecanicos;
                    ReparacionPorInsertar.IdEstadosReparacion= ReparacionDTO.IdReparaciones;
                    ReparacionPorInsertar.PlacasVehiculos = ReparacionDTO.PlacasVehiculos;
                    ReparacionPorInsertar.DiagnosticosReparaciones = ReparacionDTO.DiagnosticosReparaciones;
                    ReparacionPorInsertar.MontosDeObra = ReparacionDTO.MontosDeObra;
                    ReparacionPorInsertar.MontosRepuestos = ReparacionDTO.MontosRepuestos;
                    ReparacionPorInsertar.MontosRepuestos = ReparacionDTO.MontosRepuestos;
                    ReparacionPorInsertar.CreadoPor = "Sebastian";
                    ServicioReparaciones.Insertar(ReparacionPorInsertar);

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

        // PUT api/<ReparacionesController>/5
        [HttpPut("{id}")]

        public IActionResult Put(int id, [FromBody] ReparacionDto ReparacionDTO)
        {

            try
            {
                if (ModelState.IsValid)
                {
                    Reparacion ReparacionPorActualizar = new();
                   
                    ReparacionPorActualizar.IdReparaciones = ReparacionDTO.IdReparaciones;
                    ReparacionPorActualizar.IdMecanicos = ReparacionDTO.IdMecanicos;
                    ReparacionPorActualizar.IdEstadosReparacion = ReparacionDTO.IdEstadosReparacion;
                    ReparacionPorActualizar.DiagnosticosReparaciones = ReparacionDTO.DiagnosticosReparaciones;
                    ReparacionPorActualizar.MontosDeObra = ReparacionDTO.MontosDeObra;
                    ReparacionPorActualizar.MontosRepuestos = ReparacionDTO.MontosRepuestos;
                    ReparacionPorActualizar.MontosTotales = ReparacionDTO.MontosTotales;
                    ReparacionPorActualizar.ModificadoPor = "Sebastian";
                    ReparacionPorActualizar.Activo = true;


                    ServicioReparaciones.Actualizar(ReparacionPorActualizar);
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

        // DELETE api/<ReparacionesController>/5
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
