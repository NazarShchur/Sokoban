abstract class CrudDao<T>{
  Future<void> save (T entity);
  Future<void> update(T entity);
  Future<List<T>> getAll();
  Future<void> delete(T entity);
}