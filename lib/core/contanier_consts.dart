import 'package:flutter/material.dart';

class MyContanier {

  static BorderRadius myBorder = BorderRadius.all(Radius.circular(30));
  static myButtom(context, {child}) {
    Size size = MediaQuery.of(context).size;
    return PhysicalModel(
      color: Colors.black,
      elevation: 20,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: MyContanier.myBorder,
          
        ),
        height: size.height * 0.05,
        width: size.width * 0.7,
      ),
      borderRadius: MyContanier.myBorder,
    );
  }
}
