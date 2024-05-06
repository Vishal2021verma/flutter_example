import 'package:flutter/material.dart';
import 'package:flutter_example/go_router/router_constant.dart';
import 'package:go_router/go_router.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Login"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextButton(
                onPressed: () {
                  context.goNamed(AppRouterConstant.homePageRouteName);
                },
                child: const Text('Home'))
          ],
        ),
      ),
    );
  }
}
