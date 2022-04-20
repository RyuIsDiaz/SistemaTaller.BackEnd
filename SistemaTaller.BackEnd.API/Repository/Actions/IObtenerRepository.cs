namespace SistemaTaller.BackEnd.API.Repository.Actions
{
    public interface IObtenerRepository<T, Y> where T : class
    {
        List<T> SeleccionarTodos();
        T SeleccionarPorId(Y id);
    }
}
