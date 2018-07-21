import 'package:flutter/material.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';

class WebViewComp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    // return new MaterialApp(
    //   routes: { "/": (_) => new WebviewScaffold(
    //           url: "http://www.baidu.com",
    //           appBar: new AppBar(
    //             title: new Text("Widget webview"),
    //           ),
    //         )
    //   },
    // );

    return new WebviewScaffold(
              url: "www/index.html",
              appBar: new AppBar(
                title: new Text("Widget webview"),
              ),
              withJavascript: true,
              withZoom: false,
              withLocalStorage: true,
              
            );
  }
}
