import 'package:bssm_app/common/common.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Bottom {
  static Widget bottomBar() {
    return SizedBox(
      height: 60.h,
      child: Material(
        color: Colors.white,
        child: TabBar(
          labelColor: Colors.blue,
          unselectedLabelColor: Colors.black,
          indicatorColor: Colors.transparent,
          tabs: [
            Tab(
              icon: Icon(
                FontAwesomeIcons.rankingStar,
                size: 25.h,
              ),
            ),
            Tab(
              icon: Icon(
                Icons.people,
                size: 25.h,
              ),
            ),
            Tab(
              icon: Icon(
                Icons.account_circle,
                size: 25.h,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
