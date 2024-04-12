# Flutter State Management 🚀🚀🚀

A Flutter State Management Project. 
A Quick look through inside the state management solutions provided by flutter itself and packages.

## Stateful Widget Life Cycle
![Stateful Widget Life Cycle Visual Representation](https://miro.medium.com/v2/resize:fit:1400/format:webp/0*53Y7sJmyhEbx4OJw.png)

## Flutter In Built Solutions

- Inherited Widget
    - Key Terms [InheritedWidget, dependOnInheritedWidgetOfExactType, updateShouldNotify]
    - Should be provided at the top level in the widget tree
    - Passes data from top level to deep down into the widget tree
    - Rebuilds the widgets whenever its instance variable's value is changed
    - Should be accessed inside didChangeDependencies or build method
- Inherited Model
    - Key Terms [InheritedModel, inheritFrom, dependencies, updateShouldNotify, updateShouldNotifyDependent]
    - Same as inherited widget, but rebuilds specific widgets only
    - It accepts aspect for determining only which widgets should be rebuild
- Change Notifier
    - Key Terms [ChangeNotifier, notifyListeners, ListenableBuilder]
    - A listenable which can be notified
    - A listenable builder will rebuild the Widget
- Value Notifier
    - Key Terms [ValueNotifier, value, ValueListenableBuilder]
    - A special kind of change notifier
    - It holds single state or single value
    - A value listenable builder will rebuild the Widget
- Inherited Notifier
    - Key Terms [InheritedNotifier, Change Notifier, dependOnInheritedWidgetOfExactType]
    - Same as inherited widget but uses change notifier
    - Rebuilds the widgets whenever change notifier is called

## Flutter Packages Solutions

- Flutter Hooks
    - Key Terms [HookWidget, hooks (ex. useTextEditingController, useAnimationController)]
    - Unlike stateful widgets, it automatically disposes TextEditingController, AnimationController
    - It manages and simplifies a Widget’s life cycle
    - Reduces code duplications
    - Flexibility to create custom hooks
- Provider
    - Key Terms [Provider, ChangeNotifier, notifyListeners, ChangeNotifierProvider, MultiProvider]
    - Key Terms [Provider.of..., read, watch, select]
    - Providers should be provided at the top level so that child widgets can access it
    - context.read or Provider.of(context, listen: false) gets the provider but avoids widget rebuild
    - context.watch or Provider.of(context, listen: true) gets the provider and rebuilds the widget
    - context.select selects the provider's specific variable/part and rebuilds widget only when it is changed
    - Consumer is a widget and rebuilds the widget whenever provider's value is changed
- Riverpod
    - Key Terms [ProviderScope, ProviderContainer, UncontrolledProviderScope]
    - Key Terms [ConsumerWidget, ConsumerStatefulWidget, Consumer]
    - Key Terms [Provider, StateProvider, FutureProvider, StreamProvider]
    - Key Terms [ChangeNotifierProvider, StateNotifierProvider, autoDispose, family]
    - Key Terms [ref, read, watch, select, listen]
    - Provider scope provides access to all the riverpod in the widget tree
    - Provider container helps to use riverpod outside of the widget tree
    - Consumers provide ref and ref helps to access the required riverpod
    - context.read gets the riverpod but avoids widget rebuild
    - context.watch gets the riverpod and rebuilds the widget
    - context.select selects the riverpod's specific variable/part and rebuilds widget only when it is changed
    - Consumer is a widget and rebuilds the widget whenever riverpod value is changed
    - Changes in one riverpod can also reflect changes into another riverpod through communication
    - Riverpod also helps to inject dependencies
- Flutter Bloc
    - Key Terms [Bloc, Cubit, State, Event, transformer, emit, add]
    - Key Terms [BlocProvider, MultiBlocProvider, BlocBuilder, buildWhen]
    - Key Terms [BlocListener, listenWhen, BlocSelector, selector]
    - Key Terms [BlocProvider.of..., read, watch, select]
    - Bloc/Cubit are logics, events (only in bloc) are actions, and states are results which are shown in the UI
    - context.read or BloProvider.of(context, listen: false) gets the bloc but avoids widget rebuild
    - context.watch or BloProvider.of(context, listen: true) gets the bloc and rebuilds the widget
    - context.select selects the bloc's specific variable/part and rebuilds widget only when it is changed
    - BlocBuilder rebuilds widget, and buildWhen filters rebuilds with condition if provided
    - BlocSelector rebuilds only when the selector returns a knew value, selector has dynamic return type
    - BlocListener listens to bloc's state to do tasks, and listenWhen filters listening
    - transformer helps to modifies the behavior of event stream, like providing delay while searching
- Rx Dart
    - Key Terms [PublicSubject, BehaviorSubject, ReplySubject]
    - Key Terms [Stream, Sink, StreamController, StreamSubscription]
    - Key Terms [combineLatest, merge, concatenate, zip]
    - Key Terms [debounceTime, fromCallable, asyncMap, switchMap, startWith, OnErrorReturnWith]
    - Behavior subject holds the last emitted value and provides it to the new listener
    - Stream is read only, sink is write only, stream controller are both, stream subscription are listener
    - Sink and stream subscription should be disposed after disposing the widget
    - Validating text fields, handling errors, fetching api, adding events, emitting states
    - Displaying states based on the provided data
    - Changing state based on user action

## Utility Resources

- Go Router 
    - Navigation
- Extension
    - Extensions on num, map, function, enum
    - Named extension
    - Role of generics on extension

This project is not for a complete beginners.
You should have a good knowledge of dart and flutter framework.
