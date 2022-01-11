import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:suitmedia/l10n/l10n.dart';
import 'package:suitmedia/modules/home/home.dart';

class GreetingPage extends StatelessWidget {
  const GreetingPage({Key? key}) : super(key: key);
  static MaterialPageRoute<void> get route {
    return MaterialPageRoute(builder: (context) => const GreetingPage());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(context.l10n.greetingAppBarTitle),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              context.l10n.welcome,
              style: const TextStyle(height: 3),
            ),
            BlocBuilder<NameBloc, NameState>(
              builder: (context, state) {
                if (state is NameLoadSuccess) {
                  return Text(
                    state.name,
                    style: Theme.of(context).textTheme.headline6,
                  );
                }

                return const SizedBox();
              },
            ),
            Expanded(
              child: Center(
                child: Text(
                  'Selected User Name',
                  style: Theme.of(context).textTheme.headline5,
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: Container(
        width: double.maxFinite,
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: TextButton(
          onPressed: () {},
          child: Text(context.l10n.chooseUser),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
