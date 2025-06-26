import 'package:get/get.dart';

class NavController extends GetxController {
  int selectedIndex = 0;

  void changeTabIndex(int index) {
    selectedIndex = index;
    update(); // GetBuilder এই update কলেই রিফ্রেশ হয়
  }
}
