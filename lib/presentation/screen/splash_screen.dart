import 'package:dhammapath/presentation/screen/main_screen.dart';
import 'package:dhammapath/presentation/widgets/app_logo.dart';
import 'package:flutter/material.dart';
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            Spacer(),
            AppLogo(),
            Spacer(),
            CircularProgressIndicator(),
            SizedBox(height: 16),
            Text('Version 1.0.0'),
            SizedBox(height: 16),
          ],
        ),
      ),

    );
  }
}




Future<void> _moveToNextScreen() async {
  await Future.delayed(const Duration(seconds: 2));
  // Navigate to the next screen, e.g., HomeScreen
   Get.offAll(() => MainScreen());
}
