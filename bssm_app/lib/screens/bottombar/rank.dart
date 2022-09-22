import 'package:badges/badges.dart';
import 'package:bssm_app/common/common.dart';
import 'package:bssm_app/widgets/baekjoon_rank_view.dart';
import 'package:bssm_app/widgets/github_rank_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:material_dialogs/material_dialogs.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:bssm_app/screens/webview.dart';

class Rank extends StatefulWidget {
  const Rank({Key? key}) : super(key: key);

  @override
  State<Rank> createState() => _RankState();
}

class _RankState extends State<Rank> {
  int myRank = 8;
  bool ispressed1 = true;
  bool ispressed2 = false;
  int textSize1 = 24;
  int textSize2 = 18;
  int leftPadding = 40;
  double opacity1 = 1;
  double opacity2 = 0;

  @override
  void initState() {
    super.initState();
    initialization();
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
      msg: '간편하게 등록 해보세요',
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
            Navigator.push(
                context, MaterialPageRoute(builder: (_) => const Webview()));
          },
          style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CommonColor.gray,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(70.h),
        child: AppBar(
          backgroundColor: CommonColor.gray,
          leading: Padding(
            padding: EdgeInsets.only(top: 15.h),
            child: IconButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              icon: const Icon(
                Icons.arrow_back_ios,
                color: Colors.black,
              ),
              iconSize: 25.h,
            ),
          ),
          actions: [
            Padding(
              padding: EdgeInsets.only(top: 15.h, right: 20.w, bottom: 3.h),
              child: Badge(
                badgeContent: const Text(
                  "!",
                  style: TextStyle(color: Colors.white),
                ),
                badgeColor: CommonColor.blue,
                child: InkWell(
                    onTap: () {
                      showDialog();
                    },
                    child: Image.asset("images/github.png")),
              ),
            ),
          ],
          title: Padding(
            padding: EdgeInsets.only(top: 16.h),
            child: Text(
              "LEADERBOARD",
              style: TextStyle(
                  fontFamily: 'Roboto', fontSize: 22.sp, color: Colors.black),
            ),
          ),
          centerTitle: true,
          elevation: 0.0,
        ),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Center(
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.only(left: 80.w, right: 80.w),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ElevatedButton(
                        onPressed: () {
                          setState(() {
                            ispressed1 = true;
                            ispressed2 = false;
                            textSize1 = 24;
                            textSize2 = 18;
                            leftPadding = 40;
                            opacity1 = 1;
                            opacity2 = 0;
                          });
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.transparent,
                          elevation: 0.0,
                        ),
                        child: Opacity(
                          opacity: ispressed1 ? 1.0 : 0.3,
                          child: Text(
                            "백준",
                            style: TextStyle(
                              color:
                                  ispressed1 ? CommonColor.blue : Colors.black,
                              fontSize: textSize1.sp,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        )),
                    ElevatedButton(
                        onPressed: () {
                          setState(() {
                            ispressed2 = true;
                            ispressed1 = false;
                            textSize2 = 24;
                            textSize1 = 18;
                            leftPadding = 205;
                            opacity1 = 0;
                            opacity2 = 1;
                          });
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.transparent,
                          elevation: 0.0,
                        ),
                        child: Opacity(
                          opacity: ispressed2 ? 1.0 : 0.3,
                          child: Text(
                            "깃허브",
                            style: TextStyle(
                                color: ispressed2
                                    ? CommonColor.blue
                                    : Colors.black,
                                fontSize: textSize2.sp,
                                fontWeight: FontWeight.w500),
                          ),
                        )),
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  AnimatedPadding(
                    duration: const Duration(microseconds: 100000),
                    padding: EdgeInsets.only(left: leftPadding.w),
                    child: Container(
                      width: 160.w,
                      height: 1.h,
                      color: CommonColor.blue,
                    ),
                  ),
                ],
              ),
              Stack(
                children: [
                  AnimatedOpacity(
                    opacity: opacity1,
                    duration: const Duration(microseconds: 1000000),
                    child: BaekRank(myRank: myRank),
                  ),
                  AnimatedOpacity(
                    opacity: opacity2,
                    duration: const Duration(microseconds: 1000000),
                    child: GithubRank(myRank: myRank),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}



// import 'package:bssm_app/common/common.dart';
// import 'package:bssm_app/widgets/rank_view.dart';
// import 'package:flutter/material.dart';
// import 'package:font_awesome_flutter/font_awesome_flutter.dart';

// class Rank extends StatefulWidget {
//   const Rank({Key? key}) : super(key: key);

//   @override
//   State<Rank> createState() => _RankState();
// }

// class _RankState extends State<Rank> {
//   int myRank = 6;
//   int myCommit = 9500;
//   String name = "userName6";

//   int rank = 1;
//   late int rankColor;
//   bool registration = false;

//   
//  



//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: CommonColor.purple2,
//       appBar: AppBar(
//         elevation: 0,
//         centerTitle: true,
//         leading: IconButton(
//           onPressed: () {
//             Navigator.of(context).pop();
//           },
//           icon: Icon(
//             Icons.arrow_back_ios,
//             size: 22.h,
//             color: Colors.white,
//           ),
//         ),
//         title: Text(
//           "Ranking",
//           style: TextStyle(
//               fontSize: 24.sp,
//               fontWeight: FontWeight.w600,
//               color: Colors.white),
//         ),
//         backgroundColor: CommonColor.purple4,
//         actions: [
//           
//         ],
//       ),
//       body: SingleChildScrollView(
//         scrollDirection: Axis.vertical,
//         child: Column(
//           children: [
//             Container(
//               width: double.infinity,
//               height: 140.h,
//               color: CommonColor.purple4,
//               child: Row(
//                 children: [
//                   Padding(
//                     padding: EdgeInsets.only(left: 8.w),
//                     child: Icon(
//                       Icons.circle,
//                       color: Colors.black,
//                       size: 90.r,
//                     ),
//                   ),
//                   Padding(
//                     padding: EdgeInsets.only(left: 5.w, top: 10.h),
//                     child: Column(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         Text(
//                           name,
//                           style: TextStyle(
//                               color: Colors.white,
//                               fontSize: 17.sp,
//                               fontWeight: FontWeight.w500),
//                         ),
//                         Text(
//                           "${myCommit}",
//                           style: TextStyle(
//                               fontSize: 35.sp,
//                               color: Colors.white,
//                               fontWeight: FontWeight.w500),
//                         ),
//                       ],
//                     ),
//                   ),
//                   SizedBox(
//                     width: 120.w,
//                   ),
//                   Text(
//                     "No.${myRank}",
//                     style: TextStyle(
//                         fontSize: 40.sp,
//                         fontWeight: FontWeight.w500,
//                         color: Colors.white),
//                   )
//                 ],
//               ),
//             ),
//             SizedBox(
//               height: 15.h,
//             ),
//             Rankview(myRank: myRank),
//           ],
//         ),
//       ),
//     );
//   }
// }
