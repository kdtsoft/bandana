import 'package:dhammapath/presentation/controller/theme_controller.dart';
import 'package:dhammapath/presentation/screen/blog_screen.dart';
import 'package:dhammapath/presentation/screen/bandana_screen.dart';
import 'package:dhammapath/presentation/screen/e_book_screen.dart';
import 'package:dhammapath/presentation/utils/app_color.dart';
import 'package:dhammapath/presentation/utils/const.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  String _getBengaliDate() {
    final now = DateTime.now();
    final dateFormat = DateFormat('dd MMMM yyyy', 'bn_BD');
    return dateFormat.format(now);
  }

  String _getBengaliTime() {
    final now = DateTime.now();
    final timeFormat = DateFormat('hh:mm a', 'bn_BD');
    return timeFormat.format(now);
  }

  @override
  Widget build(BuildContext context) {
    final ThemeController themeController = Get.find();
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      extendBody: true,
      body: Column(
        children: [
          _buildHeader(context, themeController, isDark),
          SizedBox(height: 20.h),
          Expanded(
            child: GridView.count(
              crossAxisCount: 2,
              padding: EdgeInsets.all(16.w),
              mainAxisSpacing: 16.h,
              crossAxisSpacing: 16.w,
              children: [
                _buildCategoryCard(
                  context,
                  icon: FontAwesomeIcons.handsPraying,
                  title: 'বন্দনা',
                  onTap: () {
                    Get.to(() => BandanaScreen(title: "বন্দনা সমগ্র"));
                  },
                ),
                _buildCategoryCard(
                  context,
                  icon: Icons.menu_book_rounded,
                  title: 'ই-বুক',
                  onTap: () {
                    Get.to(() => EBookScreen());
                  },
                ),
                _buildCategoryCard(
                  context,
                  icon: FontAwesomeIcons.spa,
                  title: 'ব্লগ',
                  onTap: () {
                    Get.to(() => BlogScreen());
                  },
                ),
                _buildCategoryCard(
                  context,
                  icon: FontAwesomeIcons.calendar,
                  title: 'ক্যালেন্ডার',
                  onTap: () {
                    Get.to(() => BlogScreen()); // You can change to CalendarScreen()
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildHeader(BuildContext context, ThemeController themeController, bool isDark) {
    //final bgColor = isDark ? AppColors.darkPrimary : AppColors.lightPrimary;

    return Container(
      width: double.infinity,
      height: 150.h, // Increased height for better visual balance
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 25.h),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: isDark
              ? [AppColors.darkPrimary, AppColors.darkBackground]
              : [AppColors.lightPrimary, Colors.teal.shade300], // Subtle gradient
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(30.r),
          bottomRight: Radius.circular(30.r),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.2),
            blurRadius: 10.r,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                ConstData.appNAme,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 28.sp, // Larger font for app name
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1.2,
                ),
              ),
              GetBuilder<ThemeController>(
                builder: (controller) {
                  return CircleAvatar(
                    radius: 25, // Slightly larger avatar
                    backgroundColor: Colors.white.withValues(alpha: 0.9), // Semi-transparent white
                    child: IconButton(
                      icon: Icon(
                        controller.isDarkMode.value ? Icons.light_mode : Icons.dark_mode,
                        color: Colors.teal.shade700, // Consistent icon color
                        size: 28.sp,
                      ),
                      onPressed: () {
                        controller.toggleTheme();
                      },
                    ),
                  );
                },
              ),
            ],
          ),
          SizedBox(height: 8.h), // Increased spacing
          Text(
            "${_getBengaliDate()}, ${_getBengaliTime()}",
            style: TextStyle(
              color: Colors.white.withValues(alpha: 0.8), // Softer white
              fontSize: 18.sp, // Slightly larger font for date/time
              fontStyle: FontStyle.italic,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCategoryCard(
      BuildContext context, {
        required IconData icon,
        required String title,
        required VoidCallback onTap,
      }) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final cardColor = isDark ? AppColors.darkCard : AppColors.lightCard;
    final textColor = isDark ? AppColors.darkText : AppColors.lightText;

    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        curve: Curves.easeInOut,
        decoration: BoxDecoration(
          color: cardColor,
          borderRadius: BorderRadius.circular(20.r),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: isDark ? 0.4 : 0.1),
              blurRadius: 15.r,
              offset: const Offset(0, 8),
            ),
          ],
        ),
        padding: EdgeInsets.symmetric(vertical: 16.h),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, color: Colors.teal, size: 40.sp), // Larger icon
            SizedBox(height: 15.h), // Increased spacing
            Text(
              title,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 16.sp, // Slightly larger font
                fontWeight: FontWeight.w600,
                color: textColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
