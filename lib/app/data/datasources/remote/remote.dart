abstract class UserRemoteDatasource {
  Future<List<Map<String, dynamic>>> getUsers();
  Future<void> addUser(Map<String, dynamic> data);
}
