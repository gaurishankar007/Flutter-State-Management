import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:rxdart/rxdart.dart';

class StringConcatenationPage extends StatefulWidget {
  const StringConcatenationPage({super.key});

  @override
  State<StringConcatenationPage> createState() => _StringConcatenationPageState();
}

class _StringConcatenationPageState extends State<StringConcatenationPage> {
  Stream<String> getNames(String filePath) {
    final names = rootBundle.loadString(filePath);
    final stream = Stream.fromFuture(names);

    return stream.transform(const LineSplitter());
  }

  Stream<String> getAllNames() {
    const catNamesPath = 'assets/texts/cats.txt';
    const dogNamesPath = 'assets/texts/dogs.txt';
    final stream = getNames(catNamesPath).concatWith([getNames(dogNamesPath)]);

    return stream.delay(const Duration(seconds: 2));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('String Concatenation with RxDart')),
      body: FutureBuilder<List<String>>(
        future: getAllNames().toList(),
        builder: (context, snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.none:
            case ConnectionState.waiting:
            case ConnectionState.active:
              return const Center(child: CircularProgressIndicator());
            case ConnectionState.done:
              final names = snapshot.requireData;

              return ListView.separated(
                padding: const EdgeInsets.all(20),
                separatorBuilder: (_, __) => const Divider(color: Colors.black, height: 1),
                itemCount: names.length,
                itemBuilder: (context, index) {
                  return ListTile(title: Text(names[index]));
                },
              );
          }
        },
      ),
    );
  }
}
