import 'package:dhammapath/data/database_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:intl/date_symbol_data_local.dart';

import 'app/app.dart';
import 'presentation/controller/theme_controller.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initializeDateFormatting('bn_BD', null);
  await DatabaseHelper().database;
  Get.put(ThemeController());
  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle(
      statusBarColor: Get.find<ThemeController>().isDarkMode.value ? Colors.white : Colors.teal,
      statusBarIconBrightness: Get.find<ThemeController>().isDarkMode.value ? Brightness.light : Brightness.dark,
      statusBarBrightness: Get.find<ThemeController>().isDarkMode.value ? Brightness.light : Brightness.dark,
      systemNavigationBarColor: Colors.black,
      systemNavigationBarIconBrightness: Brightness.light,
    ),
  );

  runApp(const BandanaApp());
}