import 'package:dhammapath/presentation/controller/nav_controller.dart';
import 'package:dhammapath/presentation/screen/settings_screen.dart';
import 'package:dhammapath/presentation/widgets/bottom_nav_bar.dart';
import 'package:dhammapath/presentation/widgets/responsive_builder.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'bookmark_screen.dart';
import 'home_screen.dart';

class MainScreen extends StatelessWidget {
  MainScreen({super.key});

  final NavController navController = Get.find();

  final List<Widget> pages = [
    HomeScreen(),
    BookmarkScreen(),
    SettingsScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    // Check if the device is mobile using MediaQuery or any other logic
    final isMobile = MediaQuery.of(context).size.width < 610;

    return Scaffold(
      body: ResponsiveBuilder(
        mobile: _buildMobileLayout(),
        tablet: _buildTabletLayout(),
        desktop: _buildDesktopLayout(),
      ),
      bottomNavigationBar: isMobile ? const CustomBottomNavBar() : null,
    );
  }

  Widget _buildMobileLayout() {
    return GetBuilder<NavController>(
        builder: (controller) => pages[controller.selectedIndex],
      );
  }
  Widget _buildTabletLayout() {
    return Center(
      child: Text("This is tablet view"),
    );
  }
  Widget _buildDesktopLayout() {
    return Center(
        child: Text("This is desktop view"),
      );
  }


}
