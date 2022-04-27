using Microsoft.AspNetCore.Mvc;
using SistemaTaller.BackEnd.API.Dtos;
using SistemaTaller.BackEnd.API.Models;
using SistemaTaller.BackEnd.API.Services.Interfaces;

// For more information on enabling Web API for empty projects, visit https://go.microsoft.com/fwlink/?LinkID=397860

namespace SistemaTaller.BackEnd.API.Controllers
{

    [Route("api/[controller]")]
    [ApiController]
    public class ClienteController : ControllerBase
    {

        private readonly IClientesService ServicioDeClientes;
        public ClienteController(IClientesService ClientesService)
        {
            ServicioDeClientes = ClientesService;
        }
        // GET: api/<ClientesController>
        [HttpGet]
        public List<ClienteDto> Get()
        {
            List<Cliente> ListaTodosLosClientes = ServicioDeClientes.SeleccionarTodos();

            List<ClienteDto> ListaTodasLosClientesDto = new();

            foreach (var Clienteseleccionado in ListaTodosLosClientes)
            {
                ClienteDto ClienteDTO = new();

                ClienteDTO.Identificacion = Clienteseleccionado.Identificacion;
                ClienteDTO.Nombre = Clienteseleccionado.Nombre;
                ClienteDTO.Apellidos = Clienteseleccionado.Apellidos;
                ClienteDTO.Telefono = Clienteseleccionado.Telefono;
                ClienteDTO.Email = Clienteseleccionado.Email;
                ClienteDTO.Direccion = Clienteseleccionado.Direccion;

                

                ListaTodasLosClientesDto.Add(ClienteDTO);
            }

            return ListaTodasLosClientesDto;
        }

        // GET api/<ClientesController>/5
        [HttpGet("{id}")]
        public string Get(int id)
        {
            return "value";
        }

        // POST api/<ClientesController>
        [HttpPost]
        public void Post([FromBody] string value)
        {
        }

        // PUT api/<ClientesController>/5
        [HttpPut("{id}")]
        public IActionResult Put(string id, [FromBody] ClienteDto ClienteDTO)
        {
            
            try
            {
                if (ModelState.IsValid)
                {
                    Cliente ClientePorActualizar = new();
                    ClientePorActualizar.Identificacion = ClienteDTO.Identificacion;
                    ClientePorActualizar.Nombre = ClienteDTO.Nombre;
                    ClientePorActualizar.Apellidos = ClienteDTO.Apellidos;
                    ClientePorActualizar.Telefono = ClienteDTO.Telefono;
                    ClientePorActualizar.Email = ClienteDTO.Email;
                    ClientePorActualizar.Direccion = ClienteDTO.Direccion;
                    ClientePorActualizar.ModificadoPor = "fabian" ;
                    ClientePorActualizar.Activo = true;

                   
                    ServicioDeClientes.Actualizar(ClientePorActualizar);
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

        // DELETE api/<ClientesController>/5
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
