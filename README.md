# Flutter State Management 🚀🚀🚀

A Flutter State Management Project.
A Quick look through inside the state management solutions provided by Flutter itself and packages.

## Stateful Widget Life Cycle

![Stateful Widget Life Cycle Visual Representation](https://miro.medium.com/v2/resize:fit:1400/format:webp/0*53Y7sJmyhEbx4OJw.png)

- **Create State**: Create a state object for the widget.
- **Mounted** = `true`
- **Init State**: Called once when the state object is inserted into the widget tree.
- **Did Change Dependencies**: Rebuilds the widget when dependencies change.
- **Dirty** = `true`: Indicates the widget needs to rebuild.
- **Build**: Builds the widget UI.
- **Dirty** = `false`: Indicates the widget is up-to-date.
- **Did Update Widget**: Called when the widget’s configuration changes.
- **Set State**: Triggers `dirty = true` to rebuild the widget.
- **Deactivate**: Triggered when the widget is removed/changed in the tree.
- **Activate**: Triggered when the widget’s location changes in the tree.
- **Dispose**: Triggered when the widget is permanently removed from the tree.
- **Mounted** = `false`

---

## **State Management Solutions**

### **Overview of State Management Approaches**

State management can be broadly categorized into three approaches based on how state is handled:

#### 1. **Imperative Solutions**

- Focus on explicitly instructing the framework on how to update the UI.
- State changes trigger direct updates to the widget tree.
- Example: **setState**, **ChangeNotifier**, **ValueNotifier**.

#### 2. **Declarative Solutions**

- Emphasize declaring the UI as a function of the state.
- State changes automatically propagate to the UI.
- Example: **InheritedWidget**, **InheritedModel**, **Inherited Notifier**, **Provider**, **Riverpod**.

#### 3. **Reactive Solutions**

- Focus on reacting to changes in the state by observing streams or observables.
- Example: **Flutter Bloc**, **RxDart**, **MobX**, **Riverpod**.

### **Differences and When to Use Which**

| **Aspect**         | **Imperative**                          | **Declarative**                                                         | **Reactive**                                |
| ------------------ | --------------------------------------- | ----------------------------------------------------------------------- | ------------------------------------------- |
| **Complexity**     | Low                                     | Medium                                                                  | High                                        |
| **Learning Curve** | Easy                                    | Moderate                                                                | Steep                                       |
| **Performance**    | Minimal overhead                        | Efficient updates                                                       | Handles large-scale updates efficiently     |
| **Best For**       | Simple state management                 | Medium complexity apps                                                  | Complex apps with highly dynamic data flows |
| **Examples**       | setState, ChangeNotifier, ValueNotifier | InheritedWidget, InheritedModel, Inherited Notifier, Provider, Riverpod | Bloc, RxDart, MobX, Riverpod                |

#### **When to Use:**

- **Imperative**: Use for small-scale, straightforward applications with minimal state.
- **Declarative**: Use for medium complexity apps requiring clear and manageable state propagation.
- **Reactive**: Use for large, complex applications where state depends on dynamic or asynchronous streams of data.

---

## **Categorized State Management Options**

### **Imperative Solutions**

- **`setState`**

  - ✅ Key Terms: [setState, Dirty, Build].
  - Directly updates the UI by marking it dirty and rebuilding.
  - Suitable for small-scale, simple state changes.

- **`Change Notifier`**

  - ✅ Key Terms: [ChangeNotifier, notifyListeners, ListenableBuilder].
  - Provides a way to notify listeners when changes occur.
  - A `ListenableBuilder` will rebuild the widget.

- **`Value Notifier`**

  - ✅ Key Terms: [ValueNotifier, value, ValueListenableBuilder].
  - A special kind of `ChangeNotifier` holding a single state or value.
  - A `ValueListenableBuilder` rebuilds the widget.

---

### **Declarative Solutions**

- **`Inherited Widget`**

  - ✅ Key Terms: [InheritedWidget, dependOnInheritedWidgetOfExactType, updateShouldNotify].
  - Passes data from the top level to deep down in the widget tree.
  - Rebuilds widgets whenever its instance variable’s value changes.
  - Should be accessed inside `didChangeDependencies` or `build` methods.

- **`Inherited Model`**

  - ✅ Key Terms: [InheritedModel, inheritFrom, dependencies, updateShouldNotify, updateShouldNotifyDependent].
  - Similar to `InheritedWidget`, but rebuilds only specific widgets.
  - Accepts "aspect" for determining which widgets to rebuild.

- **`Inherited Notifier`**

  - ✅ Key Terms: [InheritedNotifier, Change Notifier, dependOnInheritedWidgetOfExactType].
  - Combines `InheritedWidget` with `ChangeNotifier`.
  - Rebuilds widgets whenever the `ChangeNotifier` is called.

- **`Provider`**

  - ✅ Key Terms: [Provider, ChangeNotifier, notifyListeners, ChangeNotifierProvider, MultiProvider].
  - Offers an easy-to-use state propagation solution.
  - `Consumer` rebuilds widgets whenever provider’s value changes.

---

### **Reactive Solutions**

- **`Flutter Bloc`**

  - ✅ Key Terms: [Bloc, Cubit, State, Event, BlocProvider, BlocBuilder, BlocListener].
  - Separates business logic (Bloc/Cubit) from UI.
  - `BlocBuilder` rebuilds UI on state changes; `BlocListener` listens for state changes to trigger actions.

- **`Rx Dart`**

  - ✅ Key Terms: [Observable, BehaviorSubject, Stream, Sink, StreamController, debounceTime].
  - Uses reactive streams to handle state dynamically.
  - Ideal for asynchronous operations, form validation, and complex state dependencies.

- **`MobX`**

  - ✅ Key Terms: [Store, @observable, @action, Observer, autorun].
  - Simplifies state management using observables and actions.
  - `Observer` rebuilds UI automatically when state changes.

---

### **Declarative/Reactive Solutions**

- **`Riverpod`**

  - ✅ Key Terms: [ProviderScope, ProviderContainer, ConsumerWidget, ref, read, watch, select].
  - Allows dependency injection and advanced state management.
  - Provides an easy way to manage state both inside and outside the widget tree.
  - It can be used declaratively with providers and reactively with streams and providers.

---

## Thread Safety in Flutter

Thread safety refers to the ability of a program to handle multiple threads executing simultaneously without causing race conditions, data corruption, or unexpected behavior.

Flutter runs on a single-threaded event loop called the UI thread, but it allows developers to use Isolates (Dart's version of threads) for running heavy tasks in the background. Managing state properly across multiple threads (or isolates) is crucial to ensure data integrity and avoid inconsistencies in state management solutions like Bloc, MobX, Riverpod, and Provider.

## Thread Safety in Different Flutter State Management Solutions

### 1. Flutter Bloc/Cubit

#### Thread Safety in Bloc:

- Bloc and Cubit run inside Flutter’s main isolate, meaning state updates happen sequentially, reducing the need for explicit thread safety measures.
- Events and state changes are processed one at a time in the event loop, ensuring consistency.
- However, if you perform heavy operations (like network requests) inside mapEventToState(), it can block the UI. Use Isolates or Future/Stream to prevent UI freezing.

#### Example of Thread Safety in Bloc:

```dart
class CounterCubit extends Cubit<int> {
  CounterCubit() : super(0);

  void increment() async {
    final newValue = await computeHeavyTask(state);
    emit(newValue);
  }

  Future<int> computeHeavyTask(int currentState) async {
    return await Future.delayed(Duration(seconds: 1), () => currentState + 1);
  }
}
```

- Here, computeHeavyTask runs asynchronously, preventing UI thread blockage.

---

### 2. MobX in Flutter

#### Thread Safety in MobX:

- MobX uses Reactive Programming with observables, actions, and reactions.
- Since Flutter's UI thread is single-threaded, state updates occur in a controlled order.
- However, if MobX is used in an Isolate, you must ensure state mutations happen on the main thread.

#### Example of Thread Safety in MobX:

```dart
class Counter = _Counter with _$Counter;

abstract class _Counter with Store {
  @observable
  int value = 0;

  @action
  Future<void> increment() async {
    final newValue = await computeHeavyTask(value);
    value = newValue;
  }

  Future<int> computeHeavyTask(int currentValue) async {
    return await Future.delayed(Duration(seconds: 1), () => currentValue + 1);
  }
}
```

- The increment() function ensures state modification happens inside an action, making it thread-safe.

---

### 3. Riverpod in Flutter

#### Thread Safety in Riverpod:

- Riverpod ensures state providers execute synchronously on the main thread.
- If a provider does asynchronous work, Riverpod handles it safely by ensuring state changes happen on the main thread.
- The autoDispose modifier helps prevent memory leaks when providers are no longer needed.

#### Example of Thread Safety in Riverpod:

```dart
final counterProvider = StateNotifierProvider<CounterNotifier, int>(
  (ref) => CounterNotifier(),
);

class CounterNotifier extends StateNotifier<int> {
  CounterNotifier() : super(0);

  void increment() async {
    final newValue = await computeHeavyTask(state);
    state = newValue;
  }

  Future<int> computeHeavyTask(int currentState) async {
    return await Future.delayed(Duration(seconds: 1), () => currentState + 1);
  }
}
```

- Riverpod ensures the state update happens on the main thread, preventing race conditions.

---

### 4. Provider in Flutter

#### Thread Safety in Provider:

- The ChangeNotifier in Provider ensures UI updates happen in a single-threaded manner.
- However, if you use Future or Stream inside a provider, make sure updates happen on the main isolate.

#### Example of Thread Safety in Provider:

```dart
class CounterProvider with ChangeNotifier {
  int _count = 0;
  int get count => _count;

  void increment() async {
    _count = await computeHeavyTask(_count);
    notifyListeners();
  }

  Future<int> computeHeavyTask(int currentCount) async {
    return await Future.delayed(Duration(seconds: 1), () => currentCount + 1);
  }
}
```

- The notifyListeners() method ensures that UI updates happen safely on the main thread.

---

### Summary Table of Thread Safety Across State Management Solutions

| State Management | Thread Safety Mechanism                                 |
| ---------------- | ------------------------------------------------------- |
| Bloc/Cubit       | Sequential event processing, use async for heavy tasks  |
| MobX             | Actions enforce controlled state updates                |
| Riverpod         | Ensures state updates occur on the main thread          |
| Provider         | ChangeNotifier ensures state updates on the main thread |

---

### Conclusion

Each Flutter state management solution has built-in thread safety mechanisms. However, when dealing with async tasks, always ensure updates happen on the main thread to prevent UI freezes and race conditions.

---

## Thread Safety Issues in Different Flutter State Management Solutions

Certainly! Here are examples of thread safety issues that can occur in different state management solutions if not handled properly. These examples demonstrate race conditions, UI freezes, and inconsistent state updates.

### 1. Bloc/Cubit – Race Condition Issue

#### Problem:

- If multiple events modify the state asynchronously, the latest emitted state might overwrite previous updates unexpectedly.

#### Example of Race Condition in Bloc

```dart
class CounterCubit extends Cubit<int> {
  CounterCubit() : super(0);

  void increment() async {
    int newValue = state + 1;
    await Future.delayed(Duration(seconds: 2)); // Simulating a delay
    emit(newValue); // This may emit an outdated state if another event was processed in the meantime.
  }
}
```

#### Issue Explanation

- If increment() is called multiple times in quick succession, the delayed state update may overwrite a newer state.
- Example:
  - Initial state: 0
  - First increment() → Sets newValue = 1, delays for 2s
  - Second increment() → Sets newValue = 2, delays for 2s
  - Second call finishes first, emitting 2
  - First call (older state) finishes later, emitting 1 (wrong state!)

#### Solution

##### Use current state reference inside async calls:

```dart
void increment() async {
  await Future.delayed(Duration(seconds: 2));
  emit(state + 1); // Ensures latest state is used
}
```

### 2. MobX – UI Freezing Due to Heavy Computation

#### Problem:

- Performing synchronous heavy computation on the main thread blocks the UI.

#### Example of UI Freeze in MobX

```dart
class Counter = _Counter with _$Counter;

abstract class _Counter with Store {
  @observable
  int value = 0;

  @action
  void increment() {
    value = heavyComputation(value); // This blocks the UI
  }

  int heavyComputation(int currentState) {
    int result = currentState;
    for (int i = 0; i < 1000000000; i++) {
      result += 1; // Simulating a long-running computation
    }
    return result;
  }
}
```

#### Issue Explanation

- The increment() function performs a loop with heavy computation.
- Since MobX runs on the main thread, the UI becomes unresponsive.

#### Solution

##### Move heavy work to an async function:

```dart
@action
Future<void> increment() async {
  value = await computeHeavyTask(value);
}

Future<int> computeHeavyTask(int currentState) async {
  return await Future.delayed(Duration(seconds: 1), () => currentState + 1);
}
```

---

### 3. Riverpod – Asynchronous Inconsistent State Update

#### Problem:

- If the state is modified inside an async function, it might overwrite newer updates.

#### Example of Inconsistent State in Riverpod

```dart
final counterProvider = StateNotifierProvider<CounterNotifier, int>(
(ref) => CounterNotifier(),
);

class CounterNotifier extends StateNotifier<int> {
  CounterNotifier() : super(0);

  void increment() async {
    int newValue = state + 1;
    await Future.delayed(Duration(seconds: 2)); // Simulating delay
    state = newValue; // Might overwrite newer state!
  }
}
```

#### Issue Explanation

- If the user taps multiple times quickly, an older state may be set after a newer state was already set.
- Example:
  - User taps once → Sets newValue = 1, delays for 2s
  - User taps again → Sets newValue = 2, delays for 2s
  - Second tap finishes first, setting state to 2
  - First tap (older state) finishes later, setting state to 1 (wrong!)

#### Solution

##### Use state reference inside async calls:

```dart
void increment() async {
  await Future.delayed(Duration(seconds: 2));
  state = state + 1; // Ensures the latest state is used
}
```

---

### 4. Provider – State Not Updating Properly

#### Problem:

- If notifyListeners() is called inside an async function, the UI may not reflect the latest state.

#### Example of State Not Updating Properly in Provider

```dart
class CounterProvider with ChangeNotifier {
  int _count = 0;
  int get count => _count;

  void increment() async {
    _count += 1;
    await Future.delayed(Duration(seconds: 2));
    notifyListeners(); // Might notify listeners after newer updates
  }
}
```

#### Issue Explanation

- The UI does not update immediately because notifyListeners() happens after the delay.
- If another update happens before notifyListeners() is called, the UI may reflect outdated values.

#### Solution

##### Call notifyListeners() immediately and update the state inside Future:

```dart
void increment() {
  _count += 1;
  notifyListeners(); // UI updates immediately

  Future.delayed(Duration(seconds: 2), () {
    _count += 1; // Delayed state update
    notifyListeners();
  });
}
```

---

### Summary Table of Issues & Fixes

| State Management | Issue                                                      | Fix                                                       |
| ---------------- | ---------------------------------------------------------- | --------------------------------------------------------- |
| Bloc/Cubit       | Race condition due to async state updates                  | Use current `state` inside async calls                    |
| MobX             | UI freezes due to heavy computation                        | Perform heavy tasks asynchronously using Isolates/Futures |
| Riverpod         | Async state updates overwrite new state                    | Always use current `state` inside async calls             |
| Provider         | `notifyListeners()` inside async function delays UI update | Call `notifyListeners()` immediately                      |

---

### Conclusion

- Race conditions happen when async updates overwrite newer states.
- UI freezes happen when heavy computations run on the main thread.
- Delayed UI updates happen when notifyListeners() is used incorrectly in Provider.
- Always use the latest state reference inside async functions to prevent inconsistencies.

---

## **Utility Resources**

- **`Flutter Hooks`**

  - ✅ Key Terms: [HookWidget, useTextEditingController, useAnimationController].
  - Simplifies widget lifecycle management.
  - Reduces code duplication and offers flexibility with custom hooks.
  - Handles disposable components automatically like `TextEditingController`, `AnimationController`.
