import 'package:app/core/constants/enum/locale_keys_enum.dart';
import 'package:app/core/data/list_data/list_data.dart';
import 'package:app/core/init/cache/locale_manger.dart';
import 'package:flutter/widgets.dart';

class ColorChangeNotifier extends ChangeNotifier {
 

  Color colorP = LocaleListData.colors[
      int.parse(LocaleManeger.instance.getStringValue(PreferenceKeys.COLOR))];

  void changeColor(int i) {
    colorP =LocaleListData.colors[i];
    LocaleManeger.instance.setStringValue(PreferenceKeys.COLOR, i.toString());
    notifyListeners();
  }
}
