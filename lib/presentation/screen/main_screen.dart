import 'package:dhammapath/presentation/controller/nav_controller.dart';
import 'package:dhammapath/presentation/controller/theme_controller.dart';
import 'package:dhammapath/presentation/widgets/bottom_nav_bar.dart';
import 'package:dhammapath/presentation/widgets/responsive_builder.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'bookmark_screen.dart';
import 'home_screen.dart';

class MainScreen extends StatelessWidget {
  MainScreen({super.key});

  final NavController navController = Get.find();
  final ThemeController themeController = Get.find();

  final List<Widget> pages = [
    const HomeScreen(),
    const BookmarkScreen(),
  ];

  final List<String> pageTitles = [
    'Home',
    'Bookmarks',
    'Settings',
  ];

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 610;

    return Scaffold(
      body: ResponsiveBuilder(
        mobile: _buildMobileLayout(context),
        tablet: _buildTabletLayout(context),
        desktop: _buildDesktopLayout(context),
      ),
      bottomNavigationBar: isMobile ? const CustomBottomNavBar() : null,
    );
  }

  Widget _buildMobileLayout(BuildContext context) {
    return GetBuilder<NavController>(
      builder: (controller) => pages[controller.selectedIndex],
    );
  }

  Widget _buildTabletLayout(BuildContext context) {
    final theme = Theme.of(context);
    return GetBuilder<NavController>(
      builder: (navController) => Row(
        children: [
          NavigationRail(
            backgroundColor: theme.cardColor,
            selectedIndex: navController.selectedIndex,
            selectedIconTheme: IconThemeData(color: theme.primaryColor),
            unselectedIconTheme: IconThemeData(color: theme.unselectedWidgetColor),
            selectedLabelTextStyle: TextStyle(color: theme.primaryColor),
            unselectedLabelTextStyle: TextStyle(color: theme.textTheme.bodyMedium?.color),
            onDestinationSelected: navController.onItemTapped,
            labelType: NavigationRailLabelType.all,
            destinations: const [
              NavigationRailDestination(
                icon: Icon(Icons.home_outlined),
                selectedIcon: Icon(Icons.home),
                label: Text('Home'),
              ),
              NavigationRailDestination(
                icon: Icon(Icons.bookmark_border),
                selectedIcon: Icon(Icons.bookmark),
                label: Text('Bookmark'),
              ),
              NavigationRailDestination(
                icon: Icon(Icons.settings_outlined),
                selectedIcon: Icon(Icons.settings),
                label: Text('Settings'),
              ),
            ],
          ),
          const VerticalDivider(thickness: 1, width: 1),
          Expanded(child: pages[navController.selectedIndex]),
        ],
      ),
    );
  }

  Widget _buildDesktopLayout(BuildContext context) {
    final theme = Theme.of(context);
    return GetBuilder<NavController>(
      builder: (navController) => Row(
        children: [
          NavigationRail(
            backgroundColor: theme.cardColor,
            selectedIndex: navController.selectedIndex,
            selectedIconTheme: IconThemeData(color: theme.primaryColor),
            unselectedIconTheme: IconThemeData(color: theme.unselectedWidgetColor),
            selectedLabelTextStyle: TextStyle(color: theme.primaryColor),
            unselectedLabelTextStyle: TextStyle(color: theme.textTheme.bodyMedium?.color),
            onDestinationSelected: navController.onItemTapped,
            labelType: NavigationRailLabelType.all,
            destinations: const [
              NavigationRailDestination(
                icon: Icon(Icons.home_outlined),
                selectedIcon: Icon(Icons.home),
                label: Text('Home'),
              ),
              NavigationRailDestination(
                icon: Icon(Icons.bookmark_border),
                selectedIcon: Icon(Icons.bookmark),
                label: Text('Bookmark'),
              ),
              NavigationRailDestination(
                icon: Icon(Icons.settings_outlined),
                selectedIcon: Icon(Icons.settings),
                label: Text('Settings'),
              ),
            ],
          ),
          const VerticalDivider(thickness: 1, width: 1),
          Expanded(child: pages[navController.selectedIndex]),
        ],
      ),
    );
  }
}
