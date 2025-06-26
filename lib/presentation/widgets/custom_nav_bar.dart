import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomBar extends StatelessWidget {
  final IconData icon;
  final String? title;
  final VoidCallback onTap;

  const CustomBar({
    super.key,
    required this.icon,
    this.title,
    required this.onTap,

}

);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 100.w,
        padding: EdgeInsets.all(12.r),
        decoration: BoxDecoration(
          color: Colors.white.withValues(alpha: 204),
          borderRadius: BorderRadius.circular(20.r),
        ),
        child: Column(
          children: [
            Icon(icon, color: Colors.brown, size: 30.sp),
            SizedBox(height: 6.h),
            Text(
              title!,
              style: TextStyle(
                fontSize: 16.sp,
                fontWeight: FontWeight.bold,
              ),
            ),

          ],
        ),
      ),
    );
  }
}
