import 'package:bssm_app/screens/community.dart';
import 'package:bssm_app/screens/rank.dart';
import 'package:bssm_app/screens/user.dart';
import 'package:bssm_app/widgets/bottombar.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';

void main() {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
        overlays: [SystemUiOverlay.bottom]);
    return ScreenUtilInit(
      designSize: const Size(414, 736),
      builder: (BuildContext context, Widget? child) => const MaterialApp(
        title: 'BSSM_Git',
        debugShowCheckedModeBanner: false,
        home: Rank()
        // DefaultTabController(
        //     length: 3,
        //     child: Scaffold(
        //         body: const TabBarView(
        //           physics: NeverScrollableScrollPhysics(),
        //           children: [Rank(), Community(), User()],
        //         ),
        //         bottomNavigationBar: Bottom.bottomBar())),
      ),
    );
  }
}
