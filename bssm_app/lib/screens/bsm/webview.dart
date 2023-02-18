import 'dart:async';
import 'dart:io';
import 'package:bssm_app/common/common.dart';
import 'package:bssm_app/provider/ispressed.dart';
import 'package:bssm_app/screens/bsm/bsm_loginsuccess.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
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
  String url = "https://bgit.bssm.kro.kr/oauth/bsm";
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
    var parsingData;
    print("postrequest 실행");
    String url = 'https://bgit.bssm.kro.kr/api/auth/oauth/bsm';
    http.Response response =
        await http.post(Uri.parse(url), headers: <String, String>{
      'authCode': code,
    });
    print("111111111111111111111$code");
    int statuscode = response.statusCode;
    print(statuscode);
      if (statuscode == 200) {
        var parsingData = jsonDecode(utf8.decode(response.bodyBytes));
        print("parsingData = $parsingData");
        accessToken = parsingData['accessToken']['value'];
        
        // ignore: avoid_print
        print("22222222222222222221222222222222222222222222222222222222");
        // ignore: avoid_print
        print(accessToken);
        pressed = pressed.inputaccesstoken(accessToken);

        // ignore: use_build_context_synchronously
        Navigator.push(
            context, MaterialPageRoute(builder: (_) => const BsmSuccess()));
        // return parsingData;
      }
    

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
                  'https://auth.bssm.kro.kr/oauth?clientId=4c81669f&redirectURI=https://bgit.bssm.kro.kr/oauth/bsm',
              javascriptMode: JavascriptMode.unrestricted,
              navigationDelegate: (NavigationRequest request) {
                if (request.url.contains("?code=")) {
                  setState(() {
                    code = request.url.split("?code=")[1];
                    close = true;
                  });
                  _postRequest(pressed);
                  pressed.bsmchange();

                  // do not navigate
                  return NavigationDecision.prevent;
                } else if (request.url.contains(url)) {}

                return NavigationDecision.navigate;
              },
              onWebViewCreated: (WebViewController webViewController) {
                _controller.complete(webViewController);
              },
            ),
    );
  }
}
