import 'dart:html';

import 'package:async_field/async_field.dart';
import 'package:bones_ui/bones_ui_kit.dart';

import 'sys.dart';

class AppFooter extends UIComponent {
  AppFooter(Element? parent) : super(parent);

  AsyncField<double> get btcUsd => SYS.btcUsd;

  @override
  dynamic render() => '''
  <div class="fixed-bottom text-right">
    <div class="d-inline-block footer bg-blur">
      BTC: USD\$ ${btcUsd.dsx()}
    </div>
  </div>
  ''';
}
