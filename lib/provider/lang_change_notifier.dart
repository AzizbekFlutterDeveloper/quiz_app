
import 'package:app/core/constants/enum/locale_keys_enum.dart';
import 'package:app/core/init/cache/locale_manger.dart';
import 'package:flutter/widgets.dart';
import 'package:easy_localization/easy_localization.dart';

class LangChangeNotifier extends ChangeNotifier{

  List<String> langList = [
    "O’zbekcha",
    "English",
    "Русский"
  ];

  List langKey = [
    const Locale("uz","UZ"),
    const Locale('en',"US"),
    const Locale("ru","RU"),
  ];
  int langIndex = 0;

  String langName = "O’zbekcha";
  
  void changeLang(int i, BuildContext context){
    context.setLocale(langKey[i]);
    notifyListeners();
    langName = langList[i];
    LocaleManeger.instance.setStringValue(PreferenceKeys.LANG, langName);
    
    notifyListeners();
  }
}