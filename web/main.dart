import 'dart:html';

import 'lib/ui_root.dart';

void main() {
  var output = querySelector('#output');
  var appRoot = AppRoot(output);
  appRoot.initialize();
}
