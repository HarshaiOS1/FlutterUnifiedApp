import 'package:unifiedflutterapp/GenericWebViewContoller.dart';
import 'package:flutter/material.dart';

class HelpView extends StatelessWidget {

  /*
    Add Generics for webview

   */

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
          child: WebViewContainer("https://www.embitel.com/company/contact-us"),
        ));
  }
}