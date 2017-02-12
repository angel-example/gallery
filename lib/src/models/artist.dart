library angel.models.artist;

import 'package:angel_mongo/model.dart';

class Artist extends Model {
  String name, country;

  Artist({this.name, this.country});

  factory Artist.fromJson(Map data) => new Artist(
      name: data["name"],
      country: data["country"]);

  Map toJson() {
    return {
      "name": name,
      "country": country
    };
  }
}