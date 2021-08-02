import 'dart:html';

import 'package:bones_ui/bones_ui_kit.dart';

import 'i18n.dart';
import 'package:intl_messages/src/intl_messages_base.dart';
import 'sys.dart';

class AppLogin extends UIComponent {
  AppLogin(Element? parent) : super(parent);

  @override
  dynamic render() => '''
  <br>
  <h2>{{int:welcomeLogin}}</h2>
  <div class="shadow rounded-lg login-panel" style="padding: 12px">
    <table>
      <tbody>
      <tr>
        <td class="text-right" style="vertical-align: middle; padding: 4px">
          <label>{{intl:labelEmail}}:</label>
        </td>
        <td style="padding: 4px">
          <input id="email" field="email" type="email" style="width: 100%">
        </td>
      </tr>
      <tr>
        <td class="text-right" style="vertical-align: middle; padding: 4px">
          <label>{{intl:labelPassword}}:</label>
        </td>
        <td style="padding: 4px">
          <input id="password" field="password" type="password" style="width: 100%">
        </td>
      </tr>
      <tr>
        <td class="text-right" style="vertical-align: middle;">
          <div style="padding-top: 8px">
            <a href="#register">{{intl:labelRegister}}</a>
          </div>
        </td>
        <td>
         <ui-button-loader onclick="${actionLogin.dsx()}" id="btn-login" style="color: #000; padding-top: 8px" button-classes="btn btn-primary" loaded-text-error-class="error-text" loading-config="color: #666; zoom: 0.40">{{intl:btnLogin}}</ui-button-loader>
        </td>
      </tr>
    </tbody>
    </table>
  </div>
  ''';

  MessageBuilder get msgLoginError => messages.msg('loginError');

  void actionLogin() async {
    var email = getField('email')!;
    var password = getField('password')!;

    var btnLogin = getRenderedUIComponentById('btn-login') as UIButtonLoader;

    var user = await sys.doLogin(email, password);

    btnLogin.stopLoading(user != null, errorMessage: msgLoginError.build());
  }
}
