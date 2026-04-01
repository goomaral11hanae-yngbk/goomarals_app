import 'package:flutter/material.dart';

import '../models/shop_product.dart';
import 'ProductDetailScreen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({
    super.key,
    required this.products,
    required this.wishlistIds,
    required this.cartCount,
    required this.onToggleWishlist,
    required this.onAddToCart,
    required this.onNavigateToTab,
  });

  final List<ShopProduct> products;
  final Set<String> wishlistIds;
  final int cartCount;
  final ValueChanged<ShopProduct> onToggleWishlist;
  final ValueChanged<ShopProduct> onAddToCart;
  final ValueChanged<int> onNavigateToTab;

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String selectedCategory = 'All';

  List<String> get categories {
    final names = widget.products
        .map((product) => product.category)
        .toSet()
        .toList()
      ..sort();
    return ['All', ...names];
  }

  @override
  Widget build(BuildContext context) {
    final filteredProducts = selectedCategory == 'All'
        ? widget.products
        : widget.products
            .where((product) => product.category == selectedCategory)
            .toList();

    return Scaffold(
      backgroundColor: const Color(0xFF0F0F0F),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Holiday Collection',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 4),
                    Text(
                      'Find your next signature piece',
                      style: TextStyle(color: Colors.white70),
                    ),
                  ],
                ),
                Row(
                  children: [
                    _headerButton(
                      icon: Icons.favorite_border,
                      badgeCount: widget.wishlistIds.length,
                      onTap: () => widget.onNavigateToTab(1),
                    ),
                    const SizedBox(width: 10),
                    _headerButton(
                      icon: Icons.shopping_bag_outlined,
                      badgeCount: widget.cartCount,
                      onTap: () => widget.onNavigateToTab(2),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView(
              padding: const EdgeInsets.only(bottom: 24),
              children: [
                Container(
                  height: 240,
                  margin: const EdgeInsets.symmetric(horizontal: 20),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    image: const DecorationImage(
                      image: AssetImage('assets/images/SW_bracelet.jpg'),
                      fit: BoxFit.cover,
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withValues(alpha: 0.6),
                        blurRadius: 22,
                        offset: const Offset(0, 12),
                      ),
                    ],
                  ),
                  child: Container(
                    padding: const EdgeInsets.all(22),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      gradient: LinearGradient(
                        begin: Alignment.bottomCenter,
                        end: Alignment.topCenter,
                        colors: [
                          Colors.black.withValues(alpha: 0.75),
                          Colors.transparent,
                        ],
                      ),
                    ),
                    alignment: Alignment.bottomLeft,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Shine This Holiday Season',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 28,
                            fontWeight: FontWeight.bold,
                            height: 1.15,
                          ),
                        ),
                        const SizedBox(height: 10),
                        const Text(
                          'Curated gifts, radiant finishes, and timeless styles.',
                          style: TextStyle(
                            color: Colors.white70,
                            height: 1.5,
                          ),
                        ),
                        const SizedBox(height: 16),
                        ElevatedButton(
                          onPressed: () {
                            setState(() {
                              selectedCategory = 'All';
                            });
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text('Showing the full gift collection.'),
                              ),
                            );
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFFB08D57),
                            foregroundColor: Colors.black,
                            padding: const EdgeInsets.symmetric(
                              horizontal: 24,
                              vertical: 12,
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30),
                            ),
                          ),
                          child: const Text(
                            'Shop gifts',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 24),
                SizedBox(
                  height: 44,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    itemCount: categories.length,
                    itemBuilder: (context, index) {
                      final cat = categories[index];
                      final selected = cat == selectedCategory;

                      return GestureDetector(
                        onTap: () {
                          setState(() {
                            selectedCategory = cat;
                          });
                        },
                        child: AnimatedContainer(
                          duration: const Duration(milliseconds: 250),
                          margin: const EdgeInsets.only(right: 12),
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          decoration: BoxDecoration(
                            color: selected
                                ? const Color(0xFFB08D57)
                                : Colors.white.withValues(alpha: 0.12),
                            borderRadius: BorderRadius.circular(30),
                          ),
                          child: Center(
                            child: Text(
                              cat,
                              style: TextStyle(
                                color: selected ? Colors.black : Colors.white70,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
                const SizedBox(height: 18),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Popular pieces',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      TextButton(
                        onPressed: () => widget.onNavigateToTab(1),
                        child: const Text(
                          'See wishlist',
                          style: TextStyle(color: Color(0xFFB08D57)),
                        ),
                      ),
                    ],
                  ),
                ),
                GridView.builder(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: filteredProducts.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 18,
                    crossAxisSpacing: 18,
                    childAspectRatio: 0.6,
                  ),
                  itemBuilder: (context, index) {
                    final product = filteredProducts[index];
                    final isFavorite = widget.wishlistIds.contains(product.id);

                    return GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => ProductDetailScreen(
                              product: product,
                              isFavorite: isFavorite,
                              onToggleFavorite: () {
                                widget.onToggleWishlist(product);
                                setState(() {});
                              },
                              onAddToCart: (quantity) {
                                for (var i = 0; i < quantity; i++) {
                                  widget.onAddToCart(product);
                                }
                              },
                            ),
                          ),
                        ).then((_) => setState(() {}));
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(26),
                          image: DecorationImage(
                            image: AssetImage(product.imageUrl),
                            fit: BoxFit.cover,
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withValues(alpha: 0.6),
                              blurRadius: 16,
                              offset: const Offset(0, 10),
                            ),
                          ],
                        ),
                        child: Container(
                          padding: const EdgeInsets.all(14),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(26),
                            gradient: LinearGradient(
                              begin: Alignment.bottomCenter,
                              end: Alignment.topCenter,
                              colors: [
                                Colors.black.withValues(alpha: 0.78),
                                Colors.transparent,
                              ],
                            ),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Align(
                                alignment: Alignment.topRight,
                                child: IconButton.filledTonal(
                                  onPressed: () {
                                    widget.onToggleWishlist(product);
                                    setState(() {});
                                  },
                                  style: IconButton.styleFrom(
                                    backgroundColor:
                                        Colors.white.withValues(alpha: 0.22),
                                  ),
                                  icon: Icon(
                                    isFavorite
                                        ? Icons.favorite
                                        : Icons.favorite_border,
                                    color: isFavorite
                                        ? Colors.pink
                                        : Colors.white,
                                  ),
                                ),
                              ),
                              const Spacer(),
                              Text(
                                product.name,
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15,
                                ),
                              ),
                              const SizedBox(height: 4),
                              Text(
                                product.category,
                                style: const TextStyle(color: Colors.white70),
                              ),
                              const SizedBox(height: 8),
                              Row(
                                children: [
                                  Expanded(
                                    child: Text(
                                      '\$${product.price.toStringAsFixed(0)}',
                                      style: const TextStyle(
                                        color: Color(0xFFB08D57),
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16,
                                      ),
                                    ),
                                  ),
                                  IconButton(
                                    onPressed: () {
                                      widget.onAddToCart(product);
                                      ScaffoldMessenger.of(context).showSnackBar(
                                        SnackBar(
                                          content: Text(
                                            '${product.name} added to cart.',
                                          ),
                                        ),
                                      );
                                    },
                                    icon: const Icon(
                                      Icons.add_shopping_cart,
                                      color: Colors.white,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _headerButton({
    required IconData icon,
    required int badgeCount,
    required VoidCallback onTap,
  }) {
    return Badge.count(
      count: badgeCount,
      isLabelVisible: badgeCount > 0,
      child: IconButton.filledTonal(
        onPressed: onTap,
        style: IconButton.styleFrom(
          backgroundColor: Colors.white.withValues(alpha: 0.12),
        ),
        icon: Icon(icon, color: Colors.white),
      ),
    );
  }
}
