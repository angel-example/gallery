/// This app's route configuration.
library angel.routes;

import 'dart:io';
import 'package:angel_configuration/angel_configuration.dart';
import 'package:angel_framework/angel_framework.dart';
import 'package:angel_proxy/angel_proxy.dart';
import 'package:angel_static/angel_static.dart';
import 'package:uuid/uuid.dart';
import 'controllers/controllers.dart' as Controllers;

configureBefore(Angel app) async {}

/// Put your app routes here!
configureRoutes(Angel app) async {
  final _uuid = new Uuid();

  app.group('/api', (router) {
    router.post('/upload', (RequestContext req, Configuration config) async {
      if (req.files.length != 1)
        throw new AngelHttpException.BadRequest(message: 'Please upload exactly one file.');

      final upload = req.files.first;
      final dir = new Directory(config.upload_path);
      final name = _uuid.v1();
      final file = new File.fromUri(dir.uri.resolve(name));
      await file.writeAsBytes(upload.data);

      // Return a JSON response with the
      // location of the uploaded file ;)
      return {
        'url': '${config.upload_path}/$name'
      };
    });
  });

  await app.configure(new PubServeLayer());
  await app.configure(new VirtualDirectory());
}

configureAfter(Angel app) async {
  // 404 handler
  app.after.add((req, ResponseContext res) async {
    throw new AngelHttpException.NotFound();
  });

  // Default error handler
  app.onError(
      (e, req, res) async => res.render("error", {"message": e.message}));
}

configureServer(Angel app) async {
  await configureBefore(app);
  await configureRoutes(app);
  await app.configure(Controllers.configureServer);
  await configureAfter(app);
}
