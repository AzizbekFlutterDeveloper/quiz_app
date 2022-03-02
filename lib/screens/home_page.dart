import 'package:app/core/sizeconfige/size_config.dart';
import 'package:app/widget/container.dart';
import 'package:app/widget/showDialog/showDialog.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:simple_timer/simple_timer.dart';

import '../core/data.dart';
import '../core/sizeconfige/colors.dart';
import '../provider/login_provider.dart';
import '../widget/my_row.dart';

class HomePage extends StatefulWidget {
  const HomePage({
    Key? key,
  }) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  TimerController? _timerController;
 var prefs;
 String? action;
  @override
  void initState() {
    _timerController = TimerController(this);
    super.initState();
  }

  int son = 0;
  @override
  Widget build(BuildContext context) {
    var indexT = context.watch<LoginProvider>().index;
    SizeConfig().init(context);
    return Scaffold(
      drawer: Drawer(
        backgroundColor: Colors.transparent,
        child: Container(
          decoration: BoxDecoration(
            color: Colors.black.withOpacity(0.6),
          ),
          child: Padding(
            padding: EdgeInsets.only(
              top: getHeight(63.0),
              left: getWidth(20),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "${tilar['home'][indexT]['menu']}",
                  style: TextStyle(
                    color: MyColors.myWhite,
                    fontSize: getHeight(22),
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(height: getHeight(30)),
                InkWell(
                  child: MyRow(
                    icon: Icons.settings_outlined,
                    name: "sozlash",
                    index: indexT,
                  ),
                  onTap: (){
                    ShowDialog.myShowDialog(context);
                  },
                ),
                SizedBox(height: getHeight(30)),
                MyRow(
                  icon: Icons.share_outlined,
                  name: "ulashish",
                  index: indexT,
                ),
                SizedBox(height: getHeight(30)),
                MyRow(
                  icon: Icons.info_outline,
                  name: "biz",
                  index: indexT,
                ),
                SizedBox(height: getHeight(470)),
                MyRow(
                  icon: Icons.help_outline_rounded,
                  name: "yordam",
                  index: indexT,
                ),
              ],
            ),
          ),
        ),
      ),
      appBar: AppBar(
        leading: Builder(
          builder: (context){
            return IconButton(
            icon: Icon(
              Icons.short_text_rounded,
              size: getHeight(40),
              color: MyColors.myWhite,
            ),
            onPressed: () {
              Scaffold.of(context).openDrawer();
            },
          );
          }
        ),
        title:Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Text(
                "${tilar['home'][indexT]['hi']}, ${context.watch<LoginProvider>().name}"),
          ],
        ),
        backgroundColor:  MyColors.myBlue,
        toolbarHeight: getHeight(64),
        actions: [
          InkWell(
            child: Container(
              margin: EdgeInsets.symmetric(
                  vertical: getHeight(12), horizontal: getWidth(10)),
              height: getWidth(35),
              width: getWidth(35),
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(Radius.circular(10)),
                color: MyColors.myWhite,
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: FileImage(context.watch<LoginProvider>().picture),
                ),
              ),
            ),
            onTap: () {
              Navigator.pushNamed(context, '/acount');
            },
          ),
        ],
      ),
      body: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, mainAxisExtent: getHeight(230)),
        itemCount: 6,
        itemBuilder: (context, index) {
          return InkWell(
            child: HomeContainer(
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    SizedBox(
                      height: getHeight(89),
                      width: getWidth(59),
                      child: Image.asset(index == 0
                          ? "assets/image/Vector.png"
                          : "assets/image/lock.png"),
                    ),
                    Text(
                      "${index + 1}-${tilar['home'][indexT]['bolim']}",
                      style: TextStyle(
                        color: MyColors.myWhite,
                        fontSize: getHeight(18),
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Text(
                      "${tilar['home'][indexT]['nima']}",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: getHeight(12),
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            onTap: (){
              Navigator.pushNamed(context, '/asosiy');
            },
          );
        },
      ),
    );
  }
  
  
}
