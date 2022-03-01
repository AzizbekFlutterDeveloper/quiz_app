import 'package:app/core/data.dart';
import 'package:app/core/sizeconfige/size_config.dart';
import 'package:app/model/model.dart';
import 'package:app/provider/login_provider.dart';
import 'package:app/provider/page_second_provider.dart';
import 'package:app/service/box_hive.dart';
import 'package:app/widget/buttom_contanier.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:provider/provider.dart';

import '../provider/til_provider.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  @override
  void initState() {
    super.initState();
  }
  Box? box;
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    var indexT = context.watch<LoginProvider>().index;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: const Color(0xff4361EE),
      body: Padding(
        padding: EdgeInsets.symmetric(
          vertical: getHeight(113),
          horizontal: getWidth(24),
        ),
        child: Column(
          children: [
            Text(
              "${tilar['sarlavha'][indexT]['satr1']}",
              style: TextStyle(
                fontSize: getHeight(36),
                fontWeight: FontWeight.w500,
                color: Colors.white,
              ),
            ),
            Text(
              "${tilar['sarlavha'][indexT]['satr2']}",
              style: TextStyle(
                fontSize: getHeight(36),
                fontWeight: FontWeight.w600,
                color: Colors.white,
              ),
            ),
            SizedBox(height: getHeight(50)),
            MyContainer(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: getWidth(20)),
                child: TextFormField(
                  controller: context.watch<LoginProvider>().controller,
                  style: const TextStyle(color: Colors.white),
                  cursorColor: Colors.white,
                  decoration:  InputDecoration(
                    border: InputBorder.none,
                    hintText: "${tilar['sarlavha'][indexT]['textForm']}",
                    hintStyle: const TextStyle(color: Colors.grey),
                  ),
                  onChanged: (v){
                    context.read<LoginProvider>().next();
                  },
                ),
              ),
            ),
            MyContainer(
              child: Row(
                children: [
                  SizedBox(width: getWidth(20)),
                  Text(context.watch<LoginProvider>().til,
                    style: TextStyle(
                      fontSize: getHeight(18),
                      color: Colors.white,
                    ),
                  ),
                  const Spacer(),
                  PopupMenuButton(
                    initialValue: 0,
                    icon: Icon(Icons.keyboard_arrow_down_sharp,color: Colors.white,size: getHeight(25),),
                    shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(16))),
                    itemBuilder: (context){
                      return List.generate(3, (index){
                        return PopupMenuItem(
                          child: Text("${tillar[index]}"),
                          value: index,
                        );
                      },);
                    },
                    onSelected: (v){
                      context.read<LoginProvider>().tilAlmash(v);
                    },
                  ),
                ],
              ),
            ),
            const Spacer(),
            InkWell(
              child: MyContainer(
                child: Text(
                  "${tilar['sarlavha'][indexT]['Keyingi']}",
                  style: TextStyle(
                    fontSize: getHeight(18),
                    fontWeight: FontWeight.w500,
                    color: context.watch<LoginProvider>().text,
                  ),
                ),
                color: context.watch<LoginProvider>().container,
              ),
              onTap:context.watch<LoginProvider>().controller!.text.length > 2 ? (){
                context.read<LoginProvider>().addClients();
                Navigator.pushReplacementNamed(context, '/home');

              } : (){},
            ),
            
          ],
        ),
      ),
    );
  }
  
  
}
