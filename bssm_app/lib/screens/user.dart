import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class User extends StatefulWidget {
  const User({Key? key}) : super(key: key);

  @override
  State<User> createState() => _UserState();
}

class _UserState extends State<User> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Text("User", style: TextStyle(fontSize: 50.sp),)
        ],
      ),
    );
  }
}
