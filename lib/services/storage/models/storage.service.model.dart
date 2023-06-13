abstract class StorageServiceModel<T> {
  // Simple CRUD
  Future<String> create(T object);
  Future<T?> get(String key);
  Future<void> update(T object, {bool modified = true});
  Future<void> delete(String key);

  // Complex Batch operations
  Future<List<T>> getAll();
  Future<int> setAll(Iterable<T> objects, {bool modified = true});
  Future<int> deleteWithIds(Iterable<String> keys);
  Future<int> dropAll();
}
