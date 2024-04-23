import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';

class StreamDebounceTimePage extends StatefulWidget {
  const StreamDebounceTimePage({super.key});

  @override
  State<StreamDebounceTimePage> createState() => _StreamDebounceTimePageState();
}

class _StreamDebounceTimePageState extends State<StreamDebounceTimePage> {
  late final BehaviorSubject<String> behaviorSubject;

  @override
  void initState() {
    super.initState();
    behaviorSubject = BehaviorSubject<String>();
  }

  @override
  void dispose() {
    behaviorSubject.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Searching & debounce time")),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text("Search result will appear after 1 second delay"),
            const SizedBox(height: 10, width: double.maxFinite),
            StreamBuilder(
              stream: behaviorSubject.stream.distinct().debounceTime(const Duration(seconds: 1)),
              initialData: "Start typing....",
              builder: (context, snapshot) => Text(snapshot.requireData),
            ),
            const SizedBox(height: 10, width: double.maxFinite),
            SizedBox(
              width: MediaQuery.of(context).size.width * .7,
              child: TextFormField(
                onChanged: behaviorSubject.sink.add,
                decoration: const InputDecoration(
                  enabledBorder: OutlineInputBorder(),
                  focusedBorder: OutlineInputBorder(),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
