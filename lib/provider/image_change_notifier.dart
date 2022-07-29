import 'package:app/core/constants/enum/locale_keys_enum.dart';
import 'package:app/core/data/list_data/list_data.dart';
import 'package:app/core/init/cache/locale_manger.dart';
import 'package:app/main.dart';
import 'package:flutter/widgets.dart';
import 'package:get_storage/get_storage.dart';

class ImageChange extends ChangeNotifier{
  String profileImg = LocaleManeger.instance.getStringValue(PreferenceKeys.IMG);

  void imageChange(int i){
    profileImg = LocaleListData.profileImage[i];
    LocaleManeger.instance.setStringValue(PreferenceKeys.IMG,profileImg);
    notifyListeners();
  }

}