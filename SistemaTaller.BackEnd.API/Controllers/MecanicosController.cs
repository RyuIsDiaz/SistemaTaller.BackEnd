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
        
        public IActionResult Post([FromBody] MecanicoDto mecanicoDto)
        {
            try
            {
                if (ModelState.IsValid)
                {

                    Mecanico MecanicoPorInsertar = new();

                    ClientePorInsertar.Identificacion = ClienteDTO.Identificacion;
                    ClientePorInsertar.Nombre = ClienteDTO.Nombre;
                    ClientePorInsertar.Apellidos = ClienteDTO.Apellidos;
                    ClientePorInsertar.Telefono = ClienteDTO.Telefono;
                    ClientePorInsertar.Email = ClienteDTO.Email;
                    ClientePorInsertar.Direccion = ClienteDTO.Direccion;
                    ClientePorInsertar.CreadoPor = "Roy";
                    ServicioDeClientes.Insertar(ClientePorInsertar);

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
        public void Put(int id, [FromBody] string value)
        {
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
