import 'package:app/core/sizeconfige/colors.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

import '../../core/data.dart';
import '../../core/sizeconfige/size_config.dart';
import '../../provider/login_provider.dart';

class ShowDialog {
  static myShowDialog(context) {
    ImagePicker picker = ImagePicker();
    return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: Colors.transparent,
          content: Container(
            height: getHeight(300),
            width: getWidth(340),
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(Radius.circular(20)),
              color: MyColors.myWhite,
              border: Border.all(color: MyColors.myBlue),
            ),
            child: Padding(
              padding: EdgeInsets.all(getHeight(15)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: getHeight(15)),
                    height: getHeight(50),
                    width: getHeight(200),
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.all(Radius.circular(15)),
                      border: Border.all(color: MyColors.myBlue),
                    ),
                    child: TextFormField(
                      style: TextStyle(
                        color: MyColors.myBlue,
                      ),
                      controller: context.watch<LoginProvider>().controller,
                      decoration: const InputDecoration(
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                  InkWell(
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: getHeight(15)),
                      margin: EdgeInsets.symmetric(
                        vertical: getHeight(20),
                      ),
                      height: getHeight(50),
                      width: getHeight(200),
                      decoration: BoxDecoration(
                        borderRadius: const BorderRadius.all(Radius.circular(15)),
                        border: Border.all(color: MyColors.myBlue),
                      ),
                      child: Row(
                        children: [
                          Icon(
                            Icons.add_a_photo,
                            color: MyColors.myBlue,
                            size: getHeight(30),
                          ),
                          SizedBox(width: getWidth(10)),
                          Text(
                            "${tilar['home'][context.watch<LoginProvider>().index]['rasm']}",
                            style: TextStyle(
                              color: MyColors.myBlue,
                              fontSize: getHeight(16),
                            ),
                          ),
                        ],
                      ),
                    ),
                    onTap: () async{
                      final PickedFile? image = await picker.getImage(source: ImageSource.gallery).then((value){
                        context.read<LoginProvider>().addPicture(value);
                        return null;
                      });
                      
                    },
                  ),
                  Container(
                    padding: EdgeInsets.only(left: getHeight(15)),
                    height: getHeight(50),
                    width: getHeight(200),
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.all(Radius.circular(15)),
                      border: Border.all(color: MyColors.myBlue),
                    ),
                    child: Row(
                      children: [
                        Icon(
                          Icons.language_rounded,
                          color: MyColors.myBlue,
                          size: getHeight(30),
                        ),
                        SizedBox(width: getWidth(10)),
                        Text(
                          context.watch<LoginProvider>().til,
                          style: TextStyle(
                            color: MyColors.myBlue,
                            fontSize: getHeight(18),
                          ),
                        ),
                        const Spacer(),
                        PopupMenuButton(
                          initialValue: 0,
                          icon: Icon(
                            Icons.keyboard_arrow_down_sharp,
                            color: MyColors.myBlue,
                            size: getHeight(25),
                          ),
                          shape: const RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(16))),
                          itemBuilder: (context) {
                            return List.generate(
                              3,
                              (index) {
                                return PopupMenuItem(
                                  child: Text("${tillar[index]}"),
                                  value: index,
                                );
                              },
                            );
                          },
                          onSelected: (v) {
                            context.read<LoginProvider>().tilAlmash(v);
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
