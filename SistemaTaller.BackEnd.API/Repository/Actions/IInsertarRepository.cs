namespace SistemaTaller.BackEnd.API.Repository.Actions
{
    public interface IInsertarRepository<T> where T : class
    {
        void Insertar(T t);
    }
}
