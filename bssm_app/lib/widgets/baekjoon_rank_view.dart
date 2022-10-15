import 'package:bssm_app/common/common.dart';
import 'package:bssm_app/model/blist.dart';
import 'package:bssm_app/provider/baekjoonranks.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:provider/provider.dart';

class BaekRank extends StatefulWidget {
  const BaekRank({Key? key}) : super(key: key);

  @override
  State<BaekRank> createState() => _RankviewState();
}

class _RankviewState extends State<BaekRank> {
  int tierColor(String tier) {
    if (tier == "Unrated") {
      return 0xff000000;
    } else if (tier.contains("Bronze")) {
      return 0xffdb6c00;
    } else if (tier.contains("Silver")) {
      return 0xff54789a;
    } else if (tier.contains("Gold")) {
      return 0xffffc300;
    } else if (tier.contains("Platinum")) {
      return 0xff25d69b;
    } else if (tier.contains("Diamond")) {
      return 0xff00e4ff;
    } else if (tier.contains("Ruby")) {
      return 0xffff0068;
    } else if (tier.contains("Platinum")) {
      return 0xff9641d6;
    }

    return 0xff000000;
  }

  @override
  Widget build(BuildContext context) {
    var ranks = Provider.of<BaekRanks>(context, listen: false);
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
                            color: Color(tierColor(ranks.baekList[1].tier))
                                .withOpacity(0.2),
                            spreadRadius: 0,
                            blurRadius: 5.0,
                            offset:
                                Offset(0, 2.h), // changes position of shadow
                          ),
                        ],
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(5.r)),
                        border: Border.all(
                            color: Color(tierColor(ranks.baekList[1].tier)))),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        ranks.baekList[1].profile == "true"
                            ? Container(
                                margin: EdgeInsets.only(top: 10.h, bottom: 3.h),
                                height: 50.h,
                                width: 50.w,
                                child: Icon(
                                  Icons.account_circle,
                                  color: Colors.grey,
                                  size: 50.h,
                                ),
                              )
                            : Container(
                                margin: EdgeInsets.only(top: 10.h, bottom: 3.h),
                                height: 50.h,
                                width: 50.w,
                                decoration: const BoxDecoration(
                                  shape: BoxShape.circle,
                                ),
                                child: Image.network(
                                  ranks.baekList[1].profile,
                                  fit: BoxFit.fill,
                                ),
                              ),
                        Text(
                          ranks.baekList[1].userName,
                          style: TextStyle(
                            fontFamily: "Roboto",
                            fontSize: 14.sp,
                            color: CommonColor.blue,
                          ),
                        ),
                        Text(
                          ranks.baekList[1].name,
                          style: TextStyle(
                            fontFamily: "Roboto",
                            fontSize: 15.sp,
                            color: Colors.grey.withOpacity(0.8),
                          ),
                        ),
                        Container(
                          width: 60.w,
                          height: 20.h,
                          decoration: BoxDecoration(
                            border:
                                Border.all(color: Colors.black, width: 0.2.w),
                            borderRadius:
                                BorderRadius.all(Radius.circular(30.r)),
                          ),
                          alignment: Alignment.center,
                          child: Text(ranks.baekList[1].tier),
                        ),
                        SizedBox(
                          width: double.infinity,
                          child: LinearPercentIndicator(
                            animation: true,
                            lineHeight: 2.h,
                            animationDuration: 2000,
                            percent: ranks.baekList[1].exp /
                                ranks.baekList[1].maxrating,
                            // ignore: deprecated_member_use
                            linearStrokeCap: LinearStrokeCap.roundAll,
                            progressColor: Colors.greenAccent,
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
                          color: Color(tierColor(ranks.baekList[0].tier))
                              .withOpacity(0.4),
                          spreadRadius: 0,
                          blurRadius: 5.0,
                          offset: Offset(0, 3.h), // changes position of shadow
                        ),
                      ],
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(5.r)),
                      border: Border.all(
                          color: Color(tierColor(ranks.baekList[0].tier)))),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ranks.baekList[0].profile == "true"
                          ? Container(
                              margin: EdgeInsets.only(top: 10.h, bottom: 3.h),
                              height: 50.h,
                              width: 50.w,
                              child: Icon(
                                Icons.account_circle,
                                color: Colors.grey,
                                size: 50.h,
                              ),
                            )
                          : Container(
                              margin: EdgeInsets.only(top: 10.h, bottom: 3.h),
                              height: 50.h,
                              width: 50.w,
                              decoration:
                                  const BoxDecoration(shape: BoxShape.circle),
                              child: Image.network(
                                ranks.baekList[0].profile,
                                fit: BoxFit.fill,
                              ),
                            ),
                      Text(
                        ranks.baekList[0].userName,
                        style: TextStyle(
                          fontFamily: "Roboto",
                          fontSize: 16.sp,
                          color: CommonColor.blue,
                        ),
                      ),
                      Text(
                        ranks.baekList[0].name,
                        style: TextStyle(
                          fontFamily: "Roboto",
                          fontSize: 15.sp,
                          color: Colors.grey.withOpacity(0.8),
                        ),
                      ),
                      Container(
                        width: 80.w,
                        height: 30.h,
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.black, width: 0.2.w),
                          borderRadius: BorderRadius.all(Radius.circular(30.r)),
                        ),
                        alignment: Alignment.center,
                        child: Text(ranks.baekList[0].tier),
                      ),
                      SizedBox(
                        width: double.infinity,
                        child: LinearPercentIndicator(
                          animation: true,
                          lineHeight: 2.h,
                          animationDuration: 2000,
                          percent: ranks.baekList[0].exp /
                              ranks.baekList[0].maxrating,
                          // ignore: deprecated_member_use
                          linearStrokeCap: LinearStrokeCap.roundAll,
                          progressColor: Colors.greenAccent,
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
                            color: Color(tierColor(ranks.baekList[1].tier))
                                .withOpacity(0.2),
                            spreadRadius: 0,
                            blurRadius: 5.0,
                            offset:
                                Offset(0, 2.h), // changes position of shadow
                          ),
                        ],
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(5.r)),
                        border: Border.all(
                            color: Color(tierColor(ranks.baekList[0].tier)))),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        ranks.baekList[2].profile == "true"
                            ? Container(
                                margin: EdgeInsets.only(top: 10.h, bottom: 3.h),
                                height: 50.h,
                                width: 50.w,
                                child: Icon(
                                  Icons.account_circle,
                                  color: Colors.grey,
                                  size: 50.h,
                                ),
                              )
                            : Container(
                                margin: EdgeInsets.only(top: 10.h, bottom: 3.h),
                                height: 50.h,
                                width: 50.w,
                                decoration:
                                    const BoxDecoration(shape: BoxShape.circle),
                                child: Image.network(
                                  ranks.baekList[2].profile,
                                  fit: BoxFit.fill,
                                ),
                              ),
                        Text(
                          ranks.baekList[2].userName,
                          style: TextStyle(
                            fontSize: 14.sp,
                            color: CommonColor.blue,
                            fontFamily: "Roboto",
                          ),
                        ),
                        Text(
                          ranks.baekList[2].name,
                          style: TextStyle(
                            fontSize: 15.sp,
                            color: Colors.grey.withOpacity(0.8),
                            fontFamily: "Roboto",
                          ),
                        ),
                        Container(
                          width: 60.w,
                          height: 20.h,
                          decoration: BoxDecoration(
                            border:
                                Border.all(color: Colors.black, width: 0.2.w),
                            borderRadius:
                                BorderRadius.all(Radius.circular(30.r)),
                          ),
                          alignment: Alignment.center,
                          child: Text(ranks.baekList[2].tier),
                        ),
                        SizedBox(
                          width: double.infinity,
                          child: LinearPercentIndicator(
                            animation: true,
                            lineHeight: 2.h,
                            animationDuration: 2000,
                            percent: ranks.baekList[2].exp /
                                ranks.baekList[2].maxrating,
                            // ignore: deprecated_member_use
                            linearStrokeCap: LinearStrokeCap.roundAll,
                            progressColor: Colors.greenAccent,
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
                  "Rank",
                  style: TextStyle(
                      fontSize: 18.sp,
                      fontFamily: "Roboto",
                      color: Colors.black),
                ),
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
                    
                    Padding(
                      padding: EdgeInsets.only(left: 10.w),
                      child: Text(
                        "Rank",
                        style: TextStyle(
                          fontSize: 15.sp,
                          color: Colors.white,
                          fontFamily: "Roboto",
                        ),
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
                      width: 13.w,
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
            children: makeRankList(context, ranks.baekList),
          )
        ],
      ),
    );
  }
}

List<Widget> makeRankList(BuildContext context, List<BaekjoonRanklist> ranks) {
  List<Widget> results = [];
  int tierColor(String tier) {
    print(tier);
    if (tier == "Unrated") {
      return 0xff000000;
    } else if (tier.contains("Bronze")) {
      return 0xffdb6c00;
    } else if (tier.contains("Silver")) {
      return 0xff54789a;
    } else if (tier.contains("Gold")) {
      return 0xffffc300;
    } else if (tier.contains("Platinum")) {
      return 0xff25d69b;
    } else if (tier.contains("Diamond")) {
      return 0xff00e4ff;
    } else if (tier.contains("Ruby")) {
      return 0xffff0068;
    } else if (tier.contains("Platinum")) {
      return 0xff9641d6;
    }

    return 0xff000000;
  }

  for (var i = 3; i < ranks.length; i++) {
    results.add(Padding(
      padding: EdgeInsets.only(left: 20.w, right: 20.w, top: 15.h),
      child: Container(
        width: double.infinity,
        height: 75.h,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(20.r)),
          boxShadow: [
            BoxShadow(
              color: Color(tierColor(ranks[i].tier)).withOpacity(0.2),
              spreadRadius: 3,
              blurRadius: 7,
              offset: Offset(0, 3.h), // changes position of shadow
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
                  SizedBox(
                      width: 80.w,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "${ranks[i].rank}",
                            style: TextStyle(
                                color: CommonColor.blue,
                                fontSize: 30.sp,
                                fontWeight: FontWeight.w500),
                          ),
                        ],
                      )),
                  ranks[i].profile == "true"
                      ? Padding(
                          padding: EdgeInsets.only(right: 10.w),
                          child: Icon(
                            Icons.account_circle,
                            color: Colors.grey,
                            size: 50.h,
                          ),
                        )
                      : Container(
                          margin: EdgeInsets.only(bottom: 5.h, right: 8.w),
                          height: 40.h,
                          width: 40.w,
                          decoration:
                              const BoxDecoration(shape: BoxShape.circle),
                          child: Image.network(ranks[i].profile),
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
                        width: 70.w,
                        height: 30.h,
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.black, width: 0.2.w),
                          borderRadius: BorderRadius.all(Radius.circular(30.r)),
                        ),
                        alignment: Alignment.center,
                        child: Text(ranks[i].tier),
                      )
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
                percent: ranks[i].exp / ranks[i].maxrating,
                // ignore: deprecated_member_use
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
