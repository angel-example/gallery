library angel.models.artist;

import 'dart:convert';
import 'package:angel_mongo/model.dart';

class Artist extends Model {
  String name, country;

  Artist({this.name, this.country});

  factory Artist.fromJson(String json) => new Artist.fromMap(JSON.decode(json));

  factory Artist.fromMap(Map data) => new Artist(
      name: data["name"],
      country: data["country"]);

  Map toJson() {
    return {
      "name": name,
      "country": country
    };
  }
}