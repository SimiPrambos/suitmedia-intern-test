import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

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
                const TextField(
                  decoration: InputDecoration(hintText: 'Name'),
                ),
                const SizedBox(height: 22),
                const TextField(
                  decoration: InputDecoration(hintText: 'Palindrome'),
                ),
                const SizedBox(height: 45),
                TextButton(
                  onPressed: () {},
                  child: const Text('CHECK'),
                ),
                const SizedBox(height: 15),
                TextButton(
                  onPressed: () {},
                  child: const Text('NEXT'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
