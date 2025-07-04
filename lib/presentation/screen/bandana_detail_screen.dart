import 'package:dhammapath/presentation/controller/bandana_detail_controller.dart';
import 'package:dhammapath/presentation/controller/bookmark_controller.dart';
import 'package:dhammapath/data/model/bookmark_item.dart';
import 'package:dhammapath/presentation/widgets/custom_drawer.dart';
import 'package:dhammapath/presentation/widgets/drawer_menu_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:dhammapath/presentation/widgets/custom_appbar.dart';

class BandanaDetailScreen extends StatelessWidget {
  final String content;
  final String fileName;

  const BandanaDetailScreen({
    super.key,
    required this.content,
    required this.fileName,
  });

  @override
  Widget build(BuildContext context) {
    final BookmarkController bookmarkController = Get.find<BookmarkController>();

    return GetBuilder<BandanaDetailController>(
      init: BandanaDetailController(fileName),
      builder: (controller) {
        return Scaffold(
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          drawer: CustomDrawer(),
          appBar: CustomAppBar(
            title: content,
            actions: [
              GetBuilder<BookmarkController>(
                builder: (_) => IconButton(
                  icon: Icon(
                    bookmarkController.isBookmarked(fileName)
                        ? Icons.bookmark
                        : Icons.bookmark_border,
                    color: Colors.white,
                  ),
                  onPressed: () {
                    if (bookmarkController.isBookmarked(fileName)) {
                      Get.snackbar(
                        'অলরেডি বুকমার্ক করা আছে!',
                        'এই পেজটি অলরেডি বুকমার্ক করা আছে।',
                        snackPosition: SnackPosition.BOTTOM,
                        backgroundColor: Colors.blueGrey,
                        colorText: Colors.white,
                        duration: const Duration(seconds: 2),
                      );
                    } else {
                      bookmarkController.addBookmark(BookmarkItem(fileName: fileName, title: content));
                      Get.snackbar(
                        'বুকমার্কে যুক্ত হয়েছে!',
                        'এই পেজটি বুকমার্কে যুক্ত করা হয়েছে।',
                        snackPosition: SnackPosition.BOTTOM,
                        backgroundColor: Colors.green,
                        colorText: Colors.white,
                        duration: const Duration(seconds: 2),
                      );
                    }
                  },
                ),
              ),

              DrawerMenuButton(),

            ],
          ),
          body: Stack(
            children: [
              WebViewWidget(controller: controller.webViewController),
              if (controller.isLoading)
                const Center(child: CircularProgressIndicator()),
            ],
          ),
        );
      },
    );
  }
}
