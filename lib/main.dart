import 'package:app/core/constants/enum/locale_keys_enum.dart';
import 'package:app/core/constants/navigation_const/navigation_const.dart';
import 'package:app/core/init/cache/locale_manger.dart';
import 'package:app/core/init/lang/lang_manager.dart';
import 'package:app/core/init/notifier/provider_list.dart';
import 'package:app/router/routes.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_storage/get_storage.dart';
import 'package:provider/provider.dart';
late var preferences = GetStorage();
void main() async{
  await GetStorage.init();
  await _init();
  runApp(
    MultiProvider(
      providers: [
        ...ApplacationProvider.instance.dependItems,
      ],
      child: EasyLocalization(
        child: const MyApp(),
        path: "assets/lang",
        supportedLocales: LanguageManager.instance.suppprtedLocales,
        startLocale: LanguageManager.instance.suppprtedLocales[int.parse(LocaleManeger.instance.getStringValue(PreferenceKeys.LANGINDEX))],
        fallbackLocale: LanguageManager.instance.uzLocale,
      ),
    ),
  );
}

_init()async{
  if(preferences.read("img") == null){
    preferences.write("img", "true");
    LocaleManeger.instance.setStringValue(PreferenceKeys.LANG,"O'zbekcha");
    LocaleManeger.instance.setStringValue(PreferenceKeys.IMG, "assets/image/profile1.jpg");
    LocaleManeger.instance.setStringValue(PreferenceKeys.LANGINDEX, "0");
  }
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      builder: (context, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: "Savol",
          theme: ThemeData(),
          localizationsDelegates: context.localizationDelegates,
          supportedLocales: context.supportedLocales,
          locale: context.locale,
          initialRoute: NavigationConst.REGISTER_VIEW,
          // initialRoute: preferences.read(PreferenceKeys.NAME.toString()) == null ? NavigationConst.REGISTER_VIEW : NavigationConst.HOME_VIEW,
          onGenerateRoute: Routes.instance.onGenerateRoute,
        );
      },
    );
  }
}
