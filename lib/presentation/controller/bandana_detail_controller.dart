import 'package:flutter/services.dart' show rootBundle;
import 'package:get/get.dart';
import 'package:webview_flutter/webview_flutter.dart';

import 'theme_controller.dart';

class BandanaDetailController extends GetxController {
  late final WebViewController webViewController;
  bool isLoading = true;
  String htmlContent = '';
  final String fileName;

  BandanaDetailController(this.fileName);

  // Get an instance of your ThemeController
  final ThemeController _themeController = Get.find<ThemeController>();

  @override
  void onInit() {
    super.onInit();
    webViewController = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setNavigationDelegate(
        NavigationDelegate(
          onPageStarted: (url) => setLoading(true),
          onPageFinished: (url) => setLoading(false),
          onWebResourceError: (error) => setLoading(false),
        ),
      );
    loadHtmlFromAssets();
  }

  void setLoading(bool value) {
    isLoading = value;
    update(); // For GetBuilder
  }

  Future<void> loadHtmlFromAssets() async {
    try {
      final style = await rootBundle.loadString('assets/css/style.css');
      final html = await rootBundle.loadString('assets/html/$fileName');

      // --- Dark Mode Logic ---
      String darkModeStyle = '';
      // Access the value of the RxBool
      if (_themeController.isDarkMode.value) { // <--- Access the .value here
        darkModeStyle = '''
          body {
            background-color: black !important;
            color: white !important;
          }
        ''';
      }
      // --- End Dark Mode Logic ---

      final completeHtml = '''
        <!DOCTYPE html>
        <html lang="bn">
        <head>
          <meta charset="UTF-8">
          <meta name="viewport" content="width=device-width, initial-scale=1.0">
          <style>
            $style
            $darkModeStyle
          </style>
        </head>
        <body>$html</body>
        </html>
      ''';

      htmlContent = completeHtml;
      webViewController.loadHtmlString(completeHtml);
    } catch (e) {
      // Consider adding a more explicit error logging/handling here
      
    }
  }

  @override
  void onReady() {
    super.onReady();
    // Listen for changes in your ThemeController's `isDarkMode` RxBool.
    // The callback will be triggered whenever _themeController.isDarkMode.value changes.
    ever(_themeController.isDarkMode, (_) { // <--- CHANGE IS HERE
      loadHtmlFromAssets();
    });
  }
}