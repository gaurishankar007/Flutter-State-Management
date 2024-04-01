import 'package:flutter/material.dart';

import '../model/living_being.dart';
import '../rxBloc/filter/filter_bloc.dart';

class FilterStreamingPage extends StatefulWidget {
  const FilterStreamingPage({super.key});

  @override
  State<FilterStreamingPage> createState() => _FilterStreamingPageState();
}

class _FilterStreamingPageState extends State<FilterStreamingPage> {
  late final FilterBloc bloc;
  final things = [
    const LivingBeing(name: 'Foo', type: LivingBeingType.person),
    const LivingBeing(name: 'Bar', type: LivingBeingType.person),
    const LivingBeing(name: 'Baz', type: LivingBeingType.person),
    const LivingBeing(name: 'Bunz', type: LivingBeingType.animal),
    const LivingBeing(name: 'Fluffers', type: LivingBeingType.animal),
    const LivingBeing(name: 'Woofz', type: LivingBeingType.animal),
  ];

  @override
  void initState() {
    super.initState();
    bloc = FilterBloc(things: things);
  }

  @override
  void dispose() {
    bloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('FilterChip with RxDart')),
      body: Column(
        children: [
          StreamBuilder<LivingBeingType?>(
            stream: bloc.currentLivingBeingType,
            builder: (context, snapshot) {
              final selectedLivingBeingType = snapshot.data;
              return Wrap(
                spacing: 20,
                children: LivingBeingType.values.map((typeOfThing) {
                  return FilterChip(
                    selectedColor: Colors.blueAccent[100],
                    onSelected: (selected) {
                      final type = selected ? typeOfThing : null;
                      bloc.setLivingBeingType.add(type);
                    },
                    label: Text(typeOfThing.name),
                    selected: selectedLivingBeingType == typeOfThing,
                  );
                }).toList(),
              );
            },
          ),
          Expanded(
            child: StreamBuilder<Iterable<LivingBeing>>(
              stream: bloc.things,
              builder: (context, snapshot) {
                final things = snapshot.data ?? [];
                return ListView.builder(
                  itemCount: things.length,
                  itemBuilder: (context, index) {
                    final thing = things.elementAt(index);
                    return ListTile(title: Text(thing.name), subtitle: Text(thing.type.name));
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
