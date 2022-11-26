import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:webview/utils/app_widget.dart';
import 'package:nb_utils/nb_utils.dart';
import '../app_localizations.dart';

class NoInternetConnection extends StatelessWidget {
  bool _isCloseApp = false;

  NoInternetConnection({isCloseApp = false}) {
    _isCloseApp = isCloseApp;
  }




  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: WillPopScope(
        onWillPop: () async {

          SystemNavigator.pop();

          return true;
        },
        child: Scaffold(

          body: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Image.asset('images/noInternet.png', height: 250, width: 250, fit: BoxFit.cover),
              32.height,
              Text(keyString(context, 'No Internet/WiFi.')!, style: boldTextStyle(size: 24)),
              8.height,
              Text(keyString(context, 'kindly Turn On Your Internet/WiFi to use SAY2YES App.')!, style: secondaryTextStyle(size: 14), textAlign: TextAlign.center).paddingOnly(left: 16, right: 16),
              AppBtn(
                value: keyString(context, 'Close & Try again')!,
                onPressed: () {
                  if (_isCloseApp) {
                    SystemNavigator.pop();
                  } else {
                    finish(context);
                  }
                },
              ).paddingAll(16)
            ],
          ),
        ),
      ),
    );
  }
}
