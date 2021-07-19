import 'dart:html';

import 'package:bones_ui/bones_ui_kit.dart';

import 'sys.dart';

class AppRegister extends UIComponent {
  AppRegister(Element? parent) : super(parent);

  @override
  dynamic render() => '''
  <br>
  <h2>{{intl:routeRegister}}</h2>

  <div class="bg-dark-alpha-20 shadow rounded-lg2 register-panel" style="padding: 12px">
    <table>
      <tr>
        <td class="text-right" style="vertical-align: middle; padding: 4px">
          <label>{{intl:labelName}}</label>:
        </td>
        <td style="padding: 4px">
          <input type="text" id="name" field="name" style="width: 100%">
        </td>
      </tr>
      <tr>
        <td class="text-right" style="vertical-align: middle; padding: 4px">
          <label>{{intl:labelUsername}}</label>:
        </td>
        <td style="padding: 4px">
          <input type="text" id="username" field="username" style="width: 100%">
        </td>
      </tr>
      <tr>
        <td class="text-right" style="vertical-align: middle; padding: 4px">
          <label>{{intl:labelEmail}}</label>:
        </td>
        <td style="padding: 4px">
          <input type="email" id="email" field="email" style="width: 100%">
        </td>
      </tr>
      <tr>
        <td class="text-right" style="vertical-align: middle; padding: 4px">
          <label>{{intl:labelPassword}}</label>:
        </td>
        <td style="padding: 4px">
          <input type="password" id="password" field="password" style="width: 100%">
        </td>
      </tr>
      <tr>
        <td style="vertical-align: middle ; padding: 6px">
          <a style="filter: brightness(130%)" href="#login">{{intl:routeLogin}}</a>
        </td>
        <td style="padding: 6px">
          <button onclick="${actionRegister.dsx()}" class="btn btn-primary">{{intl:btnRegister}}</button>
        </td>
      </tr>
    </table>
  </div>
  ''';

  void actionRegister() async {
    var name = getField('name')!;
    var username = getField('username')!;
    var email = getField('email')!;
    var password = getField('password')!;

    var newUSer = await SYS.register(name, username, email, password);
  }
}
