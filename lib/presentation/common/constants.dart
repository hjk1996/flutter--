import 'package:flutter/foundation.dart';

const double AUTH_FORM_FIELD_GAP = 10;
const String REFEREE_ID = 'referee';

class TurnTime {
  static const int easy = 12;
  static const int normal = 10;
  static const int hard = 8;
  static const int impossible = 6;
}

const Map<String, String> UNIT_ID = kReleaseMode
    ? {
        'android': 'ca-app-pub-7342752901906106~3929392751',
      }
    : {
        'android': 'ca-app-pub-3940256099942544/6300978111',
      };
