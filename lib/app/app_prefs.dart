// ignore_for_file: constant_identifier_names

import 'package:section2/presentation/resources/language_manager.dart';
import 'package:shared_preferences/shared_preferences.dart';

const String PREFS_KEY_LANG = "PREFS_KEY_LANG";

class AppPreferences {
  final SharedPreferences _sharedPreferences;

  AppPreferences(this._sharedPreferences);

  Future<String> getApplanguage() async {
    String? language = _sharedPreferences.getString(PREFS_KEY_LANG);

    if (language != null && language.isNotEmpty) {
      return language;
    } else {
      return LanguageType.ENGLISH.getValue();
    }
  }
}
