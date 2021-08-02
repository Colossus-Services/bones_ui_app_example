import 'package:intl_messages/intl_messages.dart';

final IntlMessages messages = IntlMessages.package('/demoapp/')
  ..registerResourceDiscover(IntlResourceDiscover('i18n/msgs-', '.intl'));
