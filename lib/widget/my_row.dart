import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../core/data.dart';
import '../core/sizeconfige/size_config.dart';

class MyRow extends StatelessWidget {
  final index;
  final name;
  final icon;
  const MyRow({Key? key, this.index,this.name,this.icon}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          icon,
          color: Colors.white,
          size: getHeight(30),
        ),
        SizedBox(width: getWidth(16)),
        Text(
          "${tilar['home'][index][name]}",
          style: TextStyle(
            color: Colors.white,
            fontSize: getHeight(16),
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    );
  }
}
