import 'dart:html';

import 'package:bones_ui/bones_ui_kit.dart';
import 'package:bones_ui_bootstrap/bones_ui_bootstrap.dart';

class AppTopMenu extends UIComponent {
  AppTopMenu(Element? parent) : super(parent);

  @override
  void configure() {
    refreshOnNavigate = true;
  }

  String? get currentRoute => UINavigator.getCurrentRoute(defaultRoute: 'home');

  @override
  dynamic render() => '''
  <nav class="top-menu navbar navbar-dark fixed-top bg-blur navbar-expand-md">
    <a class="navbar-brand" navigate="home">
    <ui-svg width="20px" height="20px" src="${BootstrapIcons.getIconPath('app-indicator')}"></ui-svg>
    {{intl:appName}}
    </a>
    <button class="navbar-toggler" data-toggle="collapse" data-target="#navbarNavDropdown" aria-controls="navbarNavDropdown" aria-expanded="false" aria-label="Toggle Navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
    <ui-template id="navbarNavDropdown" class="collapse navbar-collapse">
      <ul class="navbar-nav mr-auto">
        {{*:menuRoutes}}
          <li class="nav-item {{:route=='$currentRoute'}} active font-weight-bold {{/}}">
            <a class="nav-link text-drop-shadow2" href="#{{route}}">{{name}}</a>
          </li>
        {{/}}
      </ul>
      <img class="float-right" action="#lang_dialog.show()" style="cursor: pointer" src="images/icon-language.svg" height="28" width="28">
    </ui-template>
  </nav>
  <ui-dialog id="lang_dialog" class="language-dialog bg-blur">
    <br>
    <div class="language-dialog-box shadow bg-blur">
      <ui-template>
        {{intl:language}}:
        <select style="border-radius: 8px" action="#lang_dialog.hide(); locale()">
          <option value="en" selected="{{:locale=='en'}}true{{?}}false{{/}}">English</option>
          <option value="fr" selected="{{:locale=='fr'}}true{{?}}false{{/}}">Français</option>
          <option value="pt" selected="{{:locale=='pt'}}true{{?}}false{{/}}">Português</option>
        </select>
      </ui-template>
    </div>
  </ui-dialog>
  ''';
}
