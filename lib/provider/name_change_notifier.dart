import 'package:app/core/constants/enum/locale_keys_enum.dart';
import 'package:app/core/init/cache/locale_manger.dart';
import 'package:flutter/widgets.dart';

class NameChangeNotifier extends ChangeNotifier{
  TextEditingController controller = TextEditingController();

  bool isBool = false;

  void enableAdd(){
    if(controller.text.length > 3){
      isBool =true;
      notifyListeners();
    }else{
      isBool = false;
      notifyListeners();
    }
  }
  void addController(){
    controller.text = LocaleManeger.instance.getStringValue(PreferenceKeys.NAME);
    notifyListeners();
  }
  void nameAddCached(){
    LocaleManeger.instance.setStringValue(PreferenceKeys.NAME, controller.text);
    LocaleManeger.instance.setStringValue(PreferenceKeys.DATE, DateTime.now().toString());
    notifyListeners();
  }
  
  void changeNameCached(){
    LocaleManeger.instance.setStringValue(PreferenceKeys.NAME, controller.text);
    notifyListeners();
  }
 
}