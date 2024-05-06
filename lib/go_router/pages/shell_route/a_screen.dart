import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AScreen extends StatefulWidget {
  const AScreen({super.key});

  @override
  State<AScreen> createState() => _AScreenState();
}

class _AScreenState extends State<AScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    log("I am A Screen");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'A',
              style: TextStyle(fontSize: 30),
            ),
            TextButton(
                onPressed: () {
                  GoRouter.of(context).go('/a/detail');
                },
                child: const Text("Go To Details"))
          ],
        ),
      ),
    );
  }
}


