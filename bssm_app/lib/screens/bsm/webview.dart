import 'dart:async';
import 'dart:io';
import 'package:bssm_app/common/common.dart';
import 'package:bssm_app/data/Network.dart';
import 'package:bssm_app/provider/ispressed.dart';
import 'package:bssm_app/screens/bsm/bsm_loginsuccess.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Webview extends StatefulWidget {
  const Webview({Key? key}) : super(key: key);

  @override
  State<Webview> createState() => _WebviewState();
}

class _WebviewState extends State<Webview> {
  bool close = false;
  bool postend = false;
  String code = "";
  String url = "http://localhost:3000/oauth/bsm?code=";
  String accessToken = "";
  final Completer<WebViewController> _controller =
      Completer<WebViewController>();

  @override
  void initState() {
    super.initState();
    if (Platform.isAndroid) {
      WebView.platform = SurfaceAndroidWebView();
    }
  }

  _postRequest(var pressed) async {
    String url = 'http://52.79.57.84:8080/auth/oauth/bsm';
    Network network = Network(url, code);

    var bsmData = await network.getJsonData();
    accessToken = bsmData['accessToken'];
    print("22222222222222222221222222222222222222222222222222222222");
    print(accessToken);
    pressed =pressed.inputaccesstoken(accessToken);


    // http.Response response = await http.post(
    //   Uri.parse(url),
    //   headers: <String, String>{
    //     'authCode': code,
    //   },
    // );
    // print(response.statusCode);
    // if (response.statusCode == 200) {
    //   String jsonData = response.body;
    //   print(jsonData);
    //   print(jsonData);
    // }
  }

  @override
  Widget build(BuildContext context) {
    var pressed = Provider.of<Pressed>(context);
    return Scaffold(
      body: close
          ? Center(child: SpinKitWave(color: CommonColor.blue))
          : WebView(
              initialUrl:
                  'https://bssm.kro.kr/oauth/login?clientId=4c81669f&redirectURI=http://localhost:3000/oauth/bsm',
              javascriptMode: JavascriptMode.unrestricted,
              navigationDelegate: (NavigationRequest request) {
                if (request.url.contains(url)) {
                  setState(() {
                    code = request.url.split("?code=")[1];
                    close = true;

                    _postRequest(pressed);
                    
                    pressed.bsmchange();
                    
                        Navigator.push(context,
                            MaterialPageRoute(builder: (_) => const BsmSuccess()));
                  });
                  // do not navigate
                  return NavigationDecision.prevent;
                }

                return NavigationDecision.navigate;
              },
              onWebViewCreated: (WebViewController webViewController) {
                _controller.complete(webViewController);
              },
            ),
    );
  }
}
