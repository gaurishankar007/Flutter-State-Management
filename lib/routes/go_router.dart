import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../InheritedWidget/pages/inherited_widget_page.dart';
import '../bloc/pages/bloc_page.dart';
import '../provider/pages/count_provider_page.dart';
import 'transition_page.dart';
import '../screens/flutter_in_built.dart';
import '../screens/flutter_package.dart';
import '../screens/home.dart';
import '../screens/login_dart.dart';

import '../InheritedModel/pages/inherited_model_page.dart';
import '../inheritedNotifier/pages/inherited_notifier_page.dart';

final GlobalKey<NavigatorState> rootNavigatorKey = GlobalKey<NavigatorState>();
bool isLoggedIn = false;

GoRouter get goRouter {
  return GoRouter(
    navigatorKey: rootNavigatorKey,
    initialLocation: "/flutter",
    errorBuilder: (context, state) => errorScreen(state.error.toString()),
    routes: [
      ShellRoute(
        builder: (context, state, child) => Home(child: child),
        routes: [
          GoRoute(
            path: "/flutter",
            name: "flutter",
            builder: (context, state) => const FlutterInBuilt(),
          ),
          GoRoute(
            path: "/package",
            name: "package",
            builder: (context, state) => const FlutterPackage(),
          ),
        ],
      ),
      GoRoute(
        path: "/inheritedWidget/:title",
        name: "inheritedWidget",
        builder: (context, state) {
          final String title = state.pathParameters["title"] ?? "";
          return InheritedWidgetPage(title: title);
        },
      ),
      GoRoute(
        path: "/inheritedModel/:title",
        name: "inheritedModel",
        builder: (context, state) {
          final String title = state.pathParameters["title"] ?? "";
          return InheritedModelPage(title: title);
        },
      ),
      GoRoute(
        path: "/inheritedNotifier",
        name: "inheritedNotifier",
        builder: (context, state) {
          final String title = state.uri.queryParameters["title"] ?? "";
          return InheritedNotifierPage(title: title);
        },
      ),
      GoRoute(
        path: "/provider",
        name: "provider",
        builder: (context, state) {
          final String title = state.uri.queryParameters["title"] ?? "";
          return CountProviderPage(title: title);
        },
        redirect: (context, state) {
          if (isLoggedIn) return null;
          return "/login";
        },
      ),
      GoRoute(
        path: "/bloc",
        name: "bloc",
        pageBuilder: (context, state) => transitionPage(
          child: const BlocPage(),
          direction: AxisDirection.left,
        ),
      ),
      GoRoute(
        path: "/login",
        name: "login",
        pageBuilder: (context, state) => transitionPage(
          child: const Login(),
          direction: AxisDirection.left,
        ),
      ),
    ],
  );
}

Widget errorScreen(String error) => Scaffold(
      body: SafeArea(
        child: Center(child: Text(error)),
      ),
    );
