import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:flutter_web_auth/flutter_web_auth.dart';

class User extends StatefulWidget {
  const User({Key? key}) : super(key: key);

  @override
  State<User> createState() => _UserState();
}

class _UserState extends State<User> {
  Future<void> signIn() async {
    
    // 고유한 redirect uri
    const APP_REDIRECT_URI = "com.example.bssm_app";
    
    // 백엔드에서 미리 작성된 API 호출
    final url = Uri.parse('');
    
    // 백엔드가 제공한 로그인 페이지에서 로그인 후 callback 데이터 반환
    final result = await FlutterWebAuth.authenticate(
        url: url.toString(), callbackUrlScheme: APP_REDIRECT_URI);
    
    // 백엔드에서 redirect한 callback 데이터 파싱
    final accessToken = Uri.parse(result).queryParameters['access-token'];
    final refreshToken = Uri.parse(result).queryParameters['refresh-token'];
    
    // . . .
    // FlutterSecureStorage 또는 SharedPreferences 를 통한
    // Token 저장 및 관리
    // . . .
    
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
                onPressed: () {
                  signIn();
                },
                child: const Text(
                  "로그인",
                  style: TextStyle(fontSize: 20),
                ))
          ],
        ),
      ),
    );
  }
}
