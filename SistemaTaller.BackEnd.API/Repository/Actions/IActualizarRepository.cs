namespace SistemaTaller.BackEnd.API.Repository.Actions
{
    public interface IActualizarRepository<T> where T : class
    {
        void Actualizar(T t);
    }
}
