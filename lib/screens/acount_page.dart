import 'dart:math';

import 'package:app/core/sizeconfige/size_config.dart';
import 'package:app/provider/login_provider.dart';
import 'package:app/provider/photo_provider.dart';
import 'package:app/widget/acount_container.dart';
import 'package:app/widget/buttom_contanier.dart';
import 'package:app/widget/showDialog/showDialog.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

import '../core/data.dart';
import '../provider/til_provider.dart';

class AcountPage extends StatelessWidget {
  AcountPage({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    var indexT = context.watch<LoginProvider>().index;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Column(
        children: [
          Container(
            height: getHeight(250),
            width: getWidth(375),
            color: Color(0xff4361EE),
            child: Column(
              children: [
                SizedBox(
                  height: getHeight(30),
                ),
                Row(
                  children: [
                    IconButton(
                      icon: Icon(
                        Icons.arrow_back,
                        color: Colors.white,
                        size: getHeight(30),
                      ),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                  ],
                ),
                CircleAvatar(
                  radius: getHeight(55),
                  backgroundColor: Colors.white,
                  backgroundImage: FileImage(context.watch<LoginProvider>().picture),
                  // child: Icon(
                  //   Icons.person,
                  //   color: Color(0xff4361EE),
                  //   size: getHeight(90),
                  // ),
                ),
                Text(
                  "Azizbek",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: getHeight(35),
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.all(getHeight(10)),
            child: Column(
              children: [
                Row(
                  children: [
                    AcountContainer(
                      child: Center(
                          child: Icon(
                        Icons.military_tech_outlined,
                        size: getHeight(60),
                        color: Color(0xff4361EE),
                      )),
                    ),
                    AcountContainer(
                      child: Center(
                          child: Icon(
                        Icons.bar_chart_outlined,
                        size: getHeight(60),
                        color: Colors.white,
                      )),
                      color: Color(0xff4361EE),
                    ),
                    AcountContainer(
                      child: Center(
                          child: Icon(
                        Icons.star_border_rounded,
                        size: getHeight(60),
                        color: Color(0xff4361EE),
                      )),
                    ),
                  ],
                ),
                SizedBox(height: getHeight(208)),
                MyContainer(
                  borderColor: Color(0xff4361EE),
                  child: Row(
                    children: [
                      SizedBox(width: getWidth(20)),
                      Icon(
                        Icons.share_outlined,
                        color: Color(0xff4361EE),
                        size: getHeight(30),
                      ),
                      SizedBox(width: getWidth(80)),
                      Text(
                        "${tilar['home'][indexT]['ulashish']}",
                        style: TextStyle(
                          color: Color(0xff4361EE),
                          fontSize: getHeight(16),
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ),
                InkWell(
                  child: MyContainer(
                    borderColor: Color(0xff4361EE),
                    child: Row(
                      children: [
                        SizedBox(width: getWidth(20)),
                        Icon(
                          Icons.settings_outlined,
                          color: Color(0xff4361EE),
                          size: getHeight(30),
                        ),
                        SizedBox(width: getWidth(80)),
                        Text(
                          "${tilar['home'][indexT]['sozlash']}",
                          style: TextStyle(
                            color: Color(0xff4361EE),
                            fontSize: getHeight(16),
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ),
                  onTap: () {
                    ShowDialog.myShowDialog(context);
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  
}
