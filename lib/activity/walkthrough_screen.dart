import 'dart:async';

import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
// import 'package:flutterapp/activity/WebViewScreen2.dart';
// import 'package:flutterapp/activity/dashboard_screen.dart';
// import 'package:flutterapp/app_localizations.dart';
// import 'package:flutterapp/component/walkthrough_component.dart';
// import 'package:flutterapp/utils/Colors.dart';
// import 'package:flutterapp/utils/Constant.dart';
// import 'package:flutterapp/utils/images.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:webview/component/walkthrough_component.dart';
import 'package:webview/src/web_view_stack.dart';
import 'package:webview/utils/images.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../app_localizations.dart';
import '../utils/Colors.dart';
import '../utils/Constant.dart';

class WalkThroughScreen extends StatefulWidget {
  static var tag = "/AppWalkThrough";

  @override
  WalkThroughScreenState createState() => WalkThroughScreenState();
}

class WalkThroughScreenState extends State<WalkThroughScreen> {
  final controller = Completer<WebViewController>();
  int currentIndexPage = 0;

  PageController _controller = new PageController();

  @override
  void initState() {
    super.initState();
    currentIndexPage = 0;
    setStatusBarColor(Colors.white);
  }

  // ignore: missing_return
  Future onPrev() async {
    setState(
      () {
        if (currentIndexPage >= 1) {
          currentIndexPage = currentIndexPage - 1;
          _controller.jumpToPage(currentIndexPage);
        }
      },
    );
  }

  // ignore: missing_return
  Future onNext() async {
    if (currentIndexPage < 3) {
      currentIndexPage = currentIndexPage + 1;
      _controller.jumpToPage(currentIndexPage);
    } else {
      setValue(IS_FIRST_TIME, false);
      WebViewStack(controller: controller).launch(context, isNewTask: true);
    }
  }

  Future<void> onSkip() async {
    // setValues(IS_FIRST_TIME, false);
    setValue(IS_FIRST_TIME, false);
    WebViewStack(controller: controller).launch(context, isNewTask: true);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: <Widget>[
          PageView(
            controller: _controller,
            children: <Widget>[
              WalkThroughComponent(
                textContent: keyString(context, 'lbl_welcome'),
                walkImg: ic_walk1,
                desc: keyString(context, 'newest_books_desc'),
              ),
              WalkThroughComponent(
                textContent: keyString(context, 'lbl_purchase_online'),
                walkImg: ic_walk2,
                desc: keyString(context, 'newest_books_desc'),
              ),
              WalkThroughComponent(
                textContent: keyString(context, 'lbl_push_notification'),
                walkImg: ic_walk3,
                desc: keyString(context, 'newest_books_desc'),
              ),
              WalkThroughComponent(
                textContent: keyString(context, 'lbl_enjoy_offline_support'),
                walkImg: ic_walk4,
                desc: keyString(context, 'newest_books_desc'),
              ),
            ],
            onPageChanged: (value) {
              setState(() => currentIndexPage = value);
            },
          ),
          Container(
            height: 85,
            padding: EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Align(
                  child: currentIndexPage == 0
                      ? SizedBox()
                      : AppButton(
                          color: primaryColor,
                          height: 80,
                          shapeBorder: RoundedRectangleBorder(
                              side: BorderSide(color: primaryColor),
                              borderRadius: radius(defaultAppButtonRadius)
                          ),
                          padding: EdgeInsets.all(8),
                          text: keyString(context, 'Prev'),
                          textColor: Colors.white,
                          onTap: onPrev),
                ),
                DotsIndicator(
                  dotsCount: 4,
                  position: currentIndexPage.toDouble(),
                  decorator: DotsDecorator(
                    color: Color(0XFFDADADA),
                    activeColor: primaryColor,
                  ),
                ),
                AppButton(
                    color: Colors.white,
                    shapeBorder: RoundedRectangleBorder(
                        side: BorderSide(color: primaryColor),
                        borderRadius: radius(defaultAppButtonRadius)),
                    height: 80,
                    padding: EdgeInsets.all(8),
                    text: keyString(context, 'Next'),
                    textColor: primaryColor,
                    onTap: onNext),
              ],
            ),
          ),
          Positioned(
            right: 0,
            top: 40,
            child: TextButton(
              onPressed: () {
                onSkip();
              },
              child: Text(
                keyString(context, 'Skip')!,
                style: TextStyle(
                    color: primaryColor,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
            ),
          )
        ],
      ),
    );
  }
}
