﻿using Microsoft.AspNetCore.Mvc;

// For more information on enabling Web API for empty projects, visit https://go.microsoft.com/fwlink/?LinkID=397860

namespace SistemaTaller.BackEnd.API.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class RepuestosController : ControllerBase
    {

        private readonly IRepuestosService ServicioRepuestoReparaciones;
        public ClientesController(IRespuestosService RespuestosService)
        {
            ServicioRespuestos = RespuestosService;
        }
        // GET: api/<RepuestosController>
        [HttpGet]
        public IEnumerable<string> Get()
        {
            return new string[] { "value1", "value2" };
        }

        // GET api/<RepuestosController>/5
        [HttpGet("{id}")]
        public string Get(int id)
        {
            return "value";
        }

        // POST api/<RepuestosController>
        [HttpPost]
        public void Post([FromBody] string value)
        {
        }

        // PUT api/<RepuestosController>/5
        [HttpPut("{id}")]
        public void Put(int id, [FromBody] string value)
        {
        }

        // DELETE api/<RepuestosController>/5
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
