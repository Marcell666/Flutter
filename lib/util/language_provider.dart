import 'package:flutter/material.dart';

class Language extends ChangeNotifier {
  var _language = 'pt';
  String get getLanguage {
    return _language;
  }

  void changeLanguage(String lang) {
    _language = lang;
    notifyListeners();
  }
}
