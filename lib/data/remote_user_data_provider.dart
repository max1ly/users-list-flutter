import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:users_you/data/user_dto.dart';

class RemoteUserDataProvider {

  final Uri url = Uri.https("jsonplaceholder.typicode.com", "users");

  Future<List<UserDto>> fetchUsers() async {
    var response = await http.get(url);
    if (response.statusCode == 200) {
      final parsed = jsonDecode(response.body).cast<Map<String, dynamic>>();
      return parsed.map<UserDto>((json) => UserDto.fromJson(json))
          .toList();
    } else {
      return List.empty();
    }
  }
}
