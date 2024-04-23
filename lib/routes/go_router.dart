import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../Inherited_model/pages/inherited_model_page.dart';
import '../Inherited_widget/pages/inherited_widget_page.dart';
import '../bloc/pages/bloc_page.dart';
import '../flutter_hook_widgets/hook_use_app_life_cycle_state.dart';
import '../flutter_hook_widgets/hook_use_animation_controller.dart';
import '../flutter_hook_widgets/hook_use_future.dart';
import '../flutter_hook_widgets/hook_use_listenable.dart';
import '../flutter_hook_widgets/hook_use_reducer.dart';
import '../flutter_hook_widgets/hook_use_state.dart';
import '../flutter_hook_widgets/hook_use_stream_controller.dart';
import '../flutter_hook_widgets/hooks_page.dart';
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
import '../rxDart/pages/stream_concatenation.dart';
import '../rxDart/pages/stream_debounce_time.dart';
import '../rxDart/pages/text_field_validation.dart';
import '../screens/flutter_in_built.dart';
import '../screens/flutter_package.dart';
import '../screens/home.dart';
import '../screens/login_dart.dart';
import '../stateful_widget/stateful_widget_life_cycle.dart';
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
        path: "/statefulWidgetLifeCycle/:title",
        name: "stateful widget life cycle",
        builder: (context, state) {
          final String title = state.pathParameters["title"] ?? "";
          return StatefulWidgetLifeCycle(title: title);
        },
      ),
      GoRoute(
        path: "/inheritedWidget/:title",
        name: "inherited widget",
        builder: (context, state) {
          final String title = state.pathParameters["title"] ?? "";
          return InheritedWidgetPage(title: title);
        },
      ),
      GoRoute(
        path: "/inheritedModel/:title",
        name: "inherited model",
        builder: (context, state) {
          final String title = state.pathParameters["title"] ?? "";
          return InheritedModelPage(title: title);
        },
      ),
      GoRoute(
        path: "/inheritedNotifier",
        name: "inherited notifier",
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
        path: "/hookUseState",
        name: "hook useState",
        builder: (context, state) => const HookUseState(),
      ),
      GoRoute(
        path: "/hookUseFuture",
        name: "hook useFuture",
        builder: (context, state) => const HookUseFuture(),
      ),
      GoRoute(
        path: "/hookUseListenable",
        name: "hook useListenable",
        builder: (context, state) => const HookUseListenable(),
      ),
      GoRoute(
        path: "/hookUseAnimationController",
        name: "hook useAnimationController",
        builder: (context, state) => const HookUseAnimationController(),
      ),
      GoRoute(
        path: "/hookUseStreamController",
        name: "hook useStreamController",
        builder: (context, state) => const HookUseStreamController(),
      ),
      GoRoute(
        path: "/hookUseReducer",
        name: "hook useReducer",
        builder: (context, state) => const HookUseReducer(),
      ),
      GoRoute(
        path: "/hookUseAppLifeCycleState",
        name: "hook useAppLifeCycleState",
        builder: (context, state) => const HookUseAppLifeCycleState(),
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
        path: "/streamConcatenation",
        name: "stream concatenation",
        builder: (context, state) => const StreamConcatenationPage(),
      ),
      GoRoute(
        path: "/streamDebounceTime",
        name: "stream debounce time",
        builder: (context, state) => const StreamDebounceTimePage(),
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
