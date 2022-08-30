import 'package:bssm_app/common/common.dart';
import 'package:bssm_app/screens/webview.dart';
import 'package:bssm_app/widgets/rank_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:flutter_animated_dialog/flutter_animated_dialog.dart';
import 'package:material_dialogs/material_dialogs.dart';

class Rank extends StatefulWidget {
  const Rank({Key? key}) : super(key: key);

  @override
  State<Rank> createState() => _RankState();
}

class _RankState extends State<Rank> {
  int myRank = 6;
  int myCommit = 9500;
  String name = "userName6";

  int rank = 1;
  late int rankColor;
  bool registration = false;

  @override
  void initState() {
    super.initState();
    initialization();
  }

  void showDialog() {
    // showAnimatedDialog(
    //   context: context,
    //   barrierDismissible: true,
    //   builder: (BuildContext context) {
    //     return
    //   },
    //   animationType: DialogTransitionType.slideFromBottomFade,
    //   curve: Curves.fastOutSlowIn,
    //   duration: const Duration(seconds: 1),
    // );
    Dialogs.materialDialog(
      color: Colors.white,
      msg: '간편하게 로그인 해보세요',
      title: 'github 로그인',
      lottieBuilder: Lottie.asset(
        'assets/dialog.json',
        fit: BoxFit.contain,
      ),
      context: context,
      actions: [
        ElevatedButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          style: ElevatedButton.styleFrom(primary: Colors.white),
          child: Padding(
            padding: EdgeInsets.only(left: 10.w, right: 10.w),
            child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              
              Text(
                "취소",
                style: TextStyle(
                    color: Colors.grey,
                    fontSize: 18.sp,
                    fontWeight: FontWeight.w500),
              )
            ]),
          ),
        ),
        ElevatedButton(
          onPressed: () {
             Navigator.push(context,
                      MaterialPageRoute(builder: (_) => const Webview()));
          },
          style: ElevatedButton.styleFrom(primary: Colors.blue),
          child: Padding(
            padding: EdgeInsets.only(left: 10.w, right: 10.w),
            child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              const Icon(
                Icons.check,
                color: Colors.white,
              ),
              Text(
                "확인",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 18.sp,
                    fontWeight: FontWeight.w500),
              )
            ]),
          ),
        ),
      ],
    );
  }

  void initialization() async {
    // This is where you can initialize the resources needed by your app while
    // the splash screen is displayed.  Remove the following example because
    // delaying the user experience is a bad design practice!
    // ignore_for_file: avoid_print
    print('ready in 3...');
    await Future.delayed(const Duration(seconds: 1));
    print('ready in 2...');
    await Future.delayed(const Duration(seconds: 1));
    print('ready in 1...');
    await Future.delayed(const Duration(seconds: 1));
    print('go!');
    FlutterNativeSplash.remove();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CommonColor.purple2,
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: Icon(
            Icons.arrow_back_ios,
            size: 22.h,
            color: Colors.white,
          ),
        ),
        title: Text(
          "Ranking",
          style: TextStyle(
              fontSize: 24.sp,
              fontWeight: FontWeight.w600,
              color: Colors.white),
        ),
        backgroundColor: CommonColor.purple4,
        actions: [
          Padding(
              padding: EdgeInsets.only(top: 12.h, bottom: 12.h, right: 8.w),
              child: ElevatedButton(
                  onPressed: () {
                    showDialog();
                  },
                  style: ElevatedButton.styleFrom(),
                  child: Text(
                    "등록",
                    style: TextStyle(
                        fontSize: 18.sp,
                        color: Colors.white,
                        fontWeight: FontWeight.w500),
                  )))
        ],
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            Container(
              width: double.infinity,
              height: 140.h,
              color: CommonColor.purple4,
              child: Row(
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 8.w),
                    child: Icon(
                      Icons.circle,
                      color: Colors.black,
                      size: 90.r,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 5.w, top: 10.h),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          name,
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 17.sp,
                              fontWeight: FontWeight.w500),
                        ),
                        Text(
                          "${myCommit}",
                          style: TextStyle(
                              fontSize: 35.sp,
                              color: Colors.white,
                              fontWeight: FontWeight.w500),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    width: 120.w,
                  ),
                  Text(
                    "No.${myRank}",
                    style: TextStyle(
                        fontSize: 40.sp,
                        fontWeight: FontWeight.w500,
                        color: Colors.white),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 15.h,
            ),
            Rankview(myRank: myRank),
          ],
        ),
      ),
    );
  }
}
