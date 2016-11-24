import 'dart:html' show document;
import 'package:angular2/core.dart' show Injectable;

@Injectable()
class TitleService {
  String _title = 'Welcome';
  String get title => _title;

  void set title(String value) {
    document.title = '$value - Art Gallery';
    _title = value;
  }
}