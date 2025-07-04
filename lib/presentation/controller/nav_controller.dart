import 'package:get/get.dart';

class NavController extends GetxController {
  int selectedIndex = 0;

  void changeTabIndex(int index) {
    selectedIndex = index;
    update();
  }

  void onItemTapped(int index) {
    selectedIndex = index;
    update();
  }
}
