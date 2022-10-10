import 'package:bssm_app/screens/write.dart';
import 'package:bssm_app/widgets/community_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:bssm_app/common/common.dart';

class Community extends StatefulWidget {
  const Community({Key? key}) : super(key: key);

  @override
  State<Community> createState() => _CommunityState();
}

class _CommunityState extends State<Community> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CommonColor.gray,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(70.h),
        child: AppBar(
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
          actions: [
            Padding(
                padding: EdgeInsets.only(top: 15.h, bottom: 3.h),
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (_) => const Write()));
                  },
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.transparent,
                      elevation: 0,
                      shape: const CircleBorder()),
                  child: const Icon(
                    Icons.add,
                    color: Colors.black,
                  ),
                )),
          ],
          title: Padding(
            padding: EdgeInsets.only(top: 16.h),
            child: Text(
              "Community",
              style: TextStyle(
                  fontFamily: 'Roboto', fontSize: 22.sp, color: Colors.black),
            ),
          ),
          centerTitle: true,
          elevation: 3.0,
        ),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const[CommunityList()],
          ),
        ),
      ),
    );
  }
}
