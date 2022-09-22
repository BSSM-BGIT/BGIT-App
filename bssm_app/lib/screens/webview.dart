import 'dart:async';
import 'dart:io';
import 'package:bssm_app/screens/bottombar/bottom.dart';
import 'package:bssm_app/screens/bottombar/rank.dart';
import 'package:bssm_app/widgets/bottombar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:http/http.dart' as http;

class Webview extends StatefulWidget {
  const Webview({Key? key}) : super(key: key);

  @override
  State<Webview> createState() => _WebviewState();
}

class _WebviewState extends State<Webview> {
  bool close = false;
  String code = "";
  String url = "http://localhost:3000/oauth/bsm?code=";
  final Completer<WebViewController> _controller =
      Completer<WebViewController>();

  @override
  void initState() {
    super.initState();
    if (Platform.isAndroid) {
      WebView.platform = SurfaceAndroidWebView();
    }
  }

  _postRequest() async {
    String url = 'http://52.79.57.84:8080/auth/oauth/bsm';

    http.Response response = await http.post(
      Uri.parse(url),
      headers: <String, String>{
        'authCode': code,
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: close
          ? Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "로그인 성공!",
                    style: TextStyle(
                        fontSize: 30.sp,
                        color: Colors.black,
                        fontWeight: FontWeight.w500),
                  ),
                  ElevatedButton(
                      onPressed: () {
                        print(code);
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (_) => const HomePage()));
                      },
                      child: Text(
                        "돌아가기",
                        style: TextStyle(fontSize: 17.sp),
                      ))
                ],
              ),
            )
          : WebView(
              initialUrl:
                  'https://bssm.kro.kr/oauth/login?clientId=4c81669f&redirectURI=http://localhost:3000/oauth/bsm',
              javascriptMode: JavascriptMode.unrestricted,
              navigationDelegate: (NavigationRequest request) {
                if (request.url.contains(url)) {
                  setState(() {
                    code = request.url.split("?code=")[1];
                    _postRequest();
                    close = true;
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
