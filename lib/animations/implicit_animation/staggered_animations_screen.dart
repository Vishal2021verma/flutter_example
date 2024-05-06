import 'package:flutter/material.dart';

class StaggeredAnimationScreen extends StatefulWidget {
  const StaggeredAnimationScreen({super.key});

  @override
  State<StaggeredAnimationScreen> createState() =>
      _StaggeredAnimationScreenState();
}

class _StaggeredAnimationScreenState extends State<StaggeredAnimationScreen>
    with TickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _animationScale;
  late Animation<double> _animationRotation;
  late Animation<double> _animationPadding;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
        duration: const Duration(milliseconds: 2000), vsync: this);
    // _animationOpacity =
    //     Tween<double>(begin: 0.1, end: 1).animate(_animationController);

    // // ..addListener(() {
    // //   setState(() {});
    // // });
    _animationPadding = Tween<double>(begin: 0, end: 700).animate(
        CurvedAnimation(
            parent: _animationController,
            curve: const Interval(0.6, 0.9, curve: Curves.bounceOut)));
    _animationRotation = Tween<double>(begin: 0.75, end: 1).animate(
        CurvedAnimation(
            parent: _animationController,
            curve: const Interval(0.0, 0.5, curve: Curves.easeInOut)));
    _animationScale = Tween<double>(begin: 0.5, end: 1).animate(CurvedAnimation(
        parent: _animationController,
        curve: const Interval(0.0, 0.5, curve: Curves.easeInOut)));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Staggered Animation'),
      ),
      body: Align(
        alignment: Alignment.center,
        child: InkWell(
          onTap: () async {
            await _animationController.forward();
            _animationController.reverse();
          },
          child: AnimatedBuilder(
            animation: _animationPadding,
            builder: (context, child) => ScaleTransition(
              scale: _animationScale,
              child: RotationTransition(
                turns: _animationRotation,
                child: Container(
                  margin: EdgeInsets.only(top: _animationPadding.value),
                  child: const Icon(
                    Icons.abc_outlined,
                    size: 100,
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
