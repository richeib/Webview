// ignore: file_names
import 'package:flutter/material.dart';

import 'package:flutter_inappwebview/flutter_inappwebview.dart';

class MyWebsite extends StatefulWidget {
  const MyWebsite({super.key});

  @override
  State<MyWebsite> createState() => _MyWebsiteState();
}

class _MyWebsiteState extends State<MyWebsite> {
  double _progress = 0;
  late InAppWebViewController inAppWebViewController;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          InAppWebView(
            initialUrlRequest:
                URLRequest(url: Uri.parse("https://algobiz.in/")),
            onWebViewCreated: (InAppWebViewController controller) {
              inAppWebViewController = controller;
            },
            //function which repeat
            onProgressChanged:
                (InAppWebViewController controller, int progress) {
              setState(() {
                _progress = progress / 100;
              });
            },
          ),
          _progress < 1
              ? Container(
                  child: LinearProgressIndicator(
                    value: _progress,
                  ),
                )
              : SizedBox()
        ],
      ),
    );
  }
}
