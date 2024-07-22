import 'dart:developer';

import 'package:flutter/material.dart';

import 'blue_container.dart';
import 'count.dart';
import 'green_container.dart';
import 'stateful_text.dart';
import 'stateless_text.dart';
import 'text_with_key.dart';

class StatefulWidgetLifeCycle extends StatefulWidget {
  final String title;
  const StatefulWidgetLifeCycle({super.key, required this.title});

  @override
  State<StatefulWidgetLifeCycle> createState() =>
      _StatefulWidgetLifeCycleState();
}

class _StatefulWidgetLifeCycleState extends State<StatefulWidgetLifeCycle> {
  final countNotifier = ValueNotifier<int>(0);
  final swapNotifier = ValueNotifier<bool>(false);

  /// GlobalKey to access the state of Text3 widget.
  /// This is used to demonstrate the lifecycle of Text3 widget.
  /// Using UniqueKey will not work as the activate will not be called.
  GlobalKey<TextWithKeyState> text3Key = GlobalKey<TextWithKeyState>();

  @override
  void initState() {
    super.initState();
    log("Main Page initState");
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    log("Main Page didChangeDependencies");
  }

  @override
  void dispose() {
    log("Main Page dispose");
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    /// Build method will be called whenever the media query data is changed.
    MediaQuery.of(context);
    log("Main Page Build");

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              // ----------- Separate Widgets -----------
              ValueListenableBuilder(
                valueListenable: countNotifier,
                builder: (context, count, child) {
                  return Count(count: count);
                },
              ),
              const SizedBox(height: 10),
              const StatefulText(text2Title: "No multiple building."),
              const SizedBox(height: 10),
              const StatelessText(),
              const SizedBox(height: 20),
              SizedBox(
                height: 100,
                child: PageView(
                  scrollDirection: Axis.horizontal,
                  children: const [
                    BlueContainer(),
                    GreenContainer(),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              // Changing location of Text3 widget in the widget tree.
              // It will is be deactivated at first and then activated
              // when it is built again because of the global state key.
              // If it was not rebuilt with the same global state key,
              // then dispose will be called instead of activate.
              ValueListenableBuilder(
                valueListenable: swapNotifier,
                builder: (context, swap, child) {
                  if (!swap) return TextWithKey(key: text3Key);
                  return Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 10,
                      vertical: 5,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.deepPurple,
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: TextWithKey(key: text3Key),
                  );
                },
              ),

              // ----------- End of Separate Widgets -----------

              const SizedBox(height: 30, width: double.maxFinite),
              ElevatedButton(
                onPressed: () => countNotifier.value++,
                child: const Text("Increment Count"),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () => swapNotifier.value = !swapNotifier.value,
                child: const Text("Change Text With Key location"),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () => setState(() {}),
                child: const Text("Refresh Page"),
              ),
              const SizedBox(height: 30, width: double.maxFinite),
              const Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Notes",
                  style: TextStyle(
                    color: Colors.green,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(height: 5),
              ListView.separated(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: notes.length,
                separatorBuilder: (context, index) => const Divider(),
                itemBuilder: (context, index) {
                  return Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("${index + 1}."),
                      const SizedBox(width: 3),
                      Flexible(
                        child: Text(notes[index]),
                      ),
                    ],
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  List<String> get notes => [
        "Constant widget will not be rebuilt and non-constant widget will be build when the parent widget is build again.",
        "'initState' is called at first before build method.",
        "'didChangeDependencies' is called right after 'initState' and before build method, and also when the dependency's value is changed (i.e. MediaQuery, ThemeData, InheritedWidget, etc.).",
        "'didUpdateWidget' is called after setState on parent widget is called and if the widget is non-constant and at least, a value is assigned to the child widget.",
        "'deactivate' is called if a widget is in the widget tree but not rendered in the screen.",
        "'activate' is called when it is rebuilt with the same global state key in different location of the parent widget (widget tree).",
        "'dispose' is called if a widget is removed from the widget tree.",
      ];
}
