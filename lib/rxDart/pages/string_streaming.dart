import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';

class StringStreamingPage extends StatefulWidget {
  const StringStreamingPage({super.key});

  @override
  State<StringStreamingPage> createState() => _StringStreamingPageState();
}

class _StringStreamingPageState extends State<StringStreamingPage> {
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
      appBar: AppBar(title: const Text("Behavior Subject String")),
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
