class Product {
  final int id;
  final String title;
  final String category;
  final String description;
  final double price;
  final String image;

  Product(
      {required this.id,
      required this.title,
      required this.category,
      required this.description,
      required this.price,
      required this.image});

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'] as int,
      title: json['title'] as String,
      category: json['category'] as String,
      description: json['description'] as String,
      price: json['price'].toDouble(),
      image: json['image'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'category': category,
      'description': description,
      'price': price,
      'image': image,
    };
  }
}
