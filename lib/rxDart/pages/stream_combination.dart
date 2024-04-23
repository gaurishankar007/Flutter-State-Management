import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';

class StreamCombinationPage extends StatefulWidget {
  const StreamCombinationPage({super.key});

  @override
  State<StreamCombinationPage> createState() => _StreamCombinationPageState();
}

class _StreamCombinationPageState extends State<StreamCombinationPage> {
  late final Stream<String> combinedStream;
  late final Stream<String> concatenateStream;
  late final Stream<String> mergeStream;
  late final Stream<String> zipStream;
  late final Stream<String> switchMapStream;
  late final BehaviorSubject<DateTime> behaviorSubject;

  @override
  void initState() {
    super.initState();
    final stream1 = periodicStream(1, computation("1"));
    final stream2 = periodicStream(3, computation("2"));
    final stream3 = periodicStream(1, computation("3"));
    final stream4 = periodicStream(1, computation("4"));
    final stream5 = periodicStream(1, computation("5"));
    final stream6 = periodicStream(2, computation("6"));
    final stream7 = periodicStream(1, computation("7"));
    final stream8 = periodicStream(2, computation("8"));

    /// https://rxmarbles.com/#combineLatest
    combinedStream = Rx.combineLatest2(stream1, stream2, (a, b) => "$a, $b");

    /// https://rxmarbles.com/#concat
    concatenateStream = stream3.concatWith([stream4]);

    /// https://rxmarbles.com/#merge
    mergeStream = stream5.mergeWith([stream6]);

    /// https://rxmarbles.com/#zip
    zipStream = Rx.zip2(stream7, stream8, (a, b) => "$a, $b");

    /// https://rxmarbles.com/#switchMap
    behaviorSubject = BehaviorSubject<DateTime>();
    switchMapStream = behaviorSubject.switchMap(
      (dateTime) => periodicStream(
        1,
        (count) => 'Stream count: $count, dateTime: $dateTime',
      ),
    );
  }

  String Function(int) computation(String streamNumber) =>
      (count) => "Stream$streamNumber: ($count)";

  Stream<String> periodicStream(int seconds, String Function(int) computation, [int take = 8]) =>
      Stream.periodic(Duration(seconds: seconds), computation).take(take);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Rx Combining Streams")),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text("Combined Streaming", style: TextStyle(fontWeight: FontWeight.w600)),
            const SizedBox(height: 10, width: double.maxFinite),
            StreamBuilder(
              stream: combinedStream,
              builder: (context, snapshot) {
                if (snapshot.hasData) return Text(snapshot.data ?? "");

                return const Text("Waiting both streams to produce value...");
              },
            ),
            const SizedBox(height: 30),
            const Text("Concatenate Streaming", style: TextStyle(fontWeight: FontWeight.w600)),
            const SizedBox(height: 10),
            StreamBuilder(
              stream: concatenateStream,
              builder: (context, snapshot) {
                if (snapshot.hasData) return Text(snapshot.data ?? "");

                return const Text("Waiting First Stream to produce value...");
              },
            ),
            const SizedBox(height: 30),
            const Text("Merge Streaming", style: TextStyle(fontWeight: FontWeight.w600)),
            const SizedBox(height: 10),
            StreamBuilder(
              stream: mergeStream,
              builder: (context, snapshot) {
                if (snapshot.hasData) return Text(snapshot.data ?? "");

                return const Text("Waiting streams to produce value...");
              },
            ),
            const SizedBox(height: 30),
            const Text("Zip Streaming", style: TextStyle(fontWeight: FontWeight.w600)),
            const SizedBox(height: 10),
            StreamBuilder(
              stream: zipStream,
              builder: (context, snapshot) {
                if (snapshot.hasData) return Text(snapshot.data ?? "");

                return const Text("Waiting both streams to produce value...");
              },
            ),
            const SizedBox(height: 30),
            const Text("SwitchMap Streaming", style: TextStyle(fontWeight: FontWeight.w600)),
            const SizedBox(height: 10),
            StreamBuilder<String>(
              stream: switchMapStream,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  final string = snapshot.requireData;
                  return Text(string);
                } else {
                  return const Text('Waiting for the button to be pressed');
                }
              },
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: () => behaviorSubject.add(DateTime.now()),
              child: const Text('Start Switch Map Stream Again'),
            )
          ],
        ),
      ),
    );
  }
}
