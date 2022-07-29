import 'package:app/core/constants/color_const/color_const.dart';
import 'package:app/provider/color_change_notifier.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:screen_brightness/screen_brightness.dart';

class ScreenBrightnesWidget extends StatefulWidget {
  const ScreenBrightnesWidget({Key? key}) : super(key: key);

  @override
  State<ScreenBrightnesWidget> createState() => _ScreenBrightnesWidgetState();
}

class _ScreenBrightnesWidgetState extends State<ScreenBrightnesWidget> {
  Future<void> setBrightness(double brightness) async {
    try {
      await ScreenBrightness().setScreenBrightness(brightness);
    } catch (e) {
      debugPrint(e.toString());
      throw 'Failed to set brightness';
    }
  }

  Future<void> resetBrightness() async {
    try {
      await ScreenBrightness().resetScreenBrightness();
    } catch (e) {
      debugPrint(e.toString());
      throw 'Failed to reset brightness';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: FutureBuilder<double>(
        future: ScreenBrightness().current,
        builder: (context, snapshot) {
          double currentBrightness = 0;
          if (snapshot.hasData) {
            currentBrightness = snapshot.data!;
          }
          return StreamBuilder<double>(
            stream: ScreenBrightness().onCurrentBrightnessChanged,
            builder: (context, snapshot) {
              double changedBrightness = currentBrightness;
              if (snapshot.hasData) {
                changedBrightness = snapshot.data!;
              }
              return Slider.adaptive(
                value: changedBrightness, 
                thumbColor: Colors.white,
                activeColor: context.watch<ColorChangeNotifier>().colorP,
                onChanged: (value) {
                  setBrightness(value);
                },
              );
            },
          );
        },
      ),
    );
  }
}