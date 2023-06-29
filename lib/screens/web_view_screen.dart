import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:get/get.dart';

import '../statics.dart';

class WebViewScreen extends StatefulWidget {
  final String url;
  final bool isProduct;

  const WebViewScreen({
    Key? key,
    required this.url,
    this.isProduct = false,
  }) : super(key: key);

  @override
  State<WebViewScreen> createState() => _WebViewScreenState();
}

class _WebViewScreenState extends State<WebViewScreen> {
  late InAppWebViewController _webViewController;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: widget.isProduct
          ? null
          : AppBar(
              centerTitle: true,
              foregroundColor: mainColor,
              backgroundColor: Color.fromRGBO(36, 54, 101, 1.0),
              elevation: 0,
            ),
      body: InAppWebView(
        initialUrlRequest: URLRequest(
          url: Uri.parse(widget.url),
        ),
        onWebViewCreated: (InAppWebViewController controller) {
          _webViewController = controller;
        },
        onLoadStart: (InAppWebViewController controller, Uri? url) {
          print('Page started loading: $url');
        },
        onLoadStop: (InAppWebViewController controller, Uri? url) {
          print('Page finished loading: $url');
        },
      ),
    );
  }
}
