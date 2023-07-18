
class Book {
  final int id;
  final String title, description;
  final String images;
  final bool isFavorite;

  Book({
    required this.id,
    required this.images,
    this.isFavorite = false,
    required this.title,
    required this.description,
  });
}

List<Book> books = [];
