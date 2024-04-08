import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../Inherited_model/pages/inherited_model_page.dart';
import '../Inherited_widget/pages/inherited_widget_page.dart';
import '../bloc/pages/bloc_page.dart';
import '../build_mechanism/build_mechanism.dart';
import '../hook_widget/hook_example1.dart';
import '../hook_widget/hook_example2.dart';
import '../hook_widget/hook_example3.dart';
import '../hook_widget/hook_example4.dart';
import '../hook_widget/hook_example5.dart';
import '../hook_widget/hook_example6.dart';
import '../hook_widget/hook_example7.dart';
import '../hook_widget/hooks_page.dart';
import '../inherited_notifier/pages/inherited_notifier_page.dart';
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
import '../rxDart/pages/string_concatenation.dart';
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
        path: "/buildMechanism/:title",
        name: "buildMechanism",
        builder: (context, state) {
          final String title = state.pathParameters["title"] ?? "";
          return BuildMechanism(title: title);
        },
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

      /// <====== State Management With Packages ======>
      /// <====== Flutter Hooks ======>
      GoRoute(
        path: "/flutterHooks",
        name: "flutter hooks",
        builder: (context, state) => const HooksPage(),
      ),
      GoRoute(
        path: "/hookExample1",
        name: "hook example1",
        builder: (context, state) => const HookExample1(),
      ),
      GoRoute(
        path: "/hookExample2",
        name: "hook example2",
        builder: (context, state) => const HookExample2(),
      ),
      GoRoute(
        path: "/hookExample3",
        name: "hook example3",
        builder: (context, state) => const HookExample3(),
      ),
      GoRoute(
        path: "/hookExample4",
        name: "hook example4",
        builder: (context, state) => const HookExample4(),
      ),
      GoRoute(
        path: "/hookExample5",
        name: "hook example5",
        builder: (context, state) => const HookExample5(),
      ),
      GoRoute(
        path: "/hookExample6",
        name: "hook example6",
        builder: (context, state) => const HookExample6(),
      ),
      GoRoute(
        path: "/hookExample7",
        name: "hook example7",
        builder: (context, state) => const HookExample7(),
      ),

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
        path: "/stringConcatenation",
        name: "string concatenation",
        builder: (context, state) => const StringConcatenationPage(),
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
