import 'package:bssm_app/provider/ispressed.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:bssm_app/screens/bottombar/bottom.dart';
import 'package:provider/provider.dart';

class BsmSuccess extends StatefulWidget {
  const BsmSuccess({super.key});

  @override
  State<BsmSuccess> createState() => _BsmSuccessState();
}

class _BsmSuccessState extends State<BsmSuccess> {
  @override
  void initState() {
    super.initState();
    print("로그인 성공!");
  }

  @override
  Widget build(BuildContext context) {
    var pressed = Provider.of<Pressed>(context);
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
                  Navigator.push(context,
                      MaterialPageRoute(builder: (_) => const HomePage()));
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