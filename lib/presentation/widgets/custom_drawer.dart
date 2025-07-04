import 'package:dhammapath/presentation/screen/bandana_screen.dart';
import 'package:dhammapath/presentation/screen/bookmark_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return _buildDrawer();
  }

  Drawer _buildDrawer() {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: const BoxDecoration(
              color: Colors.teal,
            ),
            child: Column(
              children: [
                Image.asset(
                  'assets/images/logo.png', // <-- আপনার লোগোর পাথ
                  height: 100.h,
                  width: 150.h,
                  fit: BoxFit.cover,
                ),
                const SizedBox(height: 8),
              ],
            ),
          ),
          // প্রতিটি _buildDrawerItem এর পর Divider যুক্ত করুন
          _buildDrawerItem(Icons.home, 'মূল পাতা', () {
            Get.offAll(() => BandanaScreen()); // Get.offAll এ ফাংশন হিসেবে রিটার্ন করতে হবে
          }),
          const Divider(), // এখানে Divider যুক্ত করা হয়েছে
          _buildDrawerItem(
            Icons.bookmark,
            'বুকমার্ক',
                () {
              Get.to(() => BookmarkScreen()); // Get.to এ ফাংশন হিসেবে রিটার্ন করতে হবে
            },
          ),
          const Divider(), // এখানে Divider যুক্ত করা হয়েছে
          _buildDrawerItem(Icons.mode, 'থিম নির্ধারণ', () {}),
          const Divider(), // এখানে Divider যুক্ত করা হয়েছে
          _buildDrawerItem(Icons.help, 'সাহায্য নিন', () {}),
          const Divider(), // এখানে Divider যুক্ত করা হয়েছে
          _buildDrawerItem(Icons.info, 'আমাদের সম্পর্কে', () {}),
          // শেষ আইটেমের পর Divider না দিলেও চলে, যদি না চান
        ],
      ),
    );
  }

  Widget _buildDrawerItem(IconData icon, String title, VoidCallback onTap) {
    return ListTile(
      leading: Icon(icon),
      title: Text(title, style: const TextStyle(fontSize: 16)),
      onTap: onTap,
    );
  }
}