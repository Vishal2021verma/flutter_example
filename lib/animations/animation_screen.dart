import 'package:flutter/material.dart';
import 'package:flutter_example/animations/implicit_animation/animated_container_screen.dart';
import 'package:flutter_example/animations/implicit_animation/fade_in_screen.dart';
import 'package:flutter_example/animations/implicit_animation/shape_shifting_screen.dart';
import 'package:flutter_example/animations/implicit_animation/staggered_animation_menu_screen.dart';
import 'package:flutter_example/animations/implicit_animation/staggered_animations_screen.dart';
import 'package:flutter_example/widgets/grid_item.dart';

class AnimationScreen extends StatelessWidget {
  const AnimationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Animation"),
        ),
        body: GridView(
          padding: const EdgeInsets.all(18),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisSpacing: 16, crossAxisCount: 3, mainAxisSpacing: 16),
          children: [
            GridItem(
                name: 'Fade In',
                iconData: Icons.animation_outlined,
                navigate: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const FadeInScreen()));
                }),
            GridItem(
                name: 'Shape Shifting',
                iconData: Icons.animation_rounded,
                navigate: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const ShapeShiftingScreen()));
                }),
            GridItem(
                name: 'Animated Container',
                iconData: Icons.animation_rounded,
                navigate: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              const AnimatedContainerScreen()));
                }),
            GridItem(
                name: 'Staggered Animation',
                iconData: Icons.animation_rounded,
                navigate: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              const StaggeredAnimationScreen()));
                }),
            GridItem(
                name: 'Staggered Menu Animation',
                iconData: Icons.menu_open_outlined,
                navigate: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const StaggeredMenuAnimation()));
                }),
          ],
        ));
  }
}
