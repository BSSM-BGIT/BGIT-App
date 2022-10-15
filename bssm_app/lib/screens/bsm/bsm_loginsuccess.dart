import 'package:bssm_app/provider/ispressed.dart';
import 'package:bssm_app/widgets/loading.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class BsmSuccess extends StatefulWidget {
  const BsmSuccess({super.key});

  @override
  State<BsmSuccess> createState() => _BsmSuccessState();
}

class _BsmSuccessState extends State<BsmSuccess> {
  @override
  void initState() {
    super.initState();
  }

  Future<void> _getRequest(var access, var pressed) async {
    String url = 'http://52.79.57.84:8080/user';
    print("실행됨");
    print(access);
    http.Response response =
        await http.get(Uri.parse(url), headers: <String, String>{
      'ACCESS-TOKEN': access,
    });
    if (response.statusCode == 200) {
      print("성공함");
      var parsingData = jsonDecode(utf8.decode(response.bodyBytes));
      print(parsingData);
      if (parsingData['githubAuth']) {
        pressed.gitchange();
      }
      if (parsingData['bojAuth']) {
        pressed.bojchange();
      }
      Navigator.push(
          context, MaterialPageRoute(builder: (_) => const Loading()));
    } else {
      print("실패함");
      //오류 발생 코드
    }
  }

  @override
  Widget build(BuildContext context) {
    var pressed = Provider.of<Pressed>(context, listen: false);
    // ignore: unused_local_variable
    return Scaffold(
      body: Center(
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
                  _getRequest(pressed.accessToken, pressed);
                },
                child: Text(
                  "돌아가기",
                  style: TextStyle(fontSize: 17.sp),
                )),
          ],
        ),
      ),
    );
  }
}
