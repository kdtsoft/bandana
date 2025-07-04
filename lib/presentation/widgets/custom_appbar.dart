import 'package:dhammapath/presentation/utils/app_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({
    super.key,
    required this.title,
    this.actions,
    this.leading,
  });

  final String title;
  final List<Widget>? actions;
  final Widget? leading;

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    // থিম অনুযায়ী রঙ—
    final bgColor     = Theme.of(context).appBarTheme.backgroundColor ??
        (isDark ? AppColors.darkPrimary : AppColors.lightPrimary);
    final titleColor  = isDark ? AppColors.darkText : Colors.white;
    final iconColor   = isDark ? AppColors.darkIcon : AppColors.lightIcon;

    return AppBar(
      backgroundColor: bgColor,
      elevation: 4,
      centerTitle: true,
      actions: actions,
      // টাইটেল
      title: Text(
        title,
        style: TextStyle(
          fontSize: 22.sp,
          fontWeight: FontWeight.w600,
          color: titleColor,
        ),
      ),

      // leading – দেয় না দিলে logo দেখাবে
      leading: IconButton(
        onPressed: () {
          Navigator.of(context).maybePop();   // ডিফল্ট ব্যাক অ্যাকশন
        },
        icon: leading ??
            Image.asset(
              "assets/images/logo.png",
              width: 50.w,
              height: 50.h,
              fit: BoxFit.cover,
            ),
        color: iconColor,                     // ← থিম আইকন কালার
      ),



      // এক্সট্রা অ্যাকশনগুলোর আইকন কালার統一
      iconTheme: IconThemeData(color: iconColor),
      actionsIconTheme: IconThemeData(color: iconColor),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

