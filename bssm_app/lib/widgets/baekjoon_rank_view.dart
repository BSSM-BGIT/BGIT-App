import 'dart:convert';

import 'package:bssm_app/common/common.dart';
import 'package:bssm_app/model/blist.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:http/http.dart' as http;

class BaekRank extends StatefulWidget {
  final int myRank;
  const BaekRank({Key? key, required this.myRank}) : super(key: key);

  @override
  State<BaekRank> createState() => _RankviewState();
}

class _RankviewState extends State<BaekRank> {
  List<BaekjoonRanklist> ranks = <BaekjoonRanklist>[];

  String img1 = "";
  String id1 = "";
  String name1 = "";
  int tier1 = 0;
  int rating1 = 0;
  String img2 = "";
  String id2 = "";
  String name2 = "";
  int tier2 = 0;
  int rating2 = 0;
  String img3 = "";
  String id3 = "";
  String name3 = "";
  int tier3 = 0;
  int rating3 = 0;

  void _getRequest() async {
    String url = 'http://52.79.57.84:8080/user/boj';
    http.Response response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      String jsonData = response.body;
      var parsingData = jsonDecode(jsonData);
      int count = parsingData['count'];

      img1 = parsingData['data'][0]['bojImg'];
      id1 = parsingData['data'][0]['bojId'];
      name1 = parsingData['data'][0]['user']['name'];
      tier1 = parsingData['data'][0]['tier'];
      rating1 = parsingData['data'][0]['rating'];
      img2 = parsingData['data'][1]['bojImg'];
      id2 = parsingData['data'][1]['bojId'];
      name2 = parsingData['data'][1]['user']['name'];
      tier2 = parsingData['data'][1]['tier'];
      rating2 = parsingData['data'][1]['rating'];
      img3 = parsingData['data'][2]['bojImg'];
      id3 = parsingData['data'][2]['bojId'];
      name3 = parsingData['data'][2]['user']['name'];
      tier3 = parsingData['data'][2]['tier'];
      rating3 = parsingData['data'][2]['rating'];
      for (int i = 0; i < count; i++) {
        bool isnull = false;
        String img = "";
        String id = "";
        String name = "";
        int tier = 0;
        int rating = 0;

        img = parsingData['data'][i]['bojImg'];
        id = parsingData['data'][i]['bojId'];
        name = parsingData['data'][i]['user']['name'];
        tier = parsingData['data'][i]['tier'];
        rating = parsingData['data'][i]['rating'];
        if (parsingData['data'][i]['githubImg'] == null) {
          isnull = true;
        }
        ranks.add(BaekjoonRanklist(
            i + 1, isnull ? "true" : img, id, name, tier, rating));
      }
    } else {
      print("오류발생");
    }
  }

  @override
  void initState() {
    super.initState();
    _getRequest();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Container(
            height: 1.h,
            width: double.infinity,
            decoration: BoxDecoration(color: Colors.black.withOpacity(0.1)),
          ),
          Padding(
            padding: EdgeInsets.only(left: 20.w, right: 20.w, top: 50.h),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: EdgeInsets.only(top: 35.h),
                  child: Container(
                    height: 140.h,
                    width: 110.w,
                    decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.2),
                            spreadRadius: 0,
                            blurRadius: 5.0,
                            offset:
                                Offset(0, 2.h), // changes position of shadow
                          ),
                        ],
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(5.r))),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        ranks[1].profile == "true"
                            ? Container(
                                margin: EdgeInsets.only(top: 10.h, bottom: 3.h),
                                height: 50.h,
                                width: 50.w,
                                decoration: const BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Colors.black),
                              )
                            : Container(
                                margin: EdgeInsets.only(top: 10.h, bottom: 3.h),
                                height: 50.h,
                                width: 50.w,
                                decoration: const BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Colors.black),
                                child: Image.network(
                                  img2,
                                  fit: BoxFit.fill,
                                ),
                              ),
                        Text(
                          id2,
                          style: TextStyle(
                            fontFamily: "Roboto",
                            fontSize: 14.sp,
                            color: CommonColor.blue,
                          ),
                        ),
                        Text(
                          id2,
                          style: TextStyle(
                            fontFamily: "Roboto",
                            fontSize: 15.sp,
                            color: Colors.grey.withOpacity(0.8),
                          ),
                        ),
                        SizedBox(
                          height: 9.h,
                        ),
                        Text(
                          "${rating2}/6000",
                          style: TextStyle(
                            fontFamily: "Roboto",
                            fontSize: 12.sp,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  height: 170.h,
                  width: 120.w,
                  decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.4),
                          spreadRadius: 0,
                          blurRadius: 5.0,
                          offset: Offset(0, 3.h), // changes position of shadow
                        ),
                      ],
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(5.r))),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      ranks[0].profile == "true"
                          ? Container(
                              margin: EdgeInsets.only(top: 10.h, bottom: 3.h),
                              height: 50.h,
                              width: 50.w,
                              decoration: const BoxDecoration(
                                  shape: BoxShape.circle, color: Colors.black),
                            )
                          : Container(
                              margin: EdgeInsets.only(top: 10.h, bottom: 3.h),
                              height: 50.h,
                              width: 50.w,
                              decoration: const BoxDecoration(
                                  shape: BoxShape.circle, color: Colors.black),
                              child: Image.network(
                                img1,
                                fit: BoxFit.fill,
                              ),
                            ),
                      Text(
                        id1,
                        style: TextStyle(
                          fontFamily: "Roboto",
                          fontSize: 16.sp,
                          color: CommonColor.blue,
                        ),
                      ),
                      Text(
                        name1,
                        style: TextStyle(
                          fontFamily: "Roboto",
                          fontSize: 15.sp,
                          color: Colors.grey.withOpacity(0.8),
                        ),
                      ),
                      SizedBox(
                        height: 15.h,
                      ),
                      Text(
                        "${rating1}/6000",
                        style: TextStyle(
                          fontSize: 12.sp,
                          color: Colors.black,
                          fontFamily: "Roboto",
                        ),
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
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.2),
                            spreadRadius: 0,
                            blurRadius: 5.0,
                            offset:
                                Offset(0, 2.h), // changes position of shadow
                          ),
                        ],
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(5.r))),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        ranks[2].profile == "true"
                            ? Container(
                                margin: EdgeInsets.only(top: 10.h, bottom: 3.h),
                                height: 50.h,
                                width: 50.w,
                                decoration: const BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Colors.black),
                              )
                            : Container(
                                margin: EdgeInsets.only(top: 10.h, bottom: 3.h),
                                height: 50.h,
                                width: 50.w,
                                decoration: const BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Colors.black),
                                child: Image.network(
                                  img3,
                                  fit: BoxFit.fill,
                                ),
                              ),
                        Text(
                          id3,
                          style: TextStyle(
                            fontSize: 14.sp,
                            color: CommonColor.blue,
                            fontFamily: "Roboto",
                          ),
                        ),
                        Text(
                          name3,
                          style: TextStyle(
                            fontSize: 15.sp,
                            color: Colors.grey.withOpacity(0.8),
                            fontFamily: "Roboto",
                          ),
                        ),
                        SizedBox(
                          height: 9.h,
                        ),
                        Text(
                          "${rating3}/6000",
                          style: TextStyle(
                            fontSize: 12.sp,
                            color: Colors.black,
                            fontFamily: "Roboto",
                          ),
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
                      fontFamily: "Roboto",
                      color: Colors.black),
                ),
                SizedBox(
                  width: 10.w,
                ),
                Text(
                  "NO.${widget.myRank}",
                  style: TextStyle(
                      fontSize: 23.sp,
                      fontFamily: "Roboto",
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
                        fontFamily: "Roboto",
                      ),
                    ),
                    Text(
                      "User",
                      style: TextStyle(
                        fontSize: 15.sp,
                        color: Colors.white,
                        fontFamily: "Roboto",
                      ),
                    ),
                    SizedBox(
                      width: 15.w,
                    ),
                    Text(
                      "Tier/Exp",
                      style: TextStyle(
                        fontSize: 15.sp,
                        color: Colors.white,
                        fontFamily: "Roboto",
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Column(
            children: makeRankList(context, ranks, widget.myRank),
          )
        ],
      ),
    );
  }
}

List<Widget> makeRankList(
    BuildContext context, List<BaekjoonRanklist> ranks, int myRank) {
  List<Widget> results = [];

  for (var i = 3; i < ranks.length; i++) {
    int rankcolor = colorSelect(ranks[i].rank);
    results.add(Padding(
      padding: EdgeInsets.only(left: 20.w, right: 20.w, top: 13.h),
      child: Container(
        width: double.infinity,
        height: 75.h,
        decoration: BoxDecoration(
          color: 7 == myRank
              ? const Color.fromARGB(255, 175, 177, 179).withOpacity(0.4)
              : Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(5.r)),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.3),
              spreadRadius: 2,
              blurRadius: 7,
              offset: Offset(0, 2.h), // changes position of shadow
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: EdgeInsets.only(top: 14.h),
              child: Row(
                children: [
                  Padding(
                      padding: EdgeInsets.only(left: 23.w, bottom: 14.h),
                      child: SizedBox(
                        width: 40.w,
                        child: Text(
                          "${ranks[i].rank}",
                          style: TextStyle(
                              color: CommonColor.blue,
                              fontSize: 30.sp,
                              fontWeight: FontWeight.w500),
                        ),
                      )),
                  Container(
                    margin: EdgeInsets.only(bottom: 5.h, right: 8.w),
                    height: 40.h,
                    width: 40.w,
                    decoration: const BoxDecoration(
                        shape: BoxShape.circle, color: Colors.black),
                  ),
                  Padding(
                    padding: EdgeInsets.only(bottom: 5.h),
                    child: SizedBox(
                      width: 160.w,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(bottom: 2.h),
                            child: Text(
                              ranks[i].userName,
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 17.sp,
                                  fontWeight: FontWeight.w500),
                            ),
                          ),
                          Text(
                            ranks[i].name,
                            style: TextStyle(
                                color: Colors.grey,
                                fontSize: 15.sp,
                                fontWeight: FontWeight.w400),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Column(
                    children: [
                      Container(
                          alignment: Alignment.center,
                          height: 20.h,
                          width: 20.w,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.redAccent.withOpacity(0.9))),
                      SizedBox(
                        height: 2.h,
                      ),
                      Container(
                          width: 80.w,
                          alignment: Alignment.center,
                          child: Text(
                            "(${ranks[i].exp}/6000)",
                            style: TextStyle(
                              fontSize: 8.sp,
                            ),
                          ))
                    ],
                  )
                ],
              ),
            ),
            SizedBox(
              width: double.infinity,
              child: LinearPercentIndicator(
                animation: true,
                lineHeight: 2.h,
                animationDuration: 2000,
                percent: 0.85,
                linearStrokeCap: LinearStrokeCap.roundAll,
                progressColor: Colors.greenAccent,
              ),
            ),
          ],
        ),
      ),
    ));
  }
  return results;
}

int colorSelect(int rank) {
  int rankColor;
  if (rank == 1) {
    rankColor = 0xffFF3B5A;
  } else if (rank == 2) {
    rankColor = 0xffFF6A00;
  } else if (rank == 3) {
    rankColor = 0xffE6DA44;
  } else {
    rankColor = 0xffFFFFFFF;
  }
  return rankColor;
}
