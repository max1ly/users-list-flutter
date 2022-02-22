import 'package:users_you/data/remote_user_data_provider.dart';
import 'package:users_you/domain/user.dart';

class UserDataService {
  final RemoteUserDataProvider _userDataProvider = RemoteUserDataProvider();
  List<User> _users = List.empty();

  Future<List<User>> allUsers() async {
    await _loadIfEmpty();
    return _users;
  }

  Future<List<User>> findUsersById(int id) async {
    await _loadIfEmpty();
    return _users.where((user) => user.id == id).toList();
  }

  Future<List<User>> findUsersByName(String name) async {
    await _loadIfEmpty();
    return _users.where((user) =>
      user.name.toLowerCase().contains(name.toLowerCase())
    ).toList();
  }

  Future<void> _loadIfEmpty() async {
    if (_users.isEmpty) {
      await _loadAllUsers();
    }
  }

  Future<void> _loadAllUsers() async {
    final newUsers = await _userDataProvider.fetchUsers();
    _users = newUsers
        .where((dto) => dto.id != null && dto.name != null)
        .map((dto) => User(
              id: dto.id!,
              name: dto.name!,
              email: dto.email,
              phone: dto.phone,
            ))
        .toList();
  }
}
