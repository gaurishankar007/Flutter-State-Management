import 'package:flutter/foundation.dart';
import 'package:rxdart/rxdart.dart';

import '../../model/living_being.dart';

@immutable
class FilterBloc {
  final Sink<LivingBeingType?> setLivingBeingType; // write-only
  final Stream<LivingBeingType?> currentLivingBeingType; // read-only
  final Stream<Iterable<LivingBeing>> things;

  const FilterBloc._({
    required this.setLivingBeingType,
    required this.currentLivingBeingType,
    required this.things,
  });

  void dispose() {
    setLivingBeingType.close();
  }

  factory FilterBloc({required Iterable<LivingBeing> things}) {
    final typeOfThingSubject = BehaviorSubject<LivingBeingType?>();

    final filteredThings = typeOfThingSubject
        .debounceTime(const Duration(milliseconds: 300))
        .map<Iterable<LivingBeing>>((typeOfThing) {
      if (typeOfThing != null) {
        return things.where((thing) => thing.type == typeOfThing);
      } else {
        return things;
      }
    }).startWith(things);

    return FilterBloc._(
      setLivingBeingType: typeOfThingSubject.sink,
      currentLivingBeingType: typeOfThingSubject.stream,
      things: filteredThings,
    );
  }
}


