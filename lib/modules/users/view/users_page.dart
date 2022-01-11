import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:suitmedia/modules/users/bloc/users_bloc.dart';

class UsersPage extends StatefulWidget {
  const UsersPage({Key? key}) : super(key: key);

  static MaterialPageRoute<void> get route {
    return MaterialPageRoute(builder: (context) => const UsersPage());
  }

  @override
  State<UsersPage> createState() => _UsersPageState();
}

class _UsersPageState extends State<UsersPage> {
  @override
  void initState() {
    super.initState();
    context.read<UsersBloc>().add(UsersRequested());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Third Screen'),
      ),
      body: BlocBuilder<UsersBloc, UsersState>(
        builder: (context, state) {
          switch (state.status) {
            case UsersStateStatus.failure:
              return const Center(
                child: Text('failed to fetch users'),
              );
            case UsersStateStatus.success:
              if (state.users.isEmpty) {
                return const Center(
                  child: Text('No users found'),
                );
              }
              return ListView.separated(
                padding: const EdgeInsets.all(20),
                itemCount: state.itemCount,
                separatorBuilder: (context, index) => const Divider(),
                itemBuilder: (context, index) {
                  if (index >= state.users.length) {
                    return const Center(
                      child: SizedBox(
                        height: 24,
                        width: 24,
                        child: CircularProgressIndicator(strokeWidth: 1.5),
                      ),
                    );
                  }

                  final user = state.users[index];
                  return ListTile(
                    leading: const CircleAvatar(),
                    title: Text(user.fullName),
                    subtitle: Text(user.email),
                  );
                },
              );
            case UsersStateStatus.initial:
              return const Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}
