import 'package:angel_framework/angel_framework.dart';
import 'package:angel_mongo/angel_mongo.dart';
import 'package:mongo_dart/mongo_dart.dart';
import '../models/artwork.dart';
export '../models/artwork.dart';

configureServer(Db db) {
  return (Angel app) async {
    app.use("/api/artworks", new MongoTypedService<Artwork>(db.collection("artworks")));

    HookedService service = app.service("api/artworks");
    app.container.singleton(service.inner);
  };
}

