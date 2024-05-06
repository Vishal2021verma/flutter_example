import 'package:flutter/material.dart';

class SimpleFlutterLogoAnimation extends StatefulWidget {
  const SimpleFlutterLogoAnimation({super.key});

  @override
  State<SimpleFlutterLogoAnimation> createState() =>
      _SimpleFlutterLogoAnimationState();
}

class _SimpleFlutterLogoAnimationState extends State<SimpleFlutterLogoAnimation>
    with SingleTickerProviderStateMixin {
  late Animation<double> animation;
  late AnimationController animationController;
  @override
  void initState() {
    super.initState();
    animationController =
        AnimationController(vsync: this, duration: const Duration(seconds: 3));
    animation = Tween<double>(begin: 50, end: 300).animate(animationController);

    animation = CurvedAnimation(
        parent: animationController, curve: Curves.easeInOutQuint)
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          animationController.reverse();
        } else if (status == AnimationStatus.dismissed) {
          animationController.forward();
        }
      });
    //       ..addListener(() {
    //         setState(() {});
    //       });
    animationController.forward();
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: CurvedAnimationExample(animation: animation));
  }

  // @override
  // Widget build(BuildContext context) {
  //   return Scaffold(
  //     body: GrowTransition(
  //       animation: animation,
  //       child: const LogoWidget(),
  //     ),
  //   );
  // }

  // @override
  // Widget build(BuildContext context) {
  //   return Scaffold(
  //     body: Center(
  //       child: Container(
  //         margin: const EdgeInsets.all(20),
  //         // width: 300,
  //         // height: 300,
  //         height: animation.value,
  //         width: animation.value,
  //         child: FlutterLogo(),
  //       ),
  //     ),
  //   );
  // }
}

// class AnimatedLogo extends AnimatedWidget {
//   const AnimatedLogo({super.key, required Animation<double> animation})
//       : super(listenable: animation);

//   @override
//   Widget build(BuildContext context) {
//     final animation = listenable as Animation<double>;
//     return Container(
//       margin: const EdgeInsets.all(24),
//       // height: 300,width: 300,
//       height: animation.value,
//       width: animation.value,
//       child: const FlutterLogo(),
//     );
//   }
// }

class GrowTransition extends StatelessWidget {
  const GrowTransition(
      {super.key, required this.child, required this.animation});
  final Widget child;
  final Animation<double> animation;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: AnimatedBuilder(
        animation: animation,
        builder: (context, child) {
          return SizedBox(
            height: animation.value,
            width: animation.value,
            child: child,
          );
        },
        child: child,
      ),
    );
  }
}

class LogoWidget extends StatelessWidget {
  const LogoWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(18),
      child: const FlutterLogo(),
    );
  }
}

class CurvedAnimationExample extends AnimatedWidget {
  const CurvedAnimationExample(
      {super.key, required Animation<double> animation})
      : super(listenable: animation);
  static final _opacityTween = Tween<double>(begin: 0.1, end: 1);
  static final _sizeTween = Tween<double>(begin: 50, end: 250);

  @override
  Widget build(BuildContext context) {
    final animation = listenable as Animation<double>;
    return Center(
      child: Opacity(
        opacity: _opacityTween.evaluate(animation),
        child: Container(
          margin: const EdgeInsets.all(24),
          height: _sizeTween.evaluate(animation),
          width: _sizeTween.evaluate(animation),
          child: const FlutterLogo(),
        ),
      ),
    );
  }
}
