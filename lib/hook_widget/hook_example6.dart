import 'dart:developer' as dev;
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

enum UserAction { rotateLeft, rotateRight, moreVisible, lessVisible }

@immutable
class UIState {
  final double rotation;
  final double alpha;

  const UIState({
    required this.rotation,
    required this.alpha,
  });

  const UIState.zero()
      : rotation = 0,
        alpha = 1;

  UIState rotateRight() => UIState(
        rotation: rotation + 10,
        alpha: alpha,
      );

  UIState rotateLeft() => UIState(
        rotation: rotation - 10,
        alpha: alpha,
      );

  UIState increaseAlpha() => UIState(
        rotation: rotation,
        alpha: min(alpha + .1, 1.0),
      );

  UIState decreaseAlpha() => UIState(
        rotation: rotation,
        alpha: max(alpha - .1, 0.0),
      );
}

UIState reducer(UIState oldState, UserAction? action) {
  switch (action) {
    case UserAction.rotateLeft:
      return oldState.rotateLeft();
    case UserAction.rotateRight:
      return oldState.rotateRight();
    case UserAction.moreVisible:
      return oldState.increaseAlpha();
    case UserAction.lessVisible:
      return oldState.decreaseAlpha();
    case null:
      return oldState;
  }
}

class HookExample6 extends HookWidget {
  const HookExample6({super.key});

  String get url =>
      "https://letsenhance.io/static/8f5e523ee6b2479e26ecc91b9c25261e/1015f/MainAfter.jpg";

  @override
  Widget build(BuildContext context) {
    dev.log("Hook Example6");

    final store = useReducer<UIState, UserAction?>(
      reducer,
      initialState: const UIState.zero(),
      initialAction: null,
    ); // This calls build function again

    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text("UseCase: useReducer"),
            const SizedBox(height: 20, width: double.maxFinite),
            Wrap(
              spacing: 10,
              runSpacing: 10,
              children: [
                ElevatedButton(
                  onPressed: () => store.dispatch(UserAction.rotateLeft),
                  child: const Text("Rotate Left"),
                ),
                ElevatedButton(
                  onPressed: () => store.dispatch(UserAction.rotateRight),
                  child: const Text("Rotate Right"),
                ),
                ElevatedButton(
                  onPressed: () => store.dispatch(UserAction.moreVisible),
                  child: const Text("More Visible"),
                ),
                ElevatedButton(
                  onPressed: () => store.dispatch(UserAction.lessVisible),
                  child: const Text("Less Visible"),
                ),
              ],
            ),
            const SizedBox(height: 100),
            Opacity(
              opacity: store.state.alpha,
              child: RotationTransition(
                turns: AlwaysStoppedAnimation(store.state.rotation / 360),
                child: Center(child: Image.network(url)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
