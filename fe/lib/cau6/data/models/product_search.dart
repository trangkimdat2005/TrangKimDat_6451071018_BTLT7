class ProductSearch {
  final int id;
  final String title;
  final double price;
  final String description;
  final String category;
  final String image;

  ProductSearch({
    required this.id,
    required this.title,
    required this.price,
    required this.description,
    required this.category,
    required this.image,
  });

  factory ProductSearch.fromJson(Map<String, dynamic> json) {
    return ProductSearch(
      id: json['id'] ?? 0,
      title: json['title'] ?? '',
      price: (json['price'] ?? 0).toDouble(),
      description: json['description'] ?? '',
      category: json['category'] ?? '',
      image: json['thumbnail'] ?? json['image'] ?? '',
    );
  }
}
