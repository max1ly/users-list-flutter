
import 'package:flutter/material.dart';

class UserItem extends StatelessWidget {
  const UserItem({
    Key? key,
    required this.id,
    required this.email,
    required this.phone,
  }) : super(key: key);

  final int id;
  final String email;
  final String phone;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(email),
      leading: Text(id.toString()),
      subtitle: Text(phone),
    );
  }
}
