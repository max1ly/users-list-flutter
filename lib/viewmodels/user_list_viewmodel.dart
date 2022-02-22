import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:users_you/data/user_data_service.dart';
import 'package:users_you/domain/user.dart';

class UserListViewModel extends ChangeNotifier {

  final UserDataService _userDataService = UserDataService();
  List<User> _users = List.empty();


  UserListViewModel() {
    displayAllUsers();
  }

  Future<void> displayAllUsers() async {
    _users = await _userDataService.allUsers();
    notifyListeners();
  }

  Future<void> displayUsersById(int id) async {
    _users = await _userDataService.findUsersById(id);
    notifyListeners();
  }

  Future<void> displayUsersByName(String name) async {
    _users = await _userDataService.findUsersByName(name);
    notifyListeners();
  }

  UnmodifiableListView<User> get users {
    return UnmodifiableListView(_users);
  }

  int get usersCount {
    return _users.length;
  }
}
