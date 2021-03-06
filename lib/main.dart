import 'package:app/core/constants/navigation_const/navigation_const.dart';
import 'package:app/core/init/cache/locale_manger.dart';
import 'package:app/core/init/lang/lang_manager.dart';
import 'package:app/core/init/notifier/provider_list.dart';
import 'package:app/router/routes.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

void main() {
  LocaleManeger.preferenceInit();
  runApp(
    MultiProvider(
      providers: [
        ...ApplacationProvider.instance.dependItems,
      ],
      child: EasyLocalization(
        child: const MyApp(),
        path: "assets/lang",
        supportedLocales: LanguageManager.instance.suppprtedLocales,
        startLocale: LanguageManager.instance.uzLocale,
        fallbackLocale: LanguageManager.instance.uzLocale,
      ),
    ),
  );
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
          onGenerateRoute: Routes.instance.onGenerateRoute,
        );
      },
    );
  }
}
