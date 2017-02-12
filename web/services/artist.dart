import 'dart:async';
import 'package:angel/src/models/artist.dart';
import 'package:angel_client/browser.dart';
import 'package:angular2/angular2.dart';
import 'backend.dart';

@Injectable()
class ArtistService {
  final List<Artist> _artists = [];
  Service _service;

  ArtistService(BackendService _backend) {
    _service = _backend.service('api/artists',
        deserializer: (Map data) => new Artist.fromJson(data));
  }

  List<Artist> get artists => new List<Artist>.unmodifiable(_artists);

  Future<List<Artist>> fetchAll() {
    return _service.index().then((List<Artist> artists) {
      _artists
        ..clear()
        ..addAll(artists);
      return artists;
    });
  }

  Future<Artist> fetchById(String id) => _service.read(id);
}
