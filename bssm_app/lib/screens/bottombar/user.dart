import 'package:bssm_app/provider/ispressed.dart';
import 'package:bssm_app/screens/bsm/webview.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class User extends StatefulWidget {
  const User({Key? key}) : super(key: key);

  @override
  State<User> createState() => _UserState();
}

class _UserState extends State<User> {
  @override
  Widget build(BuildContext context) {
    var pressed = Provider.of<Pressed>(context);
    return Scaffold(
      body: pressed.bsmispressed
          ? Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "로그인 완료",
                    style: TextStyle(fontSize: 20.sp, color: Colors.black),
                  )
                ],
              ),
            )
          : Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                      onPressed: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (_) => const Webview()));
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
