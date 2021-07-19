import 'dart:html';

import 'package:bones_ui/bones_ui_kit.dart';
import 'package:bones_ui_bootstrap/bones_ui_bootstrap.dart';
import 'package:intl_messages/intl_messages.dart';

class AppTerms extends UIComponent {
  AppTerms(Element? parent) : super(parent, classes: 'text-left p-4');

  static final ResourceContentCache _resourceContentCache =
      ResourceContentCache();

  @override
  void configure() {
    Bootstrap.enableTooltipOnRender(this);
  }

  @override
  dynamic render() async {
    var intlResourceUri = IntlResourceUri(
        RegExp('(LOCALE)'), 'docs/terms-LOCALE.md', _resourceContentCache);

    var resourceContent = await intlResourceUri.resolveResourceContent();

    var uiDocument =
        UIDocument(content, resourceContent, classes: 'terms-panel shadow bg-blur', id: 'terms-div');

    return [
      '''
      <ui-template class="text-right p-2">
        <div onclick="${ _print.dsx() }" class="d-inline-block" data-toggle="tooltip" title="{{intl:print}}">
          <ui-svg width="20px" height="20px" src="${ BootstrapIcons.getIconPath('printer-fill') }"></ui-svg><br>
        </div>
      </ui-template>
      ''',
      uiDocument];
  }

  void _print() {
    var termsDiv = querySelector('#terms-div')!;
    var termsHtml = termsDiv.innerHtml;
    JQuery.openWindow(html: termsHtml, print: true);
  }
}
