import 'dart:io';

import 'package:app/core/sizeconfige/colors.dart';
import 'package:app/core/sizeconfige/size_config.dart';
import 'package:flutter/material.dart';

class OrinDialog{
  static orindialog(context){
    return showDialog(
      context: context, 
      builder: (context){
        return AlertDialog(
          backgroundColor: Colors.transparent,
          content: Container(
            height: getHeight(300),
            width: getWidth(200),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(16)),
              color: MyColors.myWhite,
            ),
            child: GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2, mainAxisExtent: getHeight(100)),
              itemCount: 6,
              itemBuilder: (context, index) {
                return Container(
                  margin: EdgeInsets.all(10),
                  child: Center(child: Icon(Icons.military_tech_rounded,color: Colors.amber,size: getHeight(60),),),
                );
              }
            ),
          ),
        );
      }
    );
  }
}