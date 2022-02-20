import 'dart:ui';

import 'package:app/core/contanier_consts.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.only(
          top: size.height * 0.12,
          left: size.width * 0.05,
          right: size.width * 0.05,
        ),
        child: Column(
          children: [
            const SizedBox(
              width: double.infinity,
            ),
            Text(
              "Savol-Javob Appga",
              style: TextStyle(
                fontSize: size.width * 0.07,
                color: MyContanier.correct,
              ),
            ),
            Text(
              "Xush Kelibsiz !!!",
              style: TextStyle(
                fontSize: size.width * 0.08,
                color: MyContanier.correct,
              ),
            ),
            SizedBox(
              height: size.height * 0.05,
            ),
            MyContanier.myButtom(
              context,
              color: MyContanier.correct,
              elevationcolor: const Color.fromARGB(255, 190, 218, 191),
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: size.width * 0.03,
                ),
                child: TextFormField(
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                  ),
                ),
              ),
            ),
            MyContanier.myButtom(
              context,
              color: MyContanier.correct,
              elevationcolor: const Color.fromARGB(255, 190, 218, 191),
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: size.width * 0.03,
                ),
                child: TextFormField(
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                  ),
                ),
              ),
            ),
            const Spacer(),
            MyContanier.myButtom(
              context,
              colorbody: MyContanier.correct,
              elevationcolor: const Color.fromARGB(255, 193, 247, 221),
              child: Text("Next",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: size.height * 0.025,
                ),
              ),
              onTap: (){
                Navigator.pushNamed(context, '/home');
              }
            ),
            SizedBox(
              height: size.height * 0.05,
            )
          ],
        ),
      ),
    );
  }
}
