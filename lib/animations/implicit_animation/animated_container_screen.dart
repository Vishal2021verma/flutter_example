import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';

class AnimatedContainerScreen extends StatefulWidget {
  const AnimatedContainerScreen({super.key});

  @override
  State<AnimatedContainerScreen> createState() =>
      _AnimatedContainerScreenState();
}

class _AnimatedContainerScreenState extends State<AnimatedContainerScreen> {
  double width = 50;
  double height = 50;
  Color colors = Colors.blueGrey;
  double borderRadius = 12;
  late Timer timer;

  @override
  void initState() {
    super.initState();
    timer = Timer.periodic(const Duration(milliseconds: 1500), (timer) {
      changeValues();
    });
  }

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }

  changeValues() {
    final random = Random();

    width = random.nextInt(300).toDouble();
    height = random.nextInt(300).toDouble();
    colors = Color.fromRGBO(
      random.nextInt(256),
      random.nextInt(256),
      random.nextInt(256),
      1,
    );
    borderRadius = random.nextInt(1000).toDouble();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Animated Container'),
      ),
      body: Center(
        child: AnimatedContainer(
            // padding: EdgeInsets.all(value),
            decoration: BoxDecoration(
                color: colors,
                borderRadius: BorderRadius.circular(borderRadius)),
            width: width,
            height: height,
            duration: const Duration(seconds: 1)),
      ),
    );
  }
}
