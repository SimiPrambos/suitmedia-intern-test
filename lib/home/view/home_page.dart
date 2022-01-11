import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:suitmedia/greeting/greeting.dart';
import 'package:suitmedia/home/bloc/name_bloc.dart';
import 'package:suitmedia/l10n/l10n.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _nameController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Image.asset(
            'assets/images/background.png',
            height: double.maxFinite,
            fit: BoxFit.cover,
          ),
          Padding(
            padding: const EdgeInsets.all(32),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Image.asset(
                  'assets/images/btn_add_photo.png',
                  width: 115,
                  height: 115,
                ),
                const SizedBox(height: 50),
                TextField(
                  controller: _nameController,
                  decoration: InputDecoration(
                    hintText: context.l10n.name,
                  ),
                  autocorrect: false,
                  onChanged: (value) {
                    context.read<NameBloc>().add(NameChanged(value));
                  },
                ),
                const SizedBox(height: 22),
                TextField(
                  decoration: InputDecoration(
                    hintText: context.l10n.palindrome,
                  ),
                ),
                const SizedBox(height: 45),
                TextButton(
                  onPressed: () {},
                  child: Text(context.l10n.check.toUpperCase()),
                ),
                const SizedBox(height: 15),
                TextButton(
                  onPressed: () {
                    final state = context.read<NameBloc>().state;
                    if (state is NameLoadFailure) {
                      print(state.message);
                    }
                    if (state is NameLoadSuccess) {
                      Navigator.of(context).push(GreetingPage.route);
                    }
                  },
                  child: Text(context.l10n.next.toUpperCase()),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
