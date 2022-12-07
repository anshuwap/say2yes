import 'dart:async';

import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:splash_screen_view/SplashScreenView.dart';
import 'package:webview/activity/walkthrough_screen.dart';
import 'package:webview/app_localizations.dart';
import 'package:webview/utils/Colors.dart';
import 'package:webview/utils/Constant.dart';
import 'package:webview/utils/app_widget.dart';
import 'package:webview/utils/images.dart';
import 'package:webview/utils/utils.dart';
import 'package:webview_flutter/webview_flutter.dart';
import '../src/web_view_stack.dart';
import 'NoInternetConnection.dart';

class SplashScreen extends StatefulWidget {
  static String tag = '/SplashScreen';
  bool mIsLoading = false;


  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  bool isWasConnectionLoss = false;
  bool mIsLoading = false;
  final controller = Completer<WebViewController>();
  @override
  void initState() {
    super.initState();
    setStatusBarColor(Colors.white);
    checkInternetConnection();
    init();
  }

  Future<void> init() async {
    await Future.delayed(Duration(seconds: 2));
    checkFirstSeen();
  }

  void checkInternetConnection() async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.none) {
      setState(() {
        isWasConnectionLoss = true;
      });
    } else {
      isWasConnectionLoss = false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (context) => Scaffold(
        backgroundColor: Colors.white,
        body: CustomTheme(
          child: SplashScreenView(
            navigateRoute: SizedBox(),
            duration: 5000,
            imageSize: 200,
            imageSrc: ic_logo,
            text: keyString(context, "Say2Yes"),
            textType: TextType.ColorizeAnimationText,
            textStyle: TextStyle(fontSize: 40.0, fontWeight: FontWeight.bold),
            colors: [
              primaryColor,
              accentColor,
              primaryColor,
              accentColor,
              primaryColor,
              accentColor,
            ],
            backgroundColor: Colors.white,
          ),
        ),
      ),
    );
  }


  Future checkFirstSeen() async {
    appConfiguration(context);
    // getSharedPref();
    // setValue(IS_FIRST_TIME, true);
    // bool isFirstTime = getBool(IS_FIRST_TIME) as bool;
    // bool isFirstTime = getBoolAsync(IS_FIRST_TIME, defaultValue: true);
    bool isFirstTime =true;
    if (isFirstTime) {

      if (isWasConnectionLoss == true) {
        NoInternetConnection(isCloseApp: true).launch(context, isNewTask: true);
      } else {
        WalkThroughScreen().launch(context, isNewTask: true);
      }
    } else {

      if (isWasConnectionLoss == true) {
        NoInternetConnection(isCloseApp: true).launch(context, isNewTask: true);
      } else {
        WebViewStack(controller: controller).launch(context, isNewTask: true);

      }
    }
  }
}
