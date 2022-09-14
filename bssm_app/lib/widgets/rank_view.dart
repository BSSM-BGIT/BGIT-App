import 'package:bssm_app/common/common.dart';
import 'package:bssm_app/model/list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Rankview extends StatefulWidget {
  final int myRank;
  const Rankview({Key? key, required this.myRank}) : super(key: key);

  @override
  State<Rankview> createState() => _RankviewState();
}

class _RankviewState extends State<Rankview> {
  List<Ranklist> ranks = <Ranklist>[];

  int count = 9600;

  @override
  void initState() {
    super.initState();
    for (int i = 4; i <= 9; i++) {
      ranks.add(Ranklist(i, "profile", "userName$i", "name", count));
      count -= 100;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: makeRankList(context, ranks, widget.myRank),
    );
  }
}

List<Widget> makeRankList(
    BuildContext context, List<Ranklist> ranks, int myRank) {
  List<Widget> results = [];

  for (var i = 0; i < ranks.length; i++) {
    int rankcolor = colorSelect(ranks[i].rank);
    results.add(Padding(
      padding: EdgeInsets.only(left: 20.w, right: 20.w, top: 13.h),
      child: Container(
        width: double.infinity,
        height: 75.h,
        decoration: BoxDecoration(
            color: ranks[i].rank == myRank
                ? Color.fromARGB(255, 175, 177, 179).withOpacity(0.4)
                : Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(20.r))),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
                padding: EdgeInsets.only(
                    left: 23.w, right: 23.w, top: 10.h, bottom: 10.h),
                child: Text(
                  "${ranks[i].rank}",
                  style: TextStyle(
                      color: CommonColor.blue,
                      fontSize: 30.sp,
                      fontWeight: FontWeight.w500),
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
                          fontSize: 20.sp,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                  Text(
                    ranks[i].name,
                    style: TextStyle(
                        color: Colors.grey.withOpacity(0.6),
                        fontSize: 15.sp,
                        fontWeight: FontWeight.w400),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 60.w, right: 2.w, top: 5.h),
              child: Text(
                "${ranks[i].commit}",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 30.sp,
                  fontWeight: FontWeight.w400,
                ),
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
