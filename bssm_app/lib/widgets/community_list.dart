import 'package:bssm_app/model/clist.dart';
import 'package:bssm_app/screens/read.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CommunityList extends StatefulWidget {
  const CommunityList({super.key});

  @override
  State<CommunityList> createState() => _CommunityListState();
}

class _CommunityListState extends State<CommunityList> {
  List<Communitylist> lists = <Communitylist>[];
  int a = 16;
  int minutes = 1;
  @override
  void initState() {
    super.initState();

    for (int i = 1; i <= 15; i++) {
      lists.add(Communitylist("$i번째 title입니다", "$i번째 내용입니다", a, a, minutes));
      a = a - 1;
      minutes += 1;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: makeCommunityList(context, lists),
    );
  }
}

List<Widget> makeCommunityList(
    BuildContext context, List<Communitylist> lists) {
  List<Widget> results = [];

  for (var i = 0; i < lists.length; i++) {
    results.add(
      InkWell(
        onTap: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (_) => const Read()));
        },
        child: Container(
          width: double.infinity,
          height: 80.h,
          decoration: BoxDecoration(
            color: Colors.transparent,
            border: Border.all(
              width: 0.1.w,
              color: Colors.black.withOpacity(0.4),
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 16.h,
              ),
              Padding(
                padding: EdgeInsets.only(left: 20.w),
                child: Text(
                  lists[i].title,
                  style:
                      TextStyle(fontSize: 21.sp, fontWeight: FontWeight.w500),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 20.w),
                child: Text(
                  lists[i].content,
                  style:
                      TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w400),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(right: 20.w),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Icon(
                      Icons.favorite_border,
                      color: Colors.black,
                      size: 20.r,
                    ),
                    Text(
                      "${lists[i].likes}",
                      style: TextStyle(fontSize: 16.sp),
                    ),
                    SizedBox(
                      width: 20.w,
                    ),
                    Icon(
                      Icons.visibility_outlined,
                      color: Colors.black,
                      size: 20.r,
                    ),
                    Text(
                      "${lists[i].views}",
                      style: TextStyle(fontSize: 16.sp),
                    ),
                    SizedBox(
                      width: 20.w,
                    ),
                    Text(
                      "${lists[i].views}분전",
                      style: TextStyle(
                          color: Colors.black.withOpacity(0.5),
                          fontWeight: FontWeight.w400),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
  return results;
}
