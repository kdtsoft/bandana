import 'package:dhammapath/controller_binder.dart';
import 'package:dhammapath/presentation/screen/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class BandanaApp extends StatefulWidget {
  const BandanaApp({super.key});

  @override
  State<BandanaApp> createState() => _BandanaAppState();
}

class _BandanaAppState extends State<BandanaApp> {
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(360, 690), // এইটা তোমার UI design অনুযায়ী
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, child) {
          return GetMaterialApp(
            debugShowCheckedModeBanner: false,
            initialBinding: InitialBindings(),
            home: SplashScreen(),
          );
        });
  }}
