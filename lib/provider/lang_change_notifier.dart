
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
  int langIndex = int.parse(LocaleManeger.instance.getStringValue(PreferenceKeys.LANGINDEX));
  
  String langName = LocaleManeger.instance.getStringValue(PreferenceKeys.LANG);
  
  void changeLang(int i, BuildContext context){
    langName = langList[i];
    langIndex = i;
    LocaleManeger.instance.setStringValue(PreferenceKeys.LANGINDEX, langIndex.toString());
    LocaleManeger.instance.setStringValue(PreferenceKeys.LANG, langName);
    notifyListeners();
  }

  

 
}