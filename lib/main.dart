import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

import 'src/menu.dart';
import 'src/navigation_controls.dart';
import 'src/web_view_stack.dart';

void main() {
  runApp(
    const MaterialApp(
      home: WebViewApp(),
    ),
  );
}

class WebViewApp extends StatefulWidget {
  const WebViewApp({super.key});

  @override
  State<WebViewApp> createState() => _WebViewAppState();
}

late WebViewController controllerGlobal;
//
// Future<bool> _exitApp(BuildContext context) async {
//   if (await controllerGlobal.canGoBack()) {
//     print("onwill goback");
//     controllerGlobal.goBack();
//     return Future.value(true);
//   } else {
//     // Scaffold.of(context).showSnackBar(
//     //   const SnackBar(content: Text("No back history item")),
//     // );
//     print("onwill error");
//     return Future.value(false);
//   }
// }

class _WebViewAppState extends State<WebViewApp> {
  final controller = Completer<WebViewController>();

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        final messenger = ScaffoldMessenger.of(context);
        if (await controllerGlobal.canGoBack()) {
          await controllerGlobal.goBack();
        } else {
          messenger.showSnackBar(
            const SnackBar(content: Text('No back history item')),
          );
          return false;
        }
        print('The user tries to pop()');
        return false;
      },
      // onWillPop: () => _exitApp(context),
      child: Scaffold(
        backgroundColor: const Color(0xffF0F4FF),
        appBar: PreferredSize(
            preferredSize: const Size.fromHeight(0.0), // here the desired height
            child: AppBar(
              // title: const Text('Say2Yes'),
              // actions: [
              //   NavigationControls(controller: controller),
              //   Menu(controller: controller),
              // ],
            ),
        ),
        body: WebViewStack(controller: controller),
      ),
    );
  }
}