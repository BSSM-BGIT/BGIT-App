import 'package:bssm_app/screens/rank.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';

void main() {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
        overlays: [SystemUiOverlay.top]);
    return ScreenUtilInit(
        designSize: const Size(414, 736),
        builder: (BuildContext context, Widget? child) => const MaterialApp(
            title: 'BSSM_Git',
            debugShowCheckedModeBanner: false,
            home: Rank()));
  }
}
