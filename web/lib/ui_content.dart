import 'dart:html';

import 'package:bones_ui/bones_ui_kit.dart';

import 'i18n.dart';
import 'sys.dart';
import 'ui_home.dart';
import 'ui_login.dart';
import 'ui_register.dart';
import 'ui_terms.dart';

class AppContent extends UINavigableComponent {
  static final Map<String, String> myRoutes = {
    'home': 'routeHome',
    'terms': 'routeTerms',
    'register': 'routeRegister',
    'login': 'routeLogin',
  };

  AppContent(Element? parent)
      : super(parent, myRoutes.keys, classes: 'content');

  String? getRouteNameKey(String route) => myRoutes[route];

  @override
  String? getRouteName(String route) =>
      messages.msg(getRouteNameKey(route)!).build();

  @override
  String get currentTitle {
    var route = currentRoute ?? '';
    return myRoutes[route] ?? route;
  }

  @override
  bool isRouteHiddenFromMenu(String route) {
    if (sys.isLogged) {
      return ['login', 'register'].contains(route);
    } else {
      return false;
    }
  }

  @override
  dynamic renderRoute(String? route, Map<String, String>? parameters) {
    switch (route) {
      case 'home':
        return AppHome(content);
      case 'login':
        return AppLogin(content);
      case 'register':
        return AppRegister(content);
      case 'terms':
        return AppTerms(content);
      default:
        return AppHome(content);
    }
  }
}
