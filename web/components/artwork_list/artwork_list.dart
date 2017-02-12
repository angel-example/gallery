import 'package:angel/src/models/artwork.dart';
import 'package:angel_client/browser.dart' show Service;
import 'package:angular2/core.dart' show Component;
import 'package:angular2/router.dart' show OnActivate, Router, RouterLink;
import 'package:angular2_components/angular2_components.dart'
    show GlyphComponent, MaterialButtonComponent, MaterialFabComponent;
import '../../services/backend.dart';

@Component(
    selector: 'artwork-list',
    templateUrl: 'artwork_list.html',
    directives: const [
      GlyphComponent,
      MaterialButtonComponent,
      MaterialFabComponent,
      RouterLink
    ],
    styles: const [
      '''
      material-fab {
          position: fixed !important;
          bottom: 1em;
          right: 1em;
      }
      '''
    ])
class ArtworkListComponent implements OnActivate {
  final Router _router;
  Service _service;
  final List<Artwork> works = [];

  ArtworkListComponent(BackendService backend, this._router) {
    _service = backend.service('api/artworks');
  }

  fetchWorks() {
    _service.index().then((works) {
      this.works
        ..clear()
        ..addAll(works);
    });
  }

  handleClick() {
    _router.navigate(['/Upload']);
  }

  @override
  routerOnActivate(_, __) {
    fetchWorks();
  }
}
