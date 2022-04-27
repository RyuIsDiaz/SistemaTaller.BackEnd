using Microsoft.AspNetCore.Mvc;
using SistemaTaller.BackEnd.API.Dtos;
using SistemaTaller.BackEnd.API.Models;
using SistemaTaller.BackEnd.API.Services.Interfaces;

// For more information on enabling Web API for empty projects, visit https://go.microsoft.com/fwlink/?LinkID=397860
//roy
namespace SistemaTaller.BackEnd.API.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class TalleresController : ControllerBase
    {

        private readonly ITalleresService ServicioTalleres;
        public TalleresController(ITalleresService TalleresService)
        {
            ServicioTalleres = TalleresService;
        }
        // GET: api/<TalleresController>
        [HttpGet]
public List<TallerDto> Get()
        {
            List<Taller> ListaTodosLosTalleres = ServicioTalleres.SeleccionarTodos();

            List<TallerDto> ListaTodasLosTalleresDto = new();

            foreach (var TalleresSeleccionado in ListaTodosLosTalleres)
            {
                TallerDto TalleresDTO = new();
                TalleresDTO.Id = TalleresSeleccionado.Id;
                TalleresDTO.Nombre = TalleresSeleccionado.Nombre;
                TalleresDTO.Telefono = TalleresSeleccionado.Telefono;
                TalleresDTO.Canton = TalleresSeleccionado.Canton;
                TalleresDTO.Direccion = TalleresSeleccionado.Direccion;
                TalleresDTO.Email = TalleresSeleccionado.Email;
                TalleresDTO.Activo = TalleresSeleccionado.Activo;



                ListaTodasLosTalleresDto.Add(TalleresDTO);
            }

            return ListaTodasLosTalleresDto;
        }

        // GET api/<TalleresController>/5
        [HttpGet("{id}")]
        public string Get(int id)
        {
            return "value";
        }

        // POST api/<TalleresController>
        [HttpPost]
        public IActionResult Post([FromBody] TallerDto TalleresDTO)
        {
            try
            {
                if (ModelState.IsValid)
                {
                    Taller TalleresPorInsertar = new();

                    TalleresPorInsertar.Id = TalleresDTO.Id;
                    TalleresPorInsertar.Nombre = TalleresDTO.Nombre;
                    TalleresPorInsertar.Telefono = TalleresDTO.Telefono;
                    TalleresPorInsertar.Canton = TalleresDTO.Canton;
                    TalleresPorInsertar.Direccion = TalleresDTO.Direccion;
                    TalleresPorInsertar.Email = TalleresDTO.Email;
                    TalleresPorInsertar.CreadoPor = "Fabián";
                    ServicioTalleres.Insertar(TalleresPorInsertar);

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

        // PUT api/<TalleresController>/5
        [HttpPut("{id}")]
public IActionResult Put(string id, [FromBody] TallerDto TalleresDTO)
        {
            
            try
            {
                if (ModelState.IsValid)
                {
                    Taller TalleresPorActualizar = new();
                    TalleresPorActualizar.Id = TalleresDTO.Id;
                    TalleresPorActualizar.Nombre = TalleresDTO.Nombre;
                    TalleresPorActualizar.Telefono = TalleresDTO.Telefono;
                    TalleresPorActualizar.Canton = TalleresDTO.Canton;
                    TalleresPorActualizar.Direccion = TalleresDTO.Direccion;
                    TalleresPorActualizar.Email = TalleresDTO.Email;
                    TalleresPorActualizar.ModificadoPor = "fabian" ;
                    TalleresPorActualizar.Activo = true;

                   
                    ServicioTalleres.Actualizar(TalleresPorActualizar);
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

        // DELETE api/<TalleresController>/5
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
