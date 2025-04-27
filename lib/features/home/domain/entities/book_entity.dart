class BookEntity {
  final int bookId;
  final String image;
  final String bookTitle;
  final String author;
  final String summary;

  BookEntity({
    required this.bookId,
    required this.image,
    required this.bookTitle,
    required this.author,
    required this.summary,
  });

  factory BookEntity.fromJson(Map<String, dynamic> json) {
    return BookEntity(
      bookId: json['id'],
      image: json['image'],
      bookTitle: json['title'],
      author: json['authors'][0]['name'],
      summary: json['summaries'][0],
    );
  }
}
