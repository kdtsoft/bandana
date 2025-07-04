import 'package:get/get.dart';
import '../../data/database_helper.dart';
import '../../data/model/bookmark_item.dart';

class BookmarkController extends GetxController {
  final DatabaseHelper _dbHelper = DatabaseHelper();

  final RxList<BookmarkItem> bookmarks = <BookmarkItem>[].obs;

  @override
  void onInit() {
    super.onInit();
    _loadBookmarks();
  }

  Future<void> _loadBookmarks() async {
    final List<BookmarkItem> savedBookmarks = await _dbHelper.getBookmarks();
    bookmarks.assignAll(savedBookmarks);
  }

  Future<void> addBookmark(BookmarkItem item) async {
    if (!bookmarks.contains(item)) {
      bookmarks.add(item);
      await _dbHelper.addBookmark(item);
    }
  }

  Future<void> removeBookmark(String fileName) async {
    bookmarks.removeWhere((element) => element.fileName == fileName);
    await _dbHelper.removeBookmark(fileName);
  }

  bool isBookmarked(String fileName) {
    return bookmarks.any((element) => element.fileName == fileName);
  }
}
