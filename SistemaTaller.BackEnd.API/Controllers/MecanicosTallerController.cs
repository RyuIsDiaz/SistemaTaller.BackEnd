using Microsoft.AspNetCore.Mvc;

// For more information on enabling Web API for empty projects, visit https://go.microsoft.com/fwlink/?LinkID=397860

namespace SistemaTaller.BackEnd.API.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class MecanicosTallerController : ControllerBase
    {
        // GET: api/<MecanicosTallerController>
        [HttpGet]
        public IEnumerable<string> Get()
        {
            return new string[] { "value1", "value2" };
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
