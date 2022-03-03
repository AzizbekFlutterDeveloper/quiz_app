import 'package:app/core/sizeconfige/colors.dart';
import 'package:app/core/sizeconfige/size_config.dart';
import 'package:flutter/material.dart';

class ArrowDialog{
  static arrowdialog(context){
    return showDialog(
      context: context, 
      builder: (context){
        return AlertDialog(
          backgroundColor: Colors.transparent,
          content: Container(
            height: getHeight(120),
            width: getWidth(240),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(13)),
              color: MyColors.myWhite,
            ),
            child: Padding(
              padding: EdgeInsets.all(
                getHeight(20)
              ),
              child: Column(
                children: [
                  Text("Chiqishni hohlaysizmi? ",
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: getHeight(16),
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  Spacer(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      InkWell(
                        child: Container(
                          height: getHeight(40),
                          width: getWidth(70),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(8)),
                            color: MyColors.myBlue,
                          ),
                          child: Center(
                            child: Text("Ha",
                              style: TextStyle(
                                color: MyColors.myWhite,
                                fontSize: getHeight(16),
                              ),
                            ),
                          ),
                        ),
                        onTap: (){
                          Navigator.pushNamedAndRemoveUntil(context, '/home', (route) => false);
                        }
                      ),
                      InkWell(
                        child: Container(
                          height: getHeight(40),
                          width: getWidth(70),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(8)),
                            color: Colors.red,
                          ),
                          child: Center(
                            child: Text("Yo'q",
                              style: TextStyle(
                                color: MyColors.myWhite,
                                fontSize: getHeight(16),
                              ),
                            ),
                          ),
                        ),
                        onTap: (){
                          Navigator.pop(context);
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      }
    );
  }
}