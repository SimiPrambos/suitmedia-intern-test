import 'package:flutter/material.dart';

class GreetingPage extends StatelessWidget {
  const GreetingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Second Screen'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text(
              'Welcome',
              style: TextStyle(height: 3),
            ),
            Text(
              'John Doe',
              style: Theme.of(context).textTheme.headline6,
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
          child: const Text('Choose a User'),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
