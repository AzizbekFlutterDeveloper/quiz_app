import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Padding(
        padding:  EdgeInsets.only(
          top: size.height * 0.12,
          left: size.width *0.05,
          right: size.width * 0.05,
        ),
        child: Column(
          children: [
            const SizedBox(
              width: double.infinity,
            ),
            Text("Savol-Javob Appga",
              style: TextStyle(
                fontSize: size.width * 0.07,
                color: Colors.blue[400],   
              ),
            ),
            Text("Xush Kelibsiz !!!",
              style: TextStyle(
                fontSize: size.width * 0.08,
                color: Colors.blue[400],   
              ),
            ),
            
          ],
        ),
      ),
    );
  }
}