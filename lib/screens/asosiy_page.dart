import 'package:flutter/material.dart';

class AsosiyPage extends StatelessWidget {
  const AsosiyPage({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back, ),
          onPressed: (){},
        ),
      ),
    );
  }
}