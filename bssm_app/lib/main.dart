import 'package:bssm_app/screens/home.dart';
import 'package:bssm_app/screens/rank.dart';
import 'package:bssm_app/screens/user.dart';
import 'package:bssm_app/widgets/bottombar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
        overlays: [SystemUiOverlay.bottom]);
    return ScreenUtilInit(
      designSize: const Size(414, 736),
      builder: (BuildContext context, Widget? child) => MaterialApp(
        title: 'BSSM_Git',
        debugShowCheckedModeBanner: false,
        home: DefaultTabController(
            length: 3,
            child: Scaffold(
                body: const TabBarView(
                  physics: NeverScrollableScrollPhysics(),
                  children: [Home(), Rank(), User()],
                ),
                bottomNavigationBar: Bottom.bottomBar())),
      ),
    );
  }
}
