import 'package:dhammapath/presentation/controller/bookmark_controller.dart';
import 'package:dhammapath/presentation/controller/nav_controller.dart';

import 'package:get/get.dart';

class InitialBindings extends Bindings {
  @override
  void dependencies() {
    
    Get.lazyPut(() => NavController());
    Get.put(BookmarkController());
  }
}