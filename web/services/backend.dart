import 'dart:html' show window;
import 'package:angel_client/browser.dart';
import 'package:angular2/core.dart' show Injectable;

@Injectable()
class BackendService {
  final Angel app = new Rest(window.location.origin);
  
  Service service(String path, {AngelDeserializer deserializer}) =>
      app.service(path, deserializer: deserializer);
}
