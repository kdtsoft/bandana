import 'package:dhammapath/presentation/controller/nav_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class CustomBottomNavBar extends StatelessWidget {
  const CustomBottomNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
      ),
      child: GetBuilder<NavController>(
        builder: (navController) {
          return BottomNavigationBar(
            backgroundColor: Color(0xFF001732),
            selectedItemColor: Colors.white,
            unselectedItemColor: Colors.brown,
            iconSize: 30.sp,
            selectedFontSize: 16.sp,
            unselectedFontSize: 14.sp,
            currentIndex: navController.selectedIndex,
            onTap: navController.changeTabIndex,
            items: const [
              BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
              BottomNavigationBarItem(icon: Icon(Icons.bookmark), label: 'Bookmark'),
              BottomNavigationBarItem(icon: Icon(Icons.settings), label: 'Setting'),
            ],
          );
        },
      ),
    );
  }
}
