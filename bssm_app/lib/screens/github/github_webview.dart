import 'dart:async';
import 'dart:io';
import 'package:bssm_app/common/common.dart';
import 'package:bssm_app/provider/ispressed.dart';
import 'package:bssm_app/screens/bottombar/bottom.dart';
import 'package:bssm_app/widgets/loading.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:http/http.dart' as http;

class GithubWebview extends StatefulWidget {
  const GithubWebview({Key? key}) : super(key: key);

  @override
  State<GithubWebview> createState() => _WebviewState();
}

class _WebviewState extends State<GithubWebview> {
  bool close = false;
  bool postend = false;
  String code = "";
  String url = "https://bgit.bssm.kro.kr/";
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

  _postRequest(String access) async {
    accessToken = access;
    String url = 'http://52.79.57.84:8080/login/oauth/github';

    http.Response response =
        await http.post(Uri.parse(url), headers: <String, String>{
      'ACCESS-TOKEN': accessToken,
    }, body: <String, String>{
      'code': code
    });

    
      Navigator.push(context, MaterialPageRoute(builder: (_) => Loading()));
   
  }

  @override
  Widget build(BuildContext context) {
    var pressed = Provider.of<Pressed>(context);
    return Scaffold(
      body: close
          ? Center(child: SpinKitWave(color: CommonColor.blue))
          : WebView(
              initialUrl:
                  'https://github.com/login/oauth/authorize?client_id=b87feaccd801817573ad&scope=id,name,email,avatar_url',
              javascriptMode: JavascriptMode.unrestricted,
              navigationDelegate: (NavigationRequest request) {
                if (request.url.contains("?code=")) {
                  setState(() {
                    code = request.url.split("?code=")[1];
                    close = true;
                    print(
                        "1111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111");
                    print(pressed.accessToken);
                    _postRequest(pressed.accessToken);
                    pressed.githubchange();
                  });
                  // do not navigate
                  return NavigationDecision.prevent;
                }else if(request.url.contains(url)){

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

