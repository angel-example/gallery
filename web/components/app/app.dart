import 'package:angular2/core.dart' show Component;
import 'package:angular2/router.dart'
    show Route, RouteConfig, RouterLink, RouterOutlet;
import '../artwork_list/artwork_list.dart';
import '../upload/upload.dart';
import '../../services/title.dart';

@Component(
    selector: 'gallery-app',
    templateUrl: 'app.html',
    providers: const [TitleService],
    directives: const [RouterLink, RouterOutlet])
@RouteConfig(const [
  const Route(
      path: '/works',
      name: 'Works',
      component: ArtworkListComponent,
      useAsDefault: true),
  const Route(path: '/upload', name: 'Upload', component: UploadComponent)
])
class AppComponent {
  final TitleService _titleService;
  String get title => _titleService.title;

  AppComponent(this._titleService) {
    _titleService.title = 'Home';
  }
}
