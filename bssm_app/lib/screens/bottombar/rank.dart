import 'package:badges/badges.dart';
import 'package:bssm_app/common/common.dart';
import 'package:bssm_app/widgets/rank_view.dart';
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
              padding: EdgeInsets.only(top: 17.h, right: 20.w, bottom: 3.h),
              child: Badge(
                badgeContent: const Text("!"),
                child: InkWell(
                    onTap: () {
                      showDialog();
                    },
                    child: Image.asset("images/github.png")),
              ),
            ),
            // ElevatedButton(
            //     onPressed: () {
            //       showDialog();
            //     },
            //     style: ElevatedButton.styleFrom(),
            //     child: Text(
            //       "등록",
            //       style: TextStyle(
            //           fontSize: 18.sp,
            //           color: Colors.white,
            //           fontWeight: FontWeight.w500),
            //     ))
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
                padding: EdgeInsets.only(left: 20.w, right: 20.w, top: 30.h),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(top: 35.h),
                      child: Container(
                        height: 140.h,
                        width: 110.w,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius:
                                BorderRadius.all(Radius.circular(15.r))),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              margin: EdgeInsets.only(top: 10.h, bottom: 3.h),
                              height: 50.h,
                              width: 50.w,
                              decoration: const BoxDecoration(
                                  shape: BoxShape.circle, color: Colors.black),
                            ),
                            Text(
                              "username",
                              style: TextStyle(
                                  fontSize: 18.sp,
                                  color: CommonColor.blue,
                                  fontWeight: FontWeight.w500),
                            ),
                            Text(
                              "name",
                              style: TextStyle(
                                  fontSize: 17.sp,
                                  color: Colors.grey.withOpacity(0.6),
                                  fontWeight: FontWeight.w500),
                            ),
                            SizedBox(
                              height: 9.h,
                            ),
                            Text(
                              "9,900",
                              style: TextStyle(
                                  fontSize: 17.sp,
                                  color: Colors.black,
                                  fontWeight: FontWeight.w500),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Container(
                      height: 170.h,
                      width: 140.w,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius:
                              BorderRadius.all(Radius.circular(15.r))),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            margin: EdgeInsets.only(top: 14.h, bottom: 10.h),
                            height: 50.h,
                            width: 50.w,
                            decoration: const BoxDecoration(
                                shape: BoxShape.circle, color: Colors.black),
                          ),
                          Text(
                            "username",
                            style: TextStyle(
                                fontSize: 19.sp,
                                color: CommonColor.blue,
                                fontWeight: FontWeight.w500),
                          ),
                          Text(
                            "name",
                            style: TextStyle(
                                fontSize: 18.sp,
                                color: Colors.grey.withOpacity(0.6),
                                fontWeight: FontWeight.w500),
                          ),
                          SizedBox(
                            height: 15.h,
                          ),
                          Text(
                            "10,000",
                            style: TextStyle(
                                fontSize: 18.sp,
                                color: Colors.black,
                                fontWeight: FontWeight.w500),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 35.h),
                      child: Container(
                        height: 140.h,
                        width: 110.w,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius:
                                BorderRadius.all(Radius.circular(15.r))),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              margin: EdgeInsets.only(top: 10.h, bottom: 3.h),
                              height: 50.h,
                              width: 50.w,
                              decoration: const BoxDecoration(
                                  shape: BoxShape.circle, color: Colors.black),
                            ),
                            Text(
                              "username",
                              style: TextStyle(
                                  fontSize: 18.sp,
                                  color: CommonColor.blue,
                                  fontWeight: FontWeight.w500),
                            ),
                            Text(
                              "name",
                              style: TextStyle(
                                  fontSize: 17.sp,
                                  color: Colors.grey.withOpacity(0.6),
                                  fontWeight: FontWeight.w500),
                            ),
                            SizedBox(
                              height: 9.h,
                            ),
                            Text(
                              "9,800",
                              style: TextStyle(
                                  fontSize: 17.sp,
                                  color: Colors.black,
                                  fontWeight: FontWeight.w500),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 20.h, left: 22.w, bottom: 15.h),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      "My Rank",
                      style: TextStyle(
                          fontSize: 18.sp,
                          fontWeight: FontWeight.w500,
                          color: Colors.black),
                    ),
                    SizedBox(
                      width: 10.w,
                    ),
                    Text(
                      "NO.$myRank",
                      style: TextStyle(
                          fontSize: 23.sp,
                          fontWeight: FontWeight.w500,
                          color: CommonColor.blue),
                    )
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 20.w, right: 20.w),
                child: Container(
                  width: double.infinity,
                  height: 38.h,
                  decoration: BoxDecoration(
                      color: CommonColor.blue,
                      borderRadius: BorderRadius.all(Radius.circular(7.r))),
                  child: Padding(
                    padding: EdgeInsets.only(left: 10.w, right: 37.w),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Rank",
                          style: TextStyle(
                              fontSize: 15.sp,
                              color: Colors.white,
                              fontWeight: FontWeight.w500),
                        ),
                        Text(
                          "User",
                          style: TextStyle(
                              fontSize: 15.sp,
                              color: Colors.white,
                              fontWeight: FontWeight.w500),
                        ),
                        SizedBox(
                          width: 15.w,
                        ),
                        Text(
                          "Commit",
                          style: TextStyle(
                              fontSize: 15.sp,
                              color: Colors.white,
                              fontWeight: FontWeight.w500),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Rankview(myRank: myRank)
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
