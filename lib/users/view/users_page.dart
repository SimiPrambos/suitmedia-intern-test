import 'package:flutter/material.dart';

class UsersPage extends StatelessWidget {
  const UsersPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Third Screen'),
      ),
      body: ListView.separated(
        padding: const EdgeInsets.all(20),
        itemCount: 10,
        separatorBuilder: (context, index) => const Divider(),
        itemBuilder: (context, index) {
          return const ListTile(
            leading: CircleAvatar(),
            title: Text('Firstname LastName'),
            subtitle: Text('email@email.com'),
          );
        },
      ),
    );
  }
}
