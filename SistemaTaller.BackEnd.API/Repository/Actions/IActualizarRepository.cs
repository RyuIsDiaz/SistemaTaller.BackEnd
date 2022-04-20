namespace SistemaTaller.BackEnd.API.Repository.Actions
{
    public interface IActualizarRepository<T> where T : class
    {
        /// <summary>
        /// Método que permite actualizar un modelo
        /// </summary>
        /// <param name="t">El modelo para actualizar</param>
        void Actualizar(T t);
    }
}
