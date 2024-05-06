import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class NavScreen extends StatelessWidget {
  const NavScreen({super.key, required this.child});
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: child,
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
              icon: Icon(
                Icons.home,
              ),
              label: "A"),
          BottomNavigationBarItem(icon: Icon(Icons.explore), label: 'B'),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: "C")
        ],
        currentIndex: _calculateSelectedIndex(context),
        onTap: (int index) => _onItemTapped(index, context),
      ),
    );
  }

  void _onItemTapped(int index, BuildContext context) {
    switch (index) {
      case 0:
        GoRouter.of(context).go('/a');
      case 1:
        GoRouter.of(context).go('/b');
      case 2:
        GoRouter.of(context).go('/c');
    }
  }

  static int _calculateSelectedIndex(BuildContext context) {
    final String location = GoRouterState.of(context).uri.path;
    if (location.startsWith('/a')) {
      return 0;
    } else if (location.startsWith('/b')) {
      return 1;
    } else if (location.startsWith('/c')) {
      return 2;
    } else {
      return 0;
    }
  }
}
