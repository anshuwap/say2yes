import 'dart:convert';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'Colors.dart';
import 'Constant.dart';


BoxDecoration boxDecoration(
    {double radius = 2,
    Color color = Colors.transparent,
    Color? bgColor = Colors.white,
    var showShadow = false}) {
  return BoxDecoration(
      color: bgColor,
      boxShadow: showShadow
          ? [
              BoxShadow(
                  // color: appStore.isDarkModeOn
                  //     ? appStore.scaffoldBackground!
                  //     : shadow_color,
                  blurRadius: 10,
                  spreadRadius: 2)
            ]
          : [BoxShadow(color: Colors.transparent)],
      border: Border.all(color: color),
      borderRadius: BorderRadius.all(Radius.circular(radius)));
}


// ignore: must_be_immutable
class AppBtn extends StatefulWidget {
  var value;
  VoidCallback onPressed;

  AppBtn({required this.value, required this.onPressed});

  @override
  State<StatefulWidget> createState() {
    return AppBtnState();
  }
}

class AppBtnState extends State<AppBtn> {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        primary: primaryColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      onPressed: widget.onPressed,
      child: Padding(
        padding: EdgeInsets.fromLTRB(spacing_standard_new.toDouble(), 16,
            spacing_standard_new.toDouble(), 16),
        child: Center(
            child: Text(
          widget.value,
          // style: boldTextStyle(
          //   color: Colors.white,
          // ),
        )),
      ),
    );
  }
}
class CustomTheme extends StatelessWidget {
  Widget? child;

  CustomTheme({this.child});

  @override
  Widget build(BuildContext context) {
    return Theme(
      // data: appStore.isDarkModeOn
      //     ? ThemeData.dark().copyWith(
      //   backgroundColor: appStore.scaffoldBackground,
      // )
        data  : ThemeData.light(),
      child: child!,
    );
  }
}
