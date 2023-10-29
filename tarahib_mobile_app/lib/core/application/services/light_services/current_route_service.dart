import 'dart:developer';

import 'package:flutter/material.dart';

class CurrentRouteService extends NavigatorObserver {
  String? _currentRoute = "";
  @override
  void didPush(Route route, Route? previousRoute) {
    _currentRoute = route.settings.name;
    log(_currentRoute ?? "NA", name: "CurrentRoute:", level: 0);
    super.didPush(route, previousRoute);
  }

  @override
  void didReplace({Route? newRoute, Route? oldRoute}) {
    _currentRoute = newRoute?.settings.name;
    log(_currentRoute ?? "NA", name: "CurrentRoute:", level: 0);
    super.didReplace(newRoute: newRoute, oldRoute: oldRoute);
  }

  @override
  void didPop(Route route, Route? previousRoute) {
    _currentRoute = previousRoute?.settings.name;
    log(_currentRoute ?? "NA", name: "CurrentRoute:", level: 0);
    super.didPop(route, previousRoute);
  }

  String? get currentRoute => _currentRoute;
}
