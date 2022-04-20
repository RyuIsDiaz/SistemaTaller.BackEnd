namespace SistemaTaller.BackEnd.API.UnitOfWork
{
    public interface IUnitOfWork
    {
        IUnitOfWorkAdapter Conectar();
    }
}
