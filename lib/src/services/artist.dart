import 'package:angel_framework/angel_framework.dart';
import 'package:angel_mongo/angel_mongo.dart';
import 'package:mongo_dart/mongo_dart.dart';
import '../models/artist.dart';
export '../models/artist.dart';

configureServer(Db db) {
  return (Angel app) async {
    app.use("/api/artists", new MongoTypedService<Artist>(db.collection("artists")));

    HookedService service = app.service("api/artists");
    app.container.singleton(service.inner);
  };
}

