import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class SideMenu extends StatelessWidget {
  const SideMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          width: 288.w,
          height: double.infinity,
          color: Colors.black38,
          child: Column(
            children: [
              Padding(
                padding:EdgeInsets.only(left: 24),
                child: Divider(
                  color: Colors.white24,
                  height: 1,
                ),
              ),
              Image.asset(
                'assets/images/logo.png', // <-- আপনার লোগোর পাথ
                height: 70,
              ),
              const SizedBox(height: 8),
              _buildDrawerItem(Icons.home, 'মূল পাতা', () {
                Get.back();
              }),
              _buildDrawerItem(Icons.search, 'খোঁজ সাহায্য', () {}),
              _buildDrawerItem(Icons.text_fields, 'ফন্ট সাইজ', () {}),
              _buildDrawerItem(Icons.bookmark, 'বুকমার্ক', () {}),
              _buildDrawerItem(Icons.note, 'নোট সমগ্র', () {}),
              _buildDrawerItem(Icons.rule, 'নিয়ম নির্দেশন', () {}),
              _buildDrawerItem(Icons.help, 'সাহায্য নিন', () {}),
              _buildDrawerItem(Icons.info, 'আমাদের সম্পর্কে', () {}),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildDrawerItem(IconData icon, String title, VoidCallback onTap) {
    return ListTile(
      leading: Icon(icon, color: Colors.brown),
      title: Text(title, style: const TextStyle(fontSize: 16)),
      onTap: onTap,
    );
  }
}

