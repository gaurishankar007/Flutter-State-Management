import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../InheritedModel/pages/inherited_model_page.dart';
import '../InheritedWidget/pages/inherited_widget_page.dart';
import '../bloc/pages/bloc_page.dart';
import '../inheritedNotifier/pages/inherited_notifier_page.dart';
import '../provider/pages/count_provider_page.dart';
import '../riverpod/pages/count_future_provider_page.dart';
import '../riverpod/pages/count_state_provider_page.dart';
import '../riverpod/pages/count_stream_provider_page.dart';
import '../riverpod/pages/film_state_notifier_provider_page.dart';
import '../riverpod/pages/person_change_notifier_provider_page.dart';
import '../riverpod/pages/riverpod_page.dart';
import '../rxDart/pages/filter_streaming.dart';
import '../rxDart/pages/rx_dart_page.dart';
import '../rxDart/pages/state_streaming.dart';
import '../rxDart/pages/stream_combination.dart';
import '../rxDart/pages/string_streaming.dart';
import '../rxDart/pages/text_field_validation.dart';
import '../screens/flutter_in_built.dart';
import '../screens/flutter_package.dart';
import '../screens/home.dart';
import '../screens/login_dart.dart';
import 'go_router_observer.dart';

final GlobalKey<NavigatorState> rootNavigatorKey = GlobalKey<NavigatorState>();
bool isLoggedIn = false;

GoRouter get goRouter {
  return GoRouter(
    navigatorKey: rootNavigatorKey,
    initialLocation: "/flutter",
    errorBuilder: (context, state) => Scaffold(
      body: SafeArea(
        child: Center(
          child: Text(state.error.toString()),
        ),
      ),
    ),
    observers: [GoRouterObserver()],
    routes: [
      /// <====== Navigator ======>
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
          GoRoute(
            path: "/login",
            name: "login",
            builder: (context, state) => const Login(),
          ),
        ],
      ),

      /// <====== State Management With In Built Flutter Methods And Functions ======>
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

      /// <====== State Management With Packages ======>
      /// <====== Provider ======>
      GoRoute(
        path: "/provider",
        name: "provider",
        builder: (context, state) {
          final String title = state.uri.queryParameters["title"] ?? "";
          return CountProviderPage(title: title);
        },
        redirect: (context, state) {
          if (isLoggedIn) return null;
          navBarIndex.value = 2;
          return "/login";
        },
      ),

      /// <====== Bloc ======>
      GoRoute(
        path: "/bloc",
        name: "bloc",
        builder: (context, state) => const BlocPage(),
      ),

      /// <====== Riverpod ======>
      GoRoute(
        path: "/riverpod",
        name: "riverpod",
        builder: (context, state) => const RiverpodPage(),
      ),
      GoRoute(
        path: "/stateProvider",
        name: "state provider",
        builder: (context, state) => const CountStateProviderPage(),
      ),
      GoRoute(
        path: "/futureProvider",
        name: "future provider",
        builder: (context, state) => const CountFutureProviderPage(),
      ),
      GoRoute(
        path: "/streamProvider",
        name: "stream provider",
        builder: (context, state) => const CountStreamProviderPage(),
      ),
      GoRoute(
        path: "/changeNotifierProvider",
        name: "change notifier provider",
        builder: (context, state) => PersonChangeNotifierProviderPage(),
      ),
      GoRoute(
        path: "/stateNotifierProvider",
        name: "state notifier provider",
        builder: (context, state) => const FilmStateNotifierProviderPage(),
      ),

      /// <====== Rx Dart ======>
      GoRoute(
        path: "/rxDart",
        name: "rxDart",
        builder: (context, state) => const RxDartPage(),
      ),
      GoRoute(
        path: "/stringStreaming",
        name: "string streaming",
        builder: (context, state) => const StringStreamingPage(),
      ),
      GoRoute(
        path: "/stateStreaming",
        name: "state streaming",
        builder: (context, state) => const StateStreamingPage(),
      ),
      GoRoute(
        path: "/streamCombination",
        name: "stream combination",
        builder: (context, state) => const StreamCombinationPage(),
      ),
      GoRoute(
        path: "/filterStreaming",
        name: "filter streaming",
        builder: (context, state) => const FilterStreamingPage(),
      ),
      GoRoute(
        path: "/textFieldValidation",
        name: "text field validation",
        builder: (context, state) => const TextFieldValidationPage(),
      ),
    ],
  );
}
