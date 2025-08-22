abstract class ICacheService {
  Future<void> write(String key, dynamic value);
  Future<T?> read<T>(String key);
  Future<void> remove(String key);
}
