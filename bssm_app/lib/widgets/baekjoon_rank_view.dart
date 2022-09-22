import 'package:bssm_app/common/common.dart';
import 'package:bssm_app/model/blist.dart';
import 'package:bssm_app/model/glist.dart';
import 'package:bssm_app/widgets/github_rank_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:percent_indicator/percent_indicator.dart';

class BaekRank extends StatefulWidget {
  final int myRank;
  const BaekRank({Key? key, required this.myRank}) : super(key: key);

  @override
  State<BaekRank> createState() => _RankviewState();
}

class _RankviewState extends State<BaekRank> {
  List<BaekjoonRanklist> ranks = <BaekjoonRanklist>[];

  int count = 2;
  @override
  void initState() {
    super.initState();
    for (int i = 4; i <= 9; i++) {
      ranks.add(
          BaekjoonRanklist(i, "profile", "userName$i", "name", count, 4999));

      count += 2;
    }
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
                        Container(
                          margin: EdgeInsets.only(top: 10.h, bottom: 3.h),
                          height: 50.h,
                          width: 50.w,
                          decoration: const BoxDecoration(
                              shape: BoxShape.circle, color: Colors.black),
                        ),
                        Text(
                          ranks[1].userName,
                          style: TextStyle(
                            fontFamily: "Roboto",
                            fontSize: 14.sp,
                            color: CommonColor.blue,
                          ),
                        ),
                        Text(
                          ranks[1].name,
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
                          "${ranks[1].exp}/6000",
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
                      Container(
                        margin: EdgeInsets.only(top: 20.h, bottom: 10.h),
                        height: 50.h,
                        width: 50.w,
                        decoration: const BoxDecoration(
                            shape: BoxShape.circle, color: Colors.black),
                      ),
                      Text(
                        ranks[0].userName,
                        style: TextStyle(
                          fontFamily: "Roboto",
                          fontSize: 16.sp,
                          color: CommonColor.blue,
                        ),
                      ),
                      Text(
                        ranks[0].name,
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
                        "${ranks[0].exp}/6000",
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
                        Container(
                          margin: EdgeInsets.only(top: 10.h, bottom: 3.h),
                          height: 50.h,
                          width: 50.w,
                          decoration: const BoxDecoration(
                              shape: BoxShape.circle, color: Colors.black),
                        ),
                        Text(
                          ranks[2].userName,
                          style: TextStyle(
                            fontSize: 14.sp,
                            color: CommonColor.blue,
                            fontFamily: "Roboto",
                          ),
                        ),
                        Text(
                          ranks[2].name,
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
                          "${ranks[2].exp}/6000",
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

  for (var i = 0; i < ranks.length; i++) {
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
