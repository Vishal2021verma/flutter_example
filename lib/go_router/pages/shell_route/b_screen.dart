import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class BScreen extends StatelessWidget {
  const BScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'B',
              style: TextStyle(fontSize: 30),
            ),
            TextButton(
                onPressed: () {
                   GoRouter.of(context).go('/b/detail');
                },
                child: const Text("Go To Details"))
          ],
        ),
      ),
    );
  }
}
