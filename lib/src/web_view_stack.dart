import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:webview/utils/Colors.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:nb_utils/nb_utils.dart';
import '../activity/NoInternetConnection.dart';

class WebViewStack extends StatefulWidget {
  const WebViewStack({required this.controller, super.key});

  final Completer<WebViewController> controller;

  @override
  State<WebViewStack> createState() => _WebViewStackState();
}

class _WebViewStackState extends State<WebViewStack> {
  var loadingPercentage = 0;
  Completer<WebViewController> _controller = Completer<WebViewController>();
  bool mFetchingFile = true;
  bool isWasConnectionLoss = false;
  bool mIsLoading = false;
  // @override
  // Widget build(BuildContext context) {
  //   return Stack(
  //     children: [
  //       WebView(
  //         initialUrl: 'https://www.say2yes.com',
  //         onWebViewCreated: (webViewController) {
  //           widget.controller.complete(webViewController);
  //           // controllerGlobal = webViewController;
  //         },
  //         onPageStarted: (url) {
  //           setState(() {
  //             loadingPercentage = 0;
  //           });
  //         },
  //         onProgress: (progress) {
  //           setState(() {
  //             loadingPercentage = progress;
  //           });
  //         },
  //         onPageFinished: (url) {
  //           setState(() {
  //             loadingPercentage = 100;
  //           });
  //         },
  //         navigationDelegate: (navigation) {
  //           final host = Uri.parse(navigation.url).host;
  //           if (host.contains('youtube.com')) {
  //             ScaffoldMessenger.of(context).showSnackBar(
  //               SnackBar(
  //                 content: Text(
  //                   'Blocking navigation to $host',
  //                 ),
  //               ),
  //             );
  //             return NavigationDecision.prevent;
  //           }
  //           return NavigationDecision.navigate;
  //         },
  //         javascriptMode: JavascriptMode.unrestricted,
  //         javascriptChannels: _createJavascriptChannels(context),
  //       ),
  //       // if (loadingPercentage < 100)
  //         // LinearProgressIndicator(
  //         //   value: loadingPercentage / 100.0,
  //         // ),
  //     ],
  //   );
  // }

  Future getDashboardData() async {
    await isNetworkAvailable().then((bool) async {
      if (bool) {
        setState(() {
          mFetchingFile = false;
        });

      } else {
        NoInternetConnection(
          isCloseApp: true,
        ).launch(context);
      }
    });
  }


  late WebViewController _webViewController;

  @override

  Widget build(BuildContext context) {
    Widget mainWebView = WebView(

      initialUrl: 'https://www.say2yes.com',
      javascriptMode: JavascriptMode.unrestricted,
      onWebViewCreated: (WebViewController webViewController) {
        _controller.complete(webViewController);
        _webViewController= webViewController;

      },
      javascriptChannels: <JavascriptChannel>[
        _toasterJavascriptChannel(context),
      ].toSet(),
      navigationDelegate: (NavigationRequest request) {

        return NavigationDecision.navigate;
      },
      onPageStarted: (String url) {


        setState(() {
          mFetchingFile = true;
          getDashboardData();



        });
      },
      onPageFinished: (String url) {
        setState(() {

          mFetchingFile = false;


        });

      },
      gestureNavigationEnabled: true,


    );









    return
      SafeArea(
        child: WillPopScope(
          onWillPop: () async {
            if(await _webViewController.canGoBack()){
              _webViewController.goBack();
              return false;
            }else{

              SystemNavigator.pop();

              return true;
            }

          },
          child: Scaffold(
            backgroundColor: screenBackgroundColor,

            body: Stack(
              children: <Widget>[
                Container(
                  child: mainWebView,
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height,
                ),
                if (mFetchingFile)
                  Center(
                    child: Card(
                      semanticContainer: true,
                      clipBehavior: Clip.antiAliasWithSaveLayer,
                      child: Container(
                        padding: EdgeInsets.all(20),
                        width: 80,
                        height: 80,
                        child: CircularProgressIndicator(),
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                      elevation: 10,
                      margin: EdgeInsets.all(30),
                    ),
                  )
              ],
            ),
          ),
        ),
      );




  }


  JavascriptChannel _toasterJavascriptChannel(BuildContext context) {
    return JavascriptChannel(
        name: 'Toaster',
        onMessageReceived: (JavascriptMessage message) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(message.message)),
          );
        });
  }


}