import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:users_you/viewmodels/user_list_viewmodel.dart';
import 'package:users_you/widgets/user_item.dart';

class UserList extends StatelessWidget {
  const UserList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<UserListViewModel>(
      builder: (context, viewModel, child) {
        if (viewModel.users.isNotEmpty) {
          return ListView.builder(
            itemBuilder: (context, index) {
              final user = viewModel.users[index];
              return UserItem(
                id: user.id,
                email: user.email ?? "UNKNOWN",
                phone: user.phone ?? "UNKNOWN",
              );
            },
            itemCount: viewModel.usersCount,
          );
        } else {
          return Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              CircularProgressIndicator(
                backgroundColor: Colors.white,
              ),
            ],
          );
        }
      },
    );
  }
}
