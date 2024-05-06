import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CScreen extends StatelessWidget {
  const CScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'C',
              style: TextStyle(fontSize: 30),
            ),
            TextButton(
                onPressed: () {
                   GoRouter.of(context).go('/c/detail');
                },
                child: const Text("Go To Detail"))
          ],
        ),
      ),
    );
  }
}