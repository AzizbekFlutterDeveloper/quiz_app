import 'package:app/core/contanier_consts.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class BolimPage extends StatelessWidget {
  const BolimPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            height: size.height * 0.15,
          ),
          CircularPercentIndicator(
            radius: 80.0,
            lineWidth: 13.0,
            animation: true,
            percent: 0.6,
            center: Text(
              "60.0%",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
            ),
            circularStrokeCap: CircularStrokeCap.round,
            progressColor: MyContanier.correct,
          ),
        ],
      ),
    );
  }
}
