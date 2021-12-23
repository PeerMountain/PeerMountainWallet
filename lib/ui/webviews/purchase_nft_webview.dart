import 'dart:async';

import 'package:flutter/material.dart';
import 'package:kyc3/app/app.dart';
import 'package:kyc3/utils/app_links.dart';
import 'package:kyc3/widgets/widgets.dart';
import 'package:webview_flutter/webview_flutter.dart';

class PurchaseNftWebView extends StatefulWidget {
  final String redirectUrl;

  const PurchaseNftWebView({Key? key, required this.redirectUrl}) : super(key: key);

  @override
  _PurchaseNftWebViewState createState() => _PurchaseNftWebViewState();
}

class _PurchaseNftWebViewState extends State<PurchaseNftWebView> {
  final Completer<WebViewController> _controller = Completer<WebViewController>();

  @override
  void initState() {
    super.initState();
//    if (Platform.isAndroid) WebView.platform = SurfaceAndroidWebView();
  }

  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
      isAppbar: true,
      appBarColor: Theme.of(context).backgroundColor,
      leading: BackButton(color: context.textColor),
      titleStyle: Texts.customTextStyle(
        fontSize: 20.0,
        color: context.textColor,
        fontWeight: FontWeight.bold,
      ),
      title: "PeerMountain",
      child: SafeArea(
        child: Builder(
          builder: (_) {
            return WebView(
              initialUrl: widget.redirectUrl,
              debuggingEnabled: false,
              allowsInlineMediaPlayback: false,
              javascriptMode: JavascriptMode.unrestricted,
              onWebViewCreated: (WebViewController webViewController) {
                _controller.complete(webViewController);
              },
              javascriptChannels: <JavascriptChannel>{
                JavascriptChannel(name: 'Toaster', onMessageReceived: (msg) {}),
              },
              navigationDelegate: (NavigationRequest request) {
                if (request.url.startsWith('https://www.youtube.com/')) {
                  showLog('blocking navigation to $request}');
                  return NavigationDecision.prevent;
                }
                showLog('allowing navigation to $request');
                return NavigationDecision.navigate;
              },
              onPageStarted: (String url) async {
                showLog('Page started loading: $url');
                if (url.contains(Links.successURL)) {
                  hideKeyboard();
                  Future.delayed(const Duration(milliseconds: 50), () {
                    Navigator.of(context).pop(Keys.success);
                  });
                  return;
                }
              },
              onPageFinished: (String url) {
                showLog('Page finished loading: $url');
              },
              gestureNavigationEnabled: true,
            );
          },
        ),
      ),
    );
  }
}
