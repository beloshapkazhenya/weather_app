import 'package:fluro/fluro.dart';
import 'package:flutter/cupertino.dart';
import 'package:weather_app/router/route_handlers.dart';

class Routes {
  static String main = '/';
  static String selectLocation = '/location';

  static late FluroRouter router;

  static void configureRoutes(FluroRouter router) {
    router.notFoundHandler = Handler(handlerFunc: (context, params) {
      debugPrint('Not found');
      return;
    });

    router.define(main,
        handler: mainHandler, transitionType: TransitionType.cupertino);

    router.define(selectLocation,
        handler: selectLocationHandler,
        transitionType: TransitionType.cupertino);
  }
}
