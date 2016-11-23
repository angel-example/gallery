library angel.models.artwork;

import 'dart:convert';
import 'package:angel_mongo/model.dart';

class Artwork extends Model {
  String artistId, title, url;

  Artwork({this.artistId, this.title, this.url});

  factory Artwork.fromJson(String json) => new Artwork.fromMap(JSON.decode(json));

  factory Artwork.fromMap(Map data) => new Artwork(
      artistId: data["artist_id"],
      title: data["title"],
      url: data["url"]);

  Map toJson() {
    return {
      "artist_id": artistId,
      "title": title,
      "url": url
    };
  }
}