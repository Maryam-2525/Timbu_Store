class Product {
  final String name;
  final double price;
  final List<String> images;
  final String description;
  final List<String> categories;

  Product({
    required this.name,
    required this.price,
    required this.images,
    required this.description,
    required this.categories,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    // Extract prices and convert them to a single value, assuming NGN prices are provided.
    final List<dynamic> priceList = json['current_price'][0]['NGN'];
    final double price = priceList.isNotEmpty ? priceList[0] : 0.0;

    // Extract image URLs
    final List<String> images = (json['photos'] as List<dynamic>)
        .map((photo) => photo['url'] as String)
        .toList();

    // Extract category names
    final List<String> categories = (json['categories'] as List<dynamic>)
        .map((category) => category['name'] as String)
        .toList();

    return Product(
      name: json['name'],
      price: price,
      images: images,
      description: json['description'],
      categories: categories,
    );
  }
}
