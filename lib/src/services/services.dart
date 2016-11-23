/// Declare services here!
library angel.services;

import 'package:angel_framework/angel_framework.dart';
import 'package:mongo_dart/mongo_dart.dart';
import 'artist.dart' as Artist;
import 'artwork.dart' as Artwork;
import 'user.dart' as User;

configureServer(Angel app) async {
  Db db = new Db(app.properties["mongo_db"]);
  await db.open();
  await app.configure(Artist.configureServer(db));
  await app.configure(Artwork.configureServer(db));
  await app.configure(User.configureServer(db));
}