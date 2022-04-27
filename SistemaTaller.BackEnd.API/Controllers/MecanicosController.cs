using Microsoft.AspNetCore.Mvc;
using SistemaTaller.BackEnd.API.Dtos;
using SistemaTaller.BackEnd.API.Models;
using SistemaTaller.BackEnd.API.Services.Interfaces;

// For more information on enabling Web API for empty projects, visit https://go.microsoft.com/fwlink/?LinkID=397860

namespace SistemaTaller.BackEnd.API.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class MecanicosController : ControllerBase
    {

        private readonly IMecanicosService ServicioMecanicos;
        public MecanicosController(IMecanicosService MecanicosService)
        {
            ServicioMecanicos = MecanicosService;
        }
        // GET: api/<MecanicosController>
        [HttpGet]
        public List<MecanicoDto> Get()
        {
            List<Mecanico> ListaTodosLosMecanicos = ServicioMecanicos.SeleccionarTodos();

            List<MecanicoDto> ListaTodosLosMecanicosDto = new();

            foreach (var MecanicoSeleccionado in ListaTodosLosMecanicos)
            {
                MecanicoDto MecanicoDTO = new();

                MecanicoDTO.Identificaciones = MecanicoSeleccionado.Identificaciones;
                MecanicoDTO.Nombre = MecanicoSeleccionado.Nombre;
                MecanicoDTO.Apellidos = MecanicoSeleccionado.Apellidos;
                MecanicoDTO.Telefono = MecanicoSeleccionado.Telefono;
                MecanicoDTO.Email = MecanicoSeleccionado.Email;
                MecanicoDTO.Activo = MecanicoSeleccionado.Activo;



                ListaTodosLosMecanicosDto.Add(MecanicoDTO);
            }

            return ListaTodosLosMecanicosDto;
           
        }

        // GET api/<MecanicosController>/5
        [HttpGet("{id}")]
        public void Get( string id)
        {
            
        }

        // POST api/<MecanicosController>
        [HttpPost]
        
        public IActionResult Post([FromBody] MecanicoDto MecanicoDto)
        {
            try
            {
                if (ModelState.IsValid)
                {

                    Mecanico MecanicoPorInsertar = new();

                    MecanicoPorInsertar.Identificaciones = MecanicoDto.Identificaciones;
                    MecanicoPorInsertar.Nombre = MecanicoDto.Nombre;
                    MecanicoPorInsertar.Apellidos = MecanicoDto.Apellidos;
                    MecanicoPorInsertar.Telefono = MecanicoDto.Telefono;
                    MecanicoPorInsertar.Email = MecanicoDto.Email;
                    MecanicoPorInsertar.CreadoPor = "Sebastian";
                    ServicioMecanicos.Insertar(MecanicoPorInsertar);

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

        // PUT api/<MecanicosController>/5
        [HttpPut("{id}")]
        
        public IActionResult Put(string id, [FromBody] MecanicoDto MecanicoDTO)
        {
            
            try
            {
                if (ModelState.IsValid)
                {
                    Mecanico MecanicoPorActualizar = new();
                    
                   MecanicoPorActualizar.Identificaciones = MecanicoDTO.Identificaciones;
                   MecanicoPorActualizar.Nombre = MecanicoDTO.Nombre;
                   MecanicoPorActualizar.Apellidos = MecanicoDTO.Apellidos;
                   MecanicoPorActualizar.Telefono = MecanicoDTO.Telefono;
                   MecanicoPorActualizar.Email = MecanicoDTO.Email;
                    
                    MecanicoPorActualizar.ModificadoPor = "Sebastian" ;
                    MecanicoPorActualizar.Activo = true;

                   
                    ServicioMecanicos.Actualizar(MecanicoPorActualizar);
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

        // DELETE api/<MecanicosController>/5
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
