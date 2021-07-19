import 'dart:html';

import 'package:bones_ui/bones_ui_kit.dart';

import 'sys.dart';

class AppHome extends UIComponent {
  AppHome(Element? parent) : super(parent, classes: 'w-50');

  @override
  dynamic render() => '''
  <br>
  <h1>{{intl:routeHome}}</h1>

  <br>
  {{intl:welcome}}

  <br><br>
  
  <hr>
  Locale: <i>{{locale}}</i>

  <br>
  ''';
}
