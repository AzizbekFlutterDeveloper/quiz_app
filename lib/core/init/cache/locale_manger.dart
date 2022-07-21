import 'package:app/core/constants/enum/locale_keys_enum.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocaleManeger {
  static final LocaleManeger _instance = LocaleManeger._init();
  SharedPreferences? _preferences;
  static LocaleManeger get instance => _instance;
  
  LocaleManeger._init() {
    SharedPreferences.getInstance().then((value) {
      _preferences = value;
    });
  }

  static preferenceInit() async {
    instance._preferences ??= await SharedPreferences.getInstance();
  }

  Future<void> setStringValue(PreferenceKeys key, String value) async {
    await _preferences!.setString(key.toString(), value);
  }

  String? getStringValue(PreferenceKeys key) =>
      _preferences!.getString(key.toString()) ?? "";
}