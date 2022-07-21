import 'package:app/provider/lang_change_notifier.dart';
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
    Provider.value(value: NavigationService.instance),
  ];
}
