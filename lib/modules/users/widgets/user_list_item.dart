import 'package:flutter/material.dart';
import 'package:suitmedia/data/models/models.dart';
import 'package:suitmedia/widgets/widgets.dart';

class UserListItem extends StatelessWidget {
  const UserListItem({Key? key, required this.user}) : super(key: key);

  final User user;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Avatar(
        imageUrl: user.avatar,
      ),
      title: Text(user.fullName),
      subtitle: Text(user.email.toUpperCase()),
    );
  }
}
