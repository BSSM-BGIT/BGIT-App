import 'package:bssm_app/common/common.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Rank extends StatefulWidget {
  const Rank({Key? key}) : super(key: key);

  @override
  State<Rank> createState() => _RankState();
}

class _RankState extends State<Rank> {
  int rank = 6;
  int mycommit = 4422;
  String name = "Lovingcats";

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
            height: 180.h,
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
                        "${mycommit}",
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
                  "No.${rank}",
                  style: TextStyle(
                      fontSize: 40.sp,
                      fontWeight: FontWeight.w500,
                      color: Colors.white),
                )
              ],
            ),
          ),
          Container(
            height: 420.h,
            width: double.infinity,
            color: CommonColor.purple2,
          )
        ],
      ),
    );
  }
}
