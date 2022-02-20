import 'package:flutter/material.dart';

class MyContanier {
  static Color correct = Colors.green;

  static Color wrong = Colors.red;

  static BorderRadius myBorder = const BorderRadius.all(Radius.circular(30));
  static myButtom(context, {child, color = Colors.grey, elevation = 2.0,elevationcolor = Colors.grey,colorbody = Colors.white, onTap}) {
    Size size = MediaQuery.of(context).size;
    return InkWell(
      child: Container(
        margin: EdgeInsets.all(size.width * 0.02),
        decoration: BoxDecoration(
          borderRadius: MyContanier.myBorder,
          border: Border.all(color: color, width: size.width * 0.003),
          color: colorbody,
          boxShadow: [
            BoxShadow(
              color: elevationcolor,
              offset: Offset(elevation, 1.0), 
              blurRadius: 6.0,
            ),
          ],
        ),
        height: size.height * 0.06,
        width: size.width * 0.8,
        child: Center(child: child ?? const Text("")),
      ),
      onTap: onTap,
    );
  }
}
