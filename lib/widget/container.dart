import 'package:app/core/sizeconfige/size_config.dart';
import 'package:flutter/material.dart';

class HomeContainer extends StatelessWidget {
  final child;
  const HomeContainer({ Key? key , this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: getHeight(210),
      width: getWidth(157),
      margin: EdgeInsets.only(
        left: getWidth(10),
        right: getHeight(10),
        top: getHeight(26),
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(30)),
        color: Color(0xff4361EE),
      ),
      child: child,
    );
  }
}