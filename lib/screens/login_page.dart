import 'package:app/core/data.dart';
import 'package:app/core/sizeconfige/size_config.dart';
import 'package:app/provider/login_provider.dart';
import 'package:app/widget/buttom_contanier.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../core/sizeconfige/colors.dart';


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
   

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    int? indexT = context.watch<LoginProvider>().index;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: MyColors.myBlue,
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
                color: MyColors.myWhite,
              ),
            ),
            Text(
              "${tilar['sarlavha'][indexT]['satr2']}",
              style: TextStyle(
                fontSize: getHeight(36),
                fontWeight: FontWeight.w600,
                color: MyColors.myWhite,
              ),
            ),
            SizedBox(height: getHeight(50)),
            MyContainer(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: getWidth(20)),
                child: TextFormField(
                  controller: context.watch<LoginProvider>().controller,
                  style:  TextStyle(color: MyColors.myWhite),
                  cursorColor: MyColors.myWhite,
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
                      color: MyColors.myWhite,
                    ),
                  ),
                  const Spacer(),
                  PopupMenuButton(
                    initialValue: 0,
                    icon: Icon(Icons.keyboard_arrow_down_sharp,color: MyColors.myWhite,size: getHeight(25),),
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
              onTap:context.watch<LoginProvider>().controller!.text.length > 2 ? ()async{
                Provider.of<LoginProvider>(context, listen: false).addDB();
                Navigator.pushReplacementNamed(context, '/home');

              } : (){},
            ),
            
          ],
        ),
      ),
    );
  }
  
  
}
