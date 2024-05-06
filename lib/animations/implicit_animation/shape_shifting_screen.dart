import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';

class ShapeShiftingScreen extends StatefulWidget {
  const ShapeShiftingScreen({super.key});

  @override
  State<ShapeShiftingScreen> createState() => _ShapeShiftingScreenState();
}

class _ShapeShiftingScreenState extends State<ShapeShiftingScreen> {
  double margin = 100;
  double borderRadius = 0;
  Color bgColor = const Color(0x0fffffff);
  bool animation = false;
  late Timer _timer;
  double randomBorderRadius() {
    return Random().nextDouble() * 64;
  }

  double randomMargin() {
    return Random().nextDouble() * 64;
  }

  Color randomColor() {
    return Color(0xFFFFFFFF & Random().nextInt(0xFFFFFFFF));
  }

  @override
  void initState() {
    super.initState();
    _timer = Timer.periodic(const Duration(milliseconds: 1500), (timer) {
      startAnimation();
    });
  }

  startAnimation() async {
    margin = randomMargin();
    borderRadius = randomBorderRadius();
    bgColor = randomColor();
    setState(() {});
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Shape Shifting')),
      body: Center(
        child: SizedBox(
          height: MediaQuery.sizeOf(context).width * 0.7,
          width: MediaQuery.sizeOf(context).width * 0.7,
          child: AnimatedContainer(
            margin: EdgeInsets.all(margin),
            duration: const Duration(seconds: 1),
            decoration: BoxDecoration(
              // boxShadow: [
              //   BoxShadow(
              //       color: Colors.black.withAlpha(50),
              //       spreadRadius: 50,
              //       blurRadius: 5)
              // ],
              color: bgColor,
              borderRadius: BorderRadius.circular(borderRadius),
            ),
          ),
        ),
      ),
    );
  }
}
