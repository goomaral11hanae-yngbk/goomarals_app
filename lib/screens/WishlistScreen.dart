import 'package:flutter/material.dart';

import '../models/shop_product.dart';

class WishlistScreen extends StatelessWidget {
  const WishlistScreen({
    super.key,
    required this.wishlistProducts,
    required this.onOpenHome,
    required this.onToggleWishlist,
    required this.onAddToCart,
  });

  final List<ShopProduct> wishlistProducts;
  final VoidCallback onOpenHome;
  final ValueChanged<ShopProduct> onToggleWishlist;
  final ValueChanged<ShopProduct> onAddToCart;

  @override
  Widget build(BuildContext context) {
    if (wishlistProducts.isEmpty) {
      return Center(
        child: Padding(
          padding: const EdgeInsets.all(28),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const CircleAvatar(
                radius: 36,
                backgroundColor: Color(0xFFF2E8D5),
                child: Icon(
                  Icons.favorite_border,
                  size: 34,
                  color: Color(0xFF8E6A3E),
                ),
              ),
              const SizedBox(height: 20),
              const Text(
                'Your wishlist is waiting',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              const Text(
                'Save the pieces you want to revisit and they will appear here.',
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.black54, height: 1.5),
              ),
              const SizedBox(height: 18),
              ElevatedButton(
                onPressed: onOpenHome,
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFB08D57),
                  foregroundColor: Colors.black,
                ),
                child: const Text('Browse collection'),
              ),
            ],
          ),
        ),
      );
    }

    return ListView(
      padding: const EdgeInsets.all(20),
      children: [
        const Text(
          'Wishlist',
          style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 8),
        const Text(
          'Saved pieces ready whenever you are.',
          style: TextStyle(color: Colors.black54),
        ),
        const SizedBox(height: 18),
        ...wishlistProducts.map(
          (product) => Container(
            margin: const EdgeInsets.only(bottom: 14),
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(24),
            ),
            child: Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(18),
                  child: Image.asset(
                    product.imageUrl,
                    width: 90,
                    height: 90,
                    fit: BoxFit.cover,
                  ),
                ),
                const SizedBox(width: 14),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        product.name,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                      const SizedBox(height: 6),
                      Text(
                        product.category,
                        style: const TextStyle(color: Colors.black54),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        '\$${product.price.toStringAsFixed(2)}',
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Color(0xFFB08D57),
                        ),
                      ),
                    ],
                  ),
                ),
                Column(
                  children: [
                    IconButton(
                      onPressed: () => onToggleWishlist(product),
                      icon: const Icon(Icons.favorite, color: Colors.pink),
                    ),
                    TextButton(
                      onPressed: () => onAddToCart(product),
                      child: const Text('Add'),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
