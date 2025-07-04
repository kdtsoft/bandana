import 'package:dhammapath/app/controller_binder.dart';
import 'package:dhammapath/presentation/controller/theme_controller.dart';
import 'package:dhammapath/presentation/screen/splash_screen.dart';
import 'package:dhammapath/presentation/utils/app_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class BandanaApp extends StatelessWidget {
  const BandanaApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      builder: (context, child) {
        return GetMaterialApp(
          debugShowCheckedModeBanner: false,

          theme: ThemeData(
            brightness: Brightness.light,
            scaffoldBackgroundColor: AppColors.lightBackground,
            primaryColor: AppColors.lightPrimary,
            cardColor: AppColors.lightCard,
            appBarTheme: AppBarTheme(
              backgroundColor: AppColors.lightPrimary,
              iconTheme: const IconThemeData(color: Colors.white),
              titleTextStyle: TextStyle(color: Colors.white, fontSize: 20.sp),
              elevation: 0,
            ),
            textTheme: TextTheme(
              bodyLarge: TextStyle(color: AppColors.lightText),
              bodyMedium: TextStyle(color: AppColors.lightText),
            ),
            bottomNavigationBarTheme: BottomNavigationBarThemeData(
              backgroundColor: AppColors.lightPrimary,
              selectedItemColor: AppColors.lightPrimary,
              unselectedItemColor: Colors.grey,
            ),

            iconTheme: IconThemeData(
              color: Colors.teal
            ),

            listTileTheme: ListTileThemeData(
              iconColor: Colors.teal
            )
          ),

          darkTheme: ThemeData(
            brightness: Brightness.dark,
            scaffoldBackgroundColor: AppColors.darkBackground,
            primaryColor: AppColors.darkPrimary,
            cardColor: AppColors.darkCard,
            appBarTheme: AppBarTheme(
              backgroundColor: AppColors.darkPrimary,
              iconTheme: const IconThemeData(color: Colors.white),
              titleTextStyle: TextStyle(color: Colors.white, fontSize: 20.sp),
              elevation: 0,
            ),
            textTheme: TextTheme(
              bodyLarge: TextStyle(color: AppColors.darkText),
              bodyMedium: TextStyle(color: AppColors.darkText),
            ),
            bottomNavigationBarTheme: BottomNavigationBarThemeData(
              backgroundColor: AppColors.darkBackground,
              selectedItemColor: AppColors.darkPrimary,
              unselectedItemColor: Colors.grey,
            ),


          ),
          themeMode: Get.find<ThemeController>().theme,
          initialBinding: InitialBindings(),
          home: const SplashScreen(),
        );
      },
    );
  }
}

