import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:users_you/viewmodels/user_list_viewmodel.dart';

class UserSearchWidget extends StatelessWidget {
  const UserSearchWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    int? id;
    String? name;

    return Row(
      children: [
        Expanded(
          child: Padding(
            padding: const EdgeInsets.only(right: 10.0),
            child: TextField(
              textAlign: TextAlign.start,
              decoration: const InputDecoration(
                contentPadding: EdgeInsets.symmetric(horizontal: 5.0),
                focusColor: Colors.white,
                border: OutlineInputBorder(),
                hintText: "User ID",
              ),
              onChanged: (text) {
                id = int.tryParse(text);
              },
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.only(right: 10.0),
            child: TextField(
              textAlign: TextAlign.start,
              decoration: const InputDecoration(
                contentPadding: EdgeInsets.symmetric(horizontal: 5.0),
                focusColor: Colors.white,
                border: OutlineInputBorder(),
                labelText: "Name",
              ),
              onChanged: (text) {
                name = text;
              },
            ),
          ),
        ),
        MaterialButton(
          onPressed: () {
            if (id != null) {
              context.read<UserListViewModel>().displayUsersById(id!);
            } else if (name != null) {
              context.read<UserListViewModel>().displayUsersByName(name!);
            } else {
              context.read<UserListViewModel>().displayAllUsers();
            }
          },
          child: const Text(
            "Search",
            style: TextStyle(color: Colors.white),
          ),
          color: Colors.pinkAccent,
        ),
      ],
    );
  }
}
