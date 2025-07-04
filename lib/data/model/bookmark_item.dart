class BookmarkItem {
  final String fileName;
  final String title;

  BookmarkItem({required this.fileName, required this.title});

  Map<String, dynamic> toMap() {
    return {
      'fileName': fileName,
      'title': title,
    };
  }

  factory BookmarkItem.fromMap(Map<String, dynamic> map) {
    return BookmarkItem(
      fileName: map['fileName'],
      title: map['title'],
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
          other is BookmarkItem &&
              runtimeType == other.runtimeType &&
              fileName == other.fileName;

  @override
  int get hashCode => fileName.hashCode;
}
