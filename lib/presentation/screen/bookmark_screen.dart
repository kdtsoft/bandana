import 'package:dhammapath/presentation/controller/bookmark_controller.dart';
import 'package:dhammapath/presentation/screen/bandana_detail_screen.dart';
import 'package:dhammapath/presentation/utils/app_color.dart';
import 'package:dhammapath/presentation/widgets/custom_appbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BookmarkScreen extends StatelessWidget {
  const BookmarkScreen({super.key});

  @override
  Widget build(BuildContext context) {
    
    final isDark   = Theme.of(context).brightness == Brightness.dark;
    final cardBg   = isDark ? AppColors.darkCard   : AppColors.lightCard;
    final textCol  = isDark ? AppColors.darkText   : AppColors.lightText;
    final hintCol  = Theme.of(context).disabledColor;   // সিস্টেমের গ্রে

    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: CustomAppBar(title: "সকল বুকমার্ক"),
      body: GetBuilder<BookmarkController>(builder: (bookmarkController) {
        // 🔹 খালি লিস্ট হলে—
        if (bookmarkController.bookmarks.isEmpty) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.menu_book_sharp, size: 96, color: hintCol),
                const SizedBox(height: 20),
                Text('কোন বুকমার্ক নেই',
                    style: TextStyle(fontSize: 22, color: hintCol, fontWeight: FontWeight.bold)),
                const SizedBox(height: 8),
                Text('এখানে দেখার জন্য কিছু যোগ করুন',
                    style: TextStyle(fontSize: 16, color: hintCol)),
              ],
            ),
          );
        }

        // 🔹 বুকমার্ক লিস্ট দেখানো—
        return ListView.builder(
          itemCount: bookmarkController.bookmarks.length,
          itemBuilder: (context, index) {
            final bookmark = bookmarkController.bookmarks[index];

            return Card(
              color: cardBg,
              margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              elevation: 3,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
              child: ListTile(
                leading: Icon(Icons.book, color: Theme.of(context).primaryColor),
                title: Text(bookmark.title,
                    style: TextStyle(fontWeight: FontWeight.bold, color: textCol)),
                onTap: () {
                  Get.to(() => BandanaDetailScreen(
                    content: bookmark.title,
                    fileName: bookmark.fileName,
                  ));
                },
                trailing: IconButton(
                  icon: const Icon(Icons.delete, color: Colors.redAccent),
                  onPressed: (){
                    bookmarkController.removeBookmark(bookmark.fileName);
                    Get.snackbar(
                      'সফলভাবে মুছে ফেলা হয়েছে',
                      'এই পেজটি বুকমার্ক থেকে মুছে ফেলা হয়েছে।',
                      snackPosition: SnackPosition.BOTTOM,
                      backgroundColor: Colors.blueGrey,
                      colorText: Colors.white,
                      duration: const Duration(seconds: 2),
                    );
                  },
                ),
              ),
            );
          },
        );
      }),
    );
  }
}
