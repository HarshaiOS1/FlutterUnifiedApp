import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebViewContainer extends StatefulWidget {
  final url;

  WebViewContainer(this.url);

  @override
  createState() => _WebViewContainerState(this.url);
}

class _WebViewContainerState extends State<WebViewContainer> {
  var _url;
  num _stackToView = 1;
  final _key = UniqueKey();

  void _handleLoad(String value) {
    setState(() {
      _stackToView = 0;
    });
  }

  _WebViewContainerState(this._url);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
//        appBar: AppBar(),
        body: Column(
          /*

          Use Indexed Stack to update Loader

           */
          children: [
            Expanded(
                child: WebView(
                    key: _key,
                    javascriptMode: JavascriptMode.unrestricted,
                    initialUrl: _url,
                    onPageFinished: _handleLoad,
                ),
            ),
            Container(
              color: Colors.black12,
              child: Center(
                child: CircularProgressIndicator(
                  backgroundColor: Colors.transparent,
                ),
              ),
            )
          ],
        )
    );
  }
}