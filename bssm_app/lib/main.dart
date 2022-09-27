import 'package:bssm_app/provider/ispressed.dart';
import 'package:bssm_app/screens/bottombar/bottom.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:provider/provider.dart';

void main() {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
        overlays: [SystemUiOverlay.bottom]);
    return MultiProvider(
      providers: [ChangeNotifierProvider(create: (_) => Pressed())],
      child: ScreenUtilInit(
        designSize: const Size(414, 736),
        builder: (BuildContext context, Widget? child) => const MaterialApp(
            title: 'BSSM_Git',
            debugShowCheckedModeBanner: false,
            home: HomePage()),
      ),
    );
    
  }
}
