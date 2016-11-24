import 'package:angular2/platform/browser.dart';
import 'package:angular2/platform/common.dart'
    show HashLocationStrategy, LocationStrategy;
import 'package:angular2/core.dart' show provide;
import 'package:angular2/router.dart' show ROUTER_PROVIDERS;
import 'package:angular2_components/angular2_components.dart' show materialProviders;
import 'components/app/app.dart';
import 'services/app.dart';
import 'services/title.dart';

main() {
  bootstrap(AppComponent, [
    AppService,
    TitleService,
    materialProviders,
    ROUTER_PROVIDERS,
    provide(LocationStrategy, useClass: HashLocationStrategy)
  ]);
}
