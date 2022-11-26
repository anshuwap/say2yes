import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';

class WalkThroughComponent extends StatelessWidget {
  final String? textContent;
  final String? walkImg;
  final String? desc;

  WalkThroughComponent({Key? key, this.textContent, this.walkImg, this.desc}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Image.asset(
          walkImg!,
          width: context.width() * .9,
          height: context.height() * 0.8,
          alignment: Alignment.center,
        ),


      ]
      ,
    );
  }
}
