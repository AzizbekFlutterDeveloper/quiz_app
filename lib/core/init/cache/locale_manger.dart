import 'package:app/core/constants/enum/locale_keys_enum.dart';
import 'package:get_storage/get_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocaleManeger {
  static final LocaleManeger _instance = LocaleManeger._init();
  GetStorage? _preferences;
  static LocaleManeger get instance => _instance;
  
  LocaleManeger._init() {
    _preferences = GetStorage();
  }

  static preferenceInit() async{
    await GetStorage.init();
  }

  Future<void> setStringValue(PreferenceKeys key, String value) async {
    await GetStorage().write(key.toString(), value);
  }
  
  

  String getStringValue(PreferenceKeys key) =>
      GetStorage().read(key.toString());
}