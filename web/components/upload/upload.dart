import 'package:angel/src/models/artwork.dart';
import 'package:angel_client/browser.dart' show Service;
import 'package:angular2/core.dart' show Component;
import 'package:angular2_components/angular2_components.dart'
    show MaterialInputComponent;
import 'package:angular2/router.dart' show OnActivate;
import '../../services/backend.dart';
import '../../services/title.dart';

@Component(
    selector: 'artwork-upload',
    templateUrl: 'upload.html',
    directives: const [MaterialInputComponent])
class UploadComponent implements OnActivate {
  final BackendService _backend;
  final TitleService _titleService;
  final Artwork artwork = new Artwork();
  Service _service;

  UploadComponent(this._titleService, this._backend) {
    _service = _backend.service('api/artworks');
  }

  submit() {}

  @override
  routerOnActivate(_, __) {
    _titleService.title = 'Upload new Artwork';
  }
}
