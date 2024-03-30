import 'dart:developer';

void main() {
  const place = Place("Kathmandu", 1599);

  log(ShortDescription(place).description);
  log(LongDescription(place).description);
}

class Place {
  final String name;
  final int popularity;

  const Place(this.name, this.popularity);
}

extension ShortDescription on Place {
  String get description => "Place $name";
}

extension LongDescription on Place {
  String get description => "Place, name: $name, popularity: $popularity";
}
