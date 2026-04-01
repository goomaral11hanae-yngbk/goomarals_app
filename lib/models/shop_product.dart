class ShopProduct {
  const ShopProduct({
    required this.id,
    required this.name,
    required this.imageUrl,
    required this.category,
    required this.price,
    required this.description,
    required this.material,
    required this.weight,
    required this.rating,
    required this.reviewCount,
  });

  final String id;
  final String name;
  final String imageUrl;
  final String category;
  final double price;
  final String description;
  final String material;
  final String weight;
  final double rating;
  final int reviewCount;
}
