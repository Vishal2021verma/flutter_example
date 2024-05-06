import 'package:flutter/material.dart';
import 'package:flutter_downloader/flutter_downloader.dart';
import 'package:flutter_example/animations/animation_screen.dart';
import 'package:flutter_example/animations/hero_animation/hero_page_one.dart';
import 'package:flutter_example/auth/social_login/social_login_screen.dart';
import 'package:flutter_example/go_router/router_config.dart';
import 'package:flutter_example/resource_downloader.dart';
import 'package:flutter_example/widgets/grid_item.dart';

final GlobalKey<NavigatorState> rootNavigatorKey =
    GlobalKey<NavigatorState>(debugLabel: 'root');
final GlobalKey<NavigatorState> shellNavigatorKey =
    GlobalKey<NavigatorState>(debugLabel: 'shell');

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  FlutterDownloader.initialize(debug: true // Set to false in production
      );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // routerConfig: AppRouter.router,0
      // routeInformationParser: ,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),

      home: const MyHomePage(title: '',),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: const Text("Widgets"),
        ),
        body: GridView(
          padding: const EdgeInsets.all(18),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisSpacing: 16, crossAxisCount: 3, mainAxisSpacing: 16),
          children: [
            GridItem(
                name: 'Hero Animation',
                iconData: Icons.animation_rounded,
                navigate: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const HeroPageOne()));
                }),
            GridItem(
                name: 'Animations',
                iconData: Icons.animation_rounded,
                navigate: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const AnimationScreen()));
                }),
            GridItem(
                name: 'Social Login',
                iconData: Icons.animation_rounded,
                navigate: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const SocialLoginScreen()));
                }),
            GridItem(
                name: 'Resource Downloader',
                iconData: Icons.download,
                navigate: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const ResourceDownloader()));
                }),
          ],
        ));
  }
}
