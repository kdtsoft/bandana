import 'package:dhammapath/presentation/widgets/background_img.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../widgets/custom_nav_bar.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'bandana_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      extendBody: true,
      body: Stack(
        children: [
          BackGroundImg(),
          _buildCategory(),
        ],
      ),
    );
  }

  Widget _buildCategory() {
    return Column(
      children: [
        Spacer(),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomBar(
                    icon: FontAwesomeIcons.handsPraying,
                    title: 'বন্দনা',
                    onTap: () {
                      Get.to(() => BandanaScreen());
                    },
                  ),
                  CustomBar(
                    icon: Icons.menu_book,
                    title: 'ই-বুক',
                    onTap: () {},
                  ),
                  CustomBar(
                    icon: FontAwesomeIcons.spa,
                    title: 'ব্লগ',
                    onTap: () {},
                  ),
                ],
              ),
              SizedBox(
                height: 40.h,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
