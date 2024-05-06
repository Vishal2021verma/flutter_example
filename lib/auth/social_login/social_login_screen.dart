import 'package:flutter/material.dart';

class SocialLoginScreen extends StatefulWidget {
  const SocialLoginScreen({super.key});

  @override
  State<SocialLoginScreen> createState() => _SocialLoginScreenState();
}

class _SocialLoginScreenState extends State<SocialLoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Social Login'),),
    );
  }
}