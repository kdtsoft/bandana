import 'package:dhammapath/presentation/screen/bandana_screen.dart';

import 'package:dhammapath/presentation/utils/const.dart';
import 'package:dhammapath/presentation/widgets/app_logo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _moveToNextScreen();
  }

  Future<void> _moveToNextScreen() async {
    await Future.delayed(const Duration(seconds: 2));
    Get.offAll(() => BandanaScreen(title: "বন্দনা সমগ্র"));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const AppLogo(),
            Text(
              "বন্দনা সমগ্র",
              style: TextStyle(
                fontSize: 30.sp,
                fontWeight: FontWeight.bold,
                color: Colors.teal[700],
              ),
            ),
            const CircularProgressIndicator(),
            SizedBox(height: 8.h),
            Text(ConstData.appVersion),

          ],
        ),
      ),
    );
  }
}
