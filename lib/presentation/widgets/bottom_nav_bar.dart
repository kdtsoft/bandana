import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:dhammapath/presentation/controller/nav_controller.dart';
import 'package:dhammapath/presentation/utils/app_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class CustomBottomNavBar extends StatelessWidget {
  const CustomBottomNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final backgroundColor = isDark ? AppColors.darkPrimary : AppColors.lightPrimary;
    final iconColor = isDark ? AppColors.darkIcon : Colors.white;
    final inactiveColor = Colors.white70;

    return GetBuilder<NavController>(
      builder: (navController) => CurvedNavigationBar(
        index: navController.selectedIndex,
        onTap: navController.changeTabIndex,
        backgroundColor: Colors.transparent, // page background
        color: backgroundColor, // nav bar color
        buttonBackgroundColor: backgroundColor, // active icon bg color
        animationDuration: const Duration(milliseconds: 400),
        height: 60.h,
        items: [
          Icon(
            Icons.home,
            size: 30,
            color: navController.selectedIndex == 0 ? iconColor : inactiveColor,
          ),
          Icon(
            Icons.bookmark,
            size: 30,
            color: navController.selectedIndex == 1 ? iconColor : inactiveColor,
          ),
          Icon(
            Icons.settings,
            size: 30,
            color: navController.selectedIndex == 2 ? iconColor : inactiveColor,
          ),
        ],
      ),
    );
  }
}
