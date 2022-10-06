import 'dart:convert';
import 'package:badges/badges.dart';
import 'package:bssm_app/common/common.dart';
import 'package:bssm_app/model/glist.dart';
import 'package:bssm_app/provider/ispressed.dart';
import 'package:bssm_app/screens/github/github_webview.dart';
import 'package:bssm_app/widgets/baekjoon_rank_view.dart';
import 'package:bssm_app/widgets/github_rank_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:material_dialogs/material_dialogs.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;

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
  double opacity1 = 0;
  double opacity2 = 1;
  bool loading = false;
  final _idController = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  int count = 0;
  var parsingData;

  //백준 인증
  void postequest(String access, var pressed) async {
    String url = 'http://52.79.57.84:8080/auth/boj';
    http.Response response =
        await http.post(Uri.parse(url), headers: <String, String>{
      'ACCESS-TOKEN': access,
    });
    print('실행되었습ㄴ디ㅏ');
    print(response.statusCode);
    if (response.statusCode == 200) {
      pressed.baekjoonchange(); //인증 후 bool 값을 true로 바꿈
    }
  }

  //백준 코드 발급
  void getRequest(String access, var pressed) async {
    String url = 'http://52.79.57.84:8080/boj/random';
    print("111111111111111111111111111");
    print(access);
    http.Response response =
        await http.get(Uri.parse(url), headers: <String, String>{
      'ACCESS-TOKEN': access,
    });
    print(response.statusCode);
    if (response.statusCode == 200) {
      String jsonData = response.body;
      var parsingData = jsonDecode(jsonData);
      var code = parsingData['code'];
      Navigator.of(context).pop();
      solvedAc(access, code, pressed); //코드를 발급하고 code를 넘겨서 solveac 실행
    } else {
      print("오류발생");
    }
  }

  void solvedAc(String accessToken, String code, var pressed) {
    showDialog(
        context: context,
        //barrierDismissible - Dialog를 제외한 다른 화면 터치 x
        barrierDismissible: false,
        builder: (BuildContext context) {
          return AlertDialog(
            // RoundedRectangleBorder - Dialog 화면 모서리 둥글게 조절
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0)),
            //Dialog Main Title
            title: Column(
              children: const [
                Text("SolvedAc 상태메세지에\n 코드를 입력해주세요!"),
              ],
            ),
            //
            content: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  code,
                ),
              ],
            ),
            actions: <Widget>[
              ElevatedButton(
                child: const Text("취소"),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
              ElevatedButton(
                child: const Text("확인"),
                onPressed: () {
                  print("333333333333333333333");
                  print(accessToken);
                  postequest(accessToken, pressed);
                  setState(() {});
                },
              ),
            ],
          );
        });
  }

  void baekjoonId(String access, var pressed) {
    showDialog(
        barrierDismissible: false,
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text("백준 아이디 입력"),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 10.w, right: 10.w),
                  child: TextField(
                    controller: _idController,
                    decoration: InputDecoration(
                      labelText: '백준 아이디',
                      enabledBorder: const UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey),
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide:
                            BorderSide(color: CommonColor.blue, width: 1),
                      ),
                      focusedErrorBorder: const UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.red, width: 5),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            actions: <Widget>[
              ElevatedButton(
                child: const Text("취소"),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
              ElevatedButton(
                child: const Text("확인"),
                onPressed: () {
                  getRequest(access, pressed);
                },
              ),
            ],
          );
        });
  }

  void showDialog1(String accessToken, var pressed) {
    Dialogs.materialDialog(
      barrierDismissible: false,
      color: Colors.white,
      msg: '간편하게 등록 해보세요',
      title: ispressed1 ? 'github 로그인' : 'baekjoon 로그인',
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
          style: ElevatedButton.styleFrom(backgroundColor: Colors.white),
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
            ispressed1
                ? Navigator.push(context,
                    MaterialPageRoute(builder: (_) => const GithubWebview()))
                : {
                    setState(() {
                      loading = true;
                    }),
                    Navigator.of(context).pop(),
                    baekjoonId(accessToken, pressed),
                  };
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
    var pressed = Provider.of<Pressed>(context);
    return SafeArea(
      child: Scaffold(
        backgroundColor: CommonColor.gray,
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(100.h),
          child: AppBar(
            automaticallyImplyLeading: false,
            toolbarHeight: 120.h,
            backgroundColor: CommonColor.gray,
            // leading: Padding(
            //   padding: EdgeInsets.only(top: 15.h),
            //   child: IconButton(
            //     onPressed: () {
            //       Navigator.of(context).pop();
            //     },
            //     icon: const Icon(
            //       Icons.arrow_back_ios,
            //       color: Colors.black,
            //     ),
            //     iconSize: 25.h,
            //   ),
            // ),
            title: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 120.w),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(top: 16.h),
                        child: Text(
                          "LEADERBOARD",
                          style: TextStyle(
                              fontFamily: 'Roboto',
                              fontSize: 22.sp,
                              color: Colors.black),
                        ),
                      ),
                      ispressed1
                          ? pressed.githubispressed
                              ? const Icon(null)
                              : Padding(
                                  padding:
                                      EdgeInsets.only(top: 15.h, bottom: 3.h),
                                  child: Badge(
                                    badgeContent: const Text(
                                      "!",
                                      style: TextStyle(color: Colors.white),
                                    ),
                                    badgeColor: CommonColor.blue,
                                    child: InkWell(
                                        onTap: () {
                                          showDialog1(
                                              pressed.accessToken, pressed);
                                        },
                                        child: Image.asset(
                                          "images/github.png",
                                          scale: 19.r,
                                        )),
                                  ),
                                )
                          : pressed.baekjoonispressed
                              ? const Icon(null)
                              : Padding(
                                  padding:
                                      EdgeInsets.only(top: 15.h, bottom: 3.h),
                                  child: Badge(
                                    badgeContent: const Text(
                                      "!",
                                      style: TextStyle(color: Colors.white),
                                    ),
                                    badgeColor: CommonColor.blue,
                                    child: InkWell(
                                      onTap: () {
                                        showDialog1(
                                            pressed.accessToken, pressed);
                                      },
                                      child: Image.asset(
                                        "images/baekjoon.png",
                                        scale: 12.r,
                                      ),
                                    ),
                                  ),
                                )
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 60.w, right: 60.w),
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
                              opacity1 = 0;
                              opacity2 = 1;
                            });
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.transparent,
                            elevation: 0.0,
                          ),
                          child: Opacity(
                            opacity: ispressed1 ? 1.0 : 0.3,
                            child: Text(
                              "깃허브",
                              style: TextStyle(
                                  color: ispressed1
                                      ? CommonColor.blue
                                      : Colors.black,
                                  fontSize: textSize1.sp,
                                  fontWeight: FontWeight.w500),
                            ),
                          )),
                      ElevatedButton(
                          onPressed: () {
                            setState(() {
                              ispressed2 = true;
                              ispressed1 = false;
                              textSize2 = 24;
                              textSize1 = 18;
                              leftPadding = 210;
                              opacity1 = 1;
                              opacity2 = 0;
                            });
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.transparent,
                            elevation: 0.0,
                          ),
                          child: Opacity(
                            opacity: ispressed2 ? 1.0 : 0.3,
                            child: Text(
                              "백준",
                              style: TextStyle(
                                color: ispressed2
                                    ? CommonColor.blue
                                    : Colors.black,
                                fontSize: textSize2.sp,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          )),
                    ],
                  ),
                ),
              ],
            ),
            centerTitle: true,
            elevation: 1.0,
          ),
        ),
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Center(
            child: Column(
              children: [
                Stack(
                  children: [
                    AnimatedOpacity(
                      opacity: opacity2,
                      duration: const Duration(microseconds: 1000000),
                      child: GithubRank(myRank: myRank),
                    ),
                    AnimatedOpacity(
                        opacity: opacity1,
                        duration: const Duration(microseconds: 1000000),
                        child: const Text("data"))
                  ],
                ),
              ],
            ),
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
