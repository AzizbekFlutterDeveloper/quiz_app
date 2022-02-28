
import 'package:app/core/sizeconfige/size_config.dart';
import 'package:flutter/material.dart';

class AcountContainer extends StatelessWidget {
  final color;
  final child;
  const AcountContainer({ Key? key, this.color,this.child }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Container(
      margin: EdgeInsets.all(getHeight(2.5)),
      height: getHeight(105),
      width: getWidth(95),
      decoration: BoxDecoration(
        border: Border.all(color: const Color(0xff4361EE)),
        color: color,
      ),
      child: child,
    );
  }
}