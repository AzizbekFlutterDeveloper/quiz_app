import 'package:app/provider/color_change_notifier.dart';
import 'package:app/provider/image_change_notifier.dart';
import 'package:app/provider/lang_change_notifier.dart';
import 'package:app/provider/name_change_notifier.dart';
import 'package:app/provider/quiz_notifier.dart';
import 'package:app/provider/timer_notifier.dart';
import 'package:app/router/route/router.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

class ApplacationProvider {
  static final ApplacationProvider _instance = ApplacationProvider._init();
  static ApplacationProvider get instance => _instance;
  ApplacationProvider._init();

  List<SingleChildWidget> singleItems = [];
  List<SingleChildWidget> dependItems = [
    ChangeNotifierProvider(create: (context)=> LangChangeNotifier()),
    ChangeNotifierProvider(create: (context)=> ImageChange()),
    ChangeNotifierProvider(create: (context)=> NameChangeNotifier()),
    ChangeNotifierProvider(create: (context)=> ColorChangeNotifier()),
    ChangeNotifierProvider(create: (context)=> TimerNotifier()),
    ChangeNotifierProvider(create: (context)=> QuizNotifier()),
    
    Provider.value(value: NavigationService.instance),
  ];
}
