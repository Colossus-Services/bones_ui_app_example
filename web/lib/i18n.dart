import 'package:intl_messages/intl_messages.dart';

IntlMessages MESSAGES = IntlMessages.package('/demoapp/')
  ..registerResourceDiscover(IntlResourceDiscover('i18n/msgs-', '.intl'));
