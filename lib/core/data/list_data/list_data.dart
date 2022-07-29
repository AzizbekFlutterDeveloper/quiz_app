import 'package:app/core/extension/string_extension_locale.dart';
import 'package:app/core/init/lang/lang_keys.g.dart';
import 'package:flutter/material.dart';

class LocaleListData{
  static List profileImage = [
    "assets/image/profile1.jpg",
    "assets/image/profile2.webp",
    "assets/image/profile3.png",
    "assets/image/profile4.png",
    "assets/image/profileG1.jpg",
    "assets/image/profileG2.png",
    "assets/image/profileG3.png",
    "assets/image/profileG4.png"
  ];

  static List drawersData = [
    {
      "icon":Icons.settings_outlined,
      "name":LocaleKeys.sozlash.t,
    },
    {
      "icon":Icons.share_outlined,
      "name":LocaleKeys.ulashish.t,
    },
    {
      "icon":Icons.info_outline,
      "name":LocaleKeys.bizhaqimizda.t,
    },
    {
      "icon":Icons.exit_to_app,
      "name":LocaleKeys.exit.t,
    }
  ];
}