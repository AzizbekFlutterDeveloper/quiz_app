import 'package:flutter/material.dart';

import '../core/sizeconfige/size_config.dart';

class MyContainer extends StatelessWidget {
  final child;
  final color;
  final borderColor;
  var onTap;
  MyContainer({ Key? key, this.child, this.color,this.borderColor,this.onTap }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Container(
      margin: EdgeInsets.only(
        top: getHeight(30),
      ),
      height: getHeight(60),
      width: getWidth(327),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(16)),
        border: Border.all(color: borderColor ?? Colors.white),
        color: color ?? Colors.transparent,
      ),
      child: Center(child: child),
    );
  }
}