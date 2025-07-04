import 'package:dhammapath/data/model/bandana_item_data.dart';
import 'package:dhammapath/data/model/bandana_item_model.dart';
import 'package:dhammapath/presentation/utils/app_color.dart';
import 'package:dhammapath/presentation/widgets/custom_appbar.dart';
import 'package:dhammapath/presentation/widgets/custom_drawer.dart';
import 'package:dhammapath/presentation/widgets/drawer_menu_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'bandana_detail_screen.dart';

class BandanaScreen extends StatelessWidget {
   final String? title;

  const BandanaScreen({super.key, this.title});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final textColor = isDark ? AppColors.darkText : AppColors.lightText;
    final borderColor = isDark ? AppColors.darkBorder : AppColors.lightBorder;
    final iconColor = isDark ? AppColors.darkIcon : AppColors.lightIcon;

    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      endDrawer: const CustomDrawer(), // Add this line for the drawer
      body: Column(
        children: [
          CustomAppBar(
            title: title ?? "বন্দনা সমগ্র",
            actions: [
              DrawerMenuButton(),
            ],
          ),
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(12),
              itemCount: bandanaList.length,
              itemBuilder: (context, index) {
                final BandanaItem item = bandanaList[index];
                return _buildExpandableCard(
                    context, item, textColor, borderColor, iconColor);
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildExpandableCard(BuildContext context, BandanaItem item,
      Color textColor, Color borderColor, Color iconColor) {
    return Container(
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(color: borderColor, width: 1.0),
        ),
      ),
      child: ExpansionTile(
        tilePadding: const EdgeInsets.symmetric(horizontal: 16),
        collapsedIconColor: Colors.brown,
        iconColor: Colors.brown,
        leading: Icon(Icons.folder_open, color: iconColor),
        title: Text(
          item.title,
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w600,
            color: textColor,
          ),
        ),
        childrenPadding: const EdgeInsets.only(left: 16),
        collapsedShape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
          side: BorderSide(color: Colors.transparent),
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
          side: BorderSide(color: Colors.transparent),
        ),
        children: item.children.map((subItem) {
          return Container(
            decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(color: borderColor, width: 0.5),
              ),
            ),
            child: ListTile(
              leading: Icon(Icons.file_open, color: iconColor),
              title: Text(
                subItem['title']!,
                style: TextStyle(fontSize: 16, color: textColor),
              ),
              onTap: () {
                Get.to(() => BandanaDetailScreen(
                      content: subItem['title']!,
                      fileName: subItem['file']!,
                    ));
              },
            ),
          );
        }).toList(),
      ),
    );
  }
}

// Padding(
// padding: const EdgeInsets.all(16.0),
// child: Column(
// children: [
// Image.asset(
// 'assets/logo.png', // তোমার লোগো এখানে বসাও
// height: 70,
// ),
// const SizedBox(height: 8),
// const Text(
// 'Hill Next, Bangladesh',
// textAlign: TextAlign.center,
// style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
// ),
// ],
// ),
// )
