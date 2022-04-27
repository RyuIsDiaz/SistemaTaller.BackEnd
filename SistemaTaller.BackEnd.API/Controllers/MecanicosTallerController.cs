using Microsoft.AspNetCore.Mvc;
using SistemaTaller.BackEnd.API.Dtos;
using SistemaTaller.BackEnd.API.Models;
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
            List<MecanicoTaller> ListaTodosLosMecanicosTaller = ServicioMecanicosTaller.SeleccionarTodos();

            List<MecanicoTallerDto> ListaTodosLosMecanicosTallerDto = new();

            foreach (var MecanicoTallerSeleccionado in ListaTodosLosMecanicosTaller)
            {
                MecanicoTallerDto MecanicoTallerDTO = new();

                MecanicoTallerDTO.IdMecanicos = MecanicoTallerSeleccionado.IdMecanicos;
                MecanicoTallerDTO.IdTalleres = MecanicoTallerSeleccionado.IdTalleres;
                MecanicoTallerDTO.Activo = MecanicoTallerSeleccionado.Activo;



                ListaTodosLosMecanicosTallerDto.Add(MecanicoTallerDTO);
            }

            return ListaTodosLosMecanicosTallerDto;
           
        }

        // GET api/<MecanicosTallerController>/5
        [HttpGet("{id}")]
        public void Get(string id)
        {
            
        }

        // POST api/<MecanicosTallerController>
        [HttpPost]
       
         public IActionResult Post([FromBody] MecanicoTallerDto MecanicoTallerDto)
        {
            try
            {
                if (ModelState.IsValid)
                {

                    MecanicoTaller MecanicoTallerPorInsertar = new();

                    MecanicoTallerPorInsertar.IdMecanicos = MecanicoTallerDto.IdMecanicos;
                    MecanicoTallerPorInsertar.IdTalleres = MecanicoTallerDto.IdTalleres;
                    MecanicoTallerPorInsertar.CreadoPor = "Sebastian";
                    ServicioMecanicosTaller.Insertar(MecanicoTallerPorInsertar);

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


     


        // PUT api/<MecanicosTallerController>/5
        [HttpPut("{id}")]
        
        public IActionResult Put(string id, [FromBody] MecanicoTallerDto MecanicoTallerDTO)
        {
            
            try
            {
                if (ModelState.IsValid)
                {
                    MecanicoTaller MecanicoTallerPorActualizar = new();
                    
                   MecanicoTallerPorActualizar.IdMecanicos = MecanicoTallerDTO.IdMecanicos;
                   MecanicoTallerPorActualizar.IdTalleres = MecanicoTallerDTO.IdTalleres;
                  
                   MecanicoTallerPorActualizar.ModificadoPor = "Sebastian" ;
                   MecanicoTallerPorActualizar.Activo = true;

                   
                    ServicioMecanicosTaller.Actualizar(MecanicoTallerPorActualizar);
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
