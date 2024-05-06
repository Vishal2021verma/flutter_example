import 'package:flutter/material.dart';
import 'package:flutter_example/go_router/pages/about_page.dart';
import 'package:flutter_example/go_router/pages/contact_us_page.dart';
import 'package:flutter_example/go_router/pages/home_page.dart';
import 'package:flutter_example/go_router/pages/login_page.dart';
import 'package:flutter_example/go_router/pages/profile_page.dart';
import 'package:flutter_example/go_router/pages/shell_route/a_screen.dart';
import 'package:flutter_example/go_router/pages/shell_route/b_screen.dart';
import 'package:flutter_example/go_router/pages/shell_route/c_screen.dart';
import 'package:flutter_example/go_router/pages/shell_route/detail_screen.dart';
import 'package:flutter_example/go_router/pages/shell_route/nav_screen.dart';
import 'package:flutter_example/go_router/router_constant.dart';
import 'package:flutter_example/main.dart';
import 'package:go_router/go_router.dart';

// class AppRouter {
//   static final GoRouter router = GoRouter(initialLocation: "/", routes: [
//     GoRoute(
//         name: AppRouterConstant.homePageRouteName,
//         path: "/",
//         pageBuilder: (context, state) {
//           return const MaterialPage(child: HomePage());
//         },
//         routes: [
//           GoRoute(
//             name: AppRouterConstant.loginPageRouteName,
//             path: "login",
//             pageBuilder: (context, state) {
//               return const MaterialPage(child: LoginPage());
//             },
//           ),
//         ]),
//     GoRoute(
//       name: AppRouterConstant.aboutPageRouteName,
//       path: "/about",
//       pageBuilder: (context, state) {
//         return const MaterialPage(child: AboutPage());
//       },
//     ),
//     // GoRoute(
//     //   name: AppRouterConstant.loginPageRouteName,
//     //   path: "/login",
//     //   pageBuilder: (context, state) {
//     //     return const MaterialPage(child: LoginPage());
//     //   },
//     // ),
//     GoRoute(
//       name: AppRouterConstant.contactUsPageRouteName,
//       path: "/contact_us",
//       pageBuilder: (context, state) {
//         return const MaterialPage(child: ContactUsPage());
//       },
//     ),
//     GoRoute(
//       name: AppRouterConstant.profilePageRouteName,
//       path: "/profile",
//       pageBuilder: (context, state) {
//         return const MaterialPage(child: ProfilePage());
//       },
//     ),
//   ]);
// }

class AppRouter {
  static GoRouter router =
      GoRouter(initialLocation: '/a', navigatorKey: rootNavigatorKey, routes: [
    ShellRoute(
        navigatorKey: shellNavigatorKey,
        builder: (context, state, child) => NavScreen(child: child),
        routes: [
          GoRoute(
              path: '/a',
              builder: (context, state) => const AScreen(),
              routes: [
                GoRoute(
                  path: 'detail',
                  builder: (context, state) => DetailScreen(
                      colorCode: Colors.grey[200]!, parentScreen: "A Detail"),
                ),
              
              ]),
          GoRoute(
              path: '/b',
              builder: (context, state) => const BScreen(),
              routes: [
                GoRoute(
                  path: 'detail',
                  parentNavigatorKey: rootNavigatorKey,
                  builder: (context, state) => DetailScreen(
                      colorCode: Colors.blue[200]!, parentScreen: "B Detail"),
                )
              ]),
          GoRoute(
              path: '/c',
              builder: (context, state) => const CScreen(),
              routes: [
                GoRoute(
                  path: 'detail',
                  builder: (context, state) => DetailScreen(
                      colorCode: Colors.blue[200]!, parentScreen: "C Detail"),
                )
              ]),
        ]),
  ]);
}
