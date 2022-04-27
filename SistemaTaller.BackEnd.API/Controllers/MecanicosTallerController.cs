using Microsoft.AspNetCore.Mvc;
using 
using SistemaTaller.BackEnd.API.Services.Interfaces;

// For more information on enabling Web API for empty projects, visit https://go.microsoft.com/fwlink/?LinkID=397860

namespace SistemaTaller.BackEnd.API.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class MecanicosTallerController : ControllerBase
    {

        private readonly IMecanicosTallerService ServicioMecanicosTaller;
        public MecanicosTallerController(IMecanicosTallerService MecanicosTallerService)
        {
            ServicioMecanicosTaller = MecanicosTallerService;
        }
        // GET: api/<MecanicosTallerController>
        [HttpGet]
        public List<MecanicoTallerDto> Get()
        {
            List<Mecanicotaller> ListaTodosLosMecanicosTaller = ServicioMecanicosTaller.SeleccionarTodos();

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

        // GET api/<MecanicosTallerController>/5
        [HttpGet("{id}")]
        public string Get(int id)
        {
            return "value";
        }

        // POST api/<MecanicosTallerController>
        [HttpPost]
        public void Post([FromBody] string value)
        {
        }

        // PUT api/<MecanicosTallerController>/5
        [HttpPut("{id}")]
        public void Put(int id, [FromBody] string value)
        {
        }

        // DELETE api/<MecanicosTallerController>/5
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
