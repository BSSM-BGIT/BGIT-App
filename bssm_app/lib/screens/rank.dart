import 'package:bssm_app/common/common.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Rank extends StatefulWidget {
  const Rank({Key? key}) : super(key: key);

  @override
  State<Rank> createState() => _RankState();
}

class _RankState extends State<Rank> {
  int myRank = 6;
  int myCommit = 4422;
  String name = "Lovingcats";

  int rank = 1;
  late int rankColor;

  int colorSelect() {
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

  @override
  void initState() {
    super.initState();
    rankColor = colorSelect();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
          "Rank",
          style: TextStyle(
              fontSize: 24.sp,
              fontWeight: FontWeight.w600,
              color: Colors.white),
        ),
        backgroundColor: CommonColor.purple1,
      ),
      body: Column(
        children: [
          Container(
            width: double.infinity,
            height: 140.h,
            color: CommonColor.purple1,
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
          Stack(
            children: [
              Container(
                height: 521.4.h,
                width: double.infinity,
                color: CommonColor.purple2,
              ),
              Padding(
                padding: EdgeInsets.only(left: 15.w, right: 15.w, top: 20.h),
                child: Container(
                  width: double.infinity,
                  height: 80.h,
                  decoration: BoxDecoration(
                      color: CommonColor.purple1,
                      borderRadius: BorderRadius.all(Radius.circular(20.r))),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Padding(
                          padding: EdgeInsets.only(
                              left: 23.w, right: 23.w, top: 10.h, bottom: 10.h),
                          child: Text(
                            "$rank",
                            style: TextStyle(
                                color: Color(rankColor), fontSize: 50.sp),
                          )),
                      Container(
                          height: 80.h, width: 2.w, color: CommonColor.purple2),
                      SizedBox(
                        width: 12.w,
                      ),
                      Container(
                        height: 50.h,
                        width: 60.w,
                        decoration: BoxDecoration(
                            borderRadius:
                                BorderRadius.all(Radius.circular(50.r)),
                            color: Colors.black),
                      ),
                      SizedBox(
                        width: 5.w,
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(bottom: 4.h, top: 8.h),
                            child: Text(
                              "UserName",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.w500),
                            ),
                          ),
                          Text(
                            "Name",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 15.sp,
                                fontWeight: FontWeight.w400),
                          ),
                        ],
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 42.w, right: 2.w),
                        child: const Icon(
                          Icons.check_circle_outline,
                          color: Colors.white,
                        ),
                      ),
                      Container(
                        width: 60.w,
                        child: FittedBox(
                          fit: BoxFit.fitHeight,
                          child: Text(
                            "11577",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 60000.sp,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
