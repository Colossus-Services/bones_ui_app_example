import 'dart:html';

import 'package:bones_ui/bones_ui_kit.dart';
import 'package:bones_ui_bootstrap/bones_ui_bootstrap.dart';

import 'i18n.dart';
import 'ui_content.dart';
import 'ui_footer.dart';
import 'ui_top_menu.dart';

class AppRoot extends UIRoot {
  AppRoot(Element? rootContainer) : super(rootContainer);

  @override
  void configure() {
    Bootstrap.load();
  }

  @override
  Future<bool> initializeLocale(String locale) {
    intlMessageResolver = MESSAGES.buildMsg;
    return MESSAGES.autoDiscoverLocale(locale);
  }

  AppTopMenu? _appMenu;

  @override
  UIComponent? renderMenu() => _appMenu ??= AppTopMenu(content);

  AppContent? _appContent;

  @override
  UIComponent? renderContent() => _appContent ??= AppContent(content);

  AppFooter? _appFooter;

  @override
  UIComponent? renderFooter() => _appFooter ??= AppFooter(content);
}
