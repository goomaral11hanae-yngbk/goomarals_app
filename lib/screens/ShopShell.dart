import 'package:flutter/material.dart';

import '../models/shop_product.dart';
import 'AccountScreen.dart';
import 'CartSummaryScreen.dart';
import 'HomeScreen.dart';
import 'WishlistScreen.dart';

class ShopShell extends StatefulWidget {
  const ShopShell({super.key});

  @override
  State<ShopShell> createState() => _ShopShellState();
}

class _ShopShellState extends State<ShopShell> {
  int _currentIndex = 0;

  final List<ShopProduct> _products = const [
    ShopProduct(
      id: 'ring-1',
      name: 'Celeste Diamond Ring',
      imageUrl: 'assets/images/CH_2_ring.jpg',
      category: 'Rings',
      price: 199.0,
      description:
          'A bright everyday ring with a slim polished band and a center stone that catches light from every angle.',
      material: '18K Gold',
      weight: '2.5 g',
      rating: 4.8,
      reviewCount: 126,
    ),
    ShopProduct(
      id: 'necklace-1',
      name: 'Aurora Gold Necklace',
      imageUrl: 'assets/images/SW_necklace.jpg',
      category: 'Necklaces',
      price: 249.0,
      description:
          'A soft statement necklace designed to layer beautifully with both evening and everyday looks.',
      material: 'Gold Plated Silver',
      weight: '4.1 g',
      rating: 4.9,
      reviewCount: 98,
    ),
    ShopProduct(
      id: 'bracelet-1',
      name: 'Moonlight Bracelet',
      imageUrl: 'assets/images/CH_bracelet.jpg',
      category: 'Bracelets',
      price: 159.0,
      description:
          'A refined bracelet with a fluid silhouette and a comfortable fit for all-day wear.',
      material: 'Sterling Silver',
      weight: '3.6 g',
      rating: 4.7,
      reviewCount: 81,
    ),
    ShopProduct(
      id: 'earring-1',
      name: 'Pearl Drop Earrings',
      imageUrl: 'assets/images/D_2_earrings.jpg',
      category: 'Earrings',
      price: 179.0,
      description:
          'Classic pearl drops updated with a clean modern setting for special dinners and gifts.',
      material: 'Pearl and Silver',
      weight: '2.0 g',
      rating: 4.8,
      reviewCount: 144,
    ),
    ShopProduct(
      id: 'earring-2',
      name: 'YSL Crystal Studs',
      imageUrl: 'assets/images/YSL_earrings.jpg',
      category: 'Earrings',
      price: 139.0,
      description:
          'Compact crystal studs with a polished edge that bring subtle sparkle to minimal outfits.',
      material: 'Crystal Alloy',
      weight: '1.6 g',
      rating: 4.6,
      reviewCount: 67,
    ),
    ShopProduct(
      id: 'necklace-2',
      name: 'Royal Layer Necklace',
      imageUrl: 'assets/images/D_necklace.jpg',
      category: 'Necklaces',
      price: 289.0,
      description:
          'A layered necklace with elegant movement and a rich finish that dresses up simple silhouettes.',
      material: '24K Gold',
      weight: '4.8 g',
      rating: 4.9,
      reviewCount: 212,
    ),
    ShopProduct(
      id: 'bracelet-2',
      name: 'Swan Tennis Bracelet',
      imageUrl: 'assets/images/SW_2_bracelet.jpg',
      category: 'Bracelets',
      price: 219.0,
      description:
          'A luminous tennis bracelet with evenly set stones and a slim clasp for a secure feel.',
      material: 'Rhodium Finish',
      weight: '3.2 g',
      rating: 4.8,
      reviewCount: 119,
    ),
    ShopProduct(
      id: 'ring-2',
      name: 'Chateau Signature Ring',
      imageUrl: 'assets/images/CH_earrings.jpg',
      category: 'Rings',
      price: 169.0,
      description:
          'A sculpted signature ring with a bold profile that still feels lightweight on the hand.',
      material: 'Rose Gold',
      weight: '2.8 g',
      rating: 4.5,
      reviewCount: 53,
    ),
  ];

  final Set<String> _wishlistIds = <String>{};
  final List<ShopProduct> _cartItems = <ShopProduct>[];

  void _toggleWishlist(ShopProduct product) {
    setState(() {
      if (_wishlistIds.contains(product.id)) {
        _wishlistIds.remove(product.id);
      } else {
        _wishlistIds.add(product.id);
      }
    });
  }

  void _addToCart(ShopProduct product, {int quantity = 1}) {
    setState(() {
      for (var i = 0; i < quantity; i++) {
        _cartItems.add(product);
      }
    });
  }

  void _removeFromCart(ShopProduct product) {
    setState(() {
      _cartItems.remove(product);
    });
  }

  void _openTab(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final wishlistProducts = _products
        .where((product) => _wishlistIds.contains(product.id))
        .toList();

    final pages = [
      HomeScreen(
        products: _products,
        wishlistIds: _wishlistIds,
        cartCount: _cartItems.length,
        onToggleWishlist: _toggleWishlist,
        onAddToCart: _addToCart,
        onNavigateToTab: _openTab,
      ),
      WishlistScreen(
        wishlistProducts: wishlistProducts,
        onOpenHome: () => _openTab(0),
        onToggleWishlist: _toggleWishlist,
        onAddToCart: _addToCart,
      ),
      CartSummaryScreen(
        cartItems: _cartItems,
        onRemove: _removeFromCart,
      ),
      AccountScreen(cartCount: _cartItems.length),
    ];

    return Scaffold(
      backgroundColor: _currentIndex == 0
          ? const Color(0xFF0F0F0F)
          : const Color(0xFFF6F2EA),
      body: SafeArea(child: pages[_currentIndex]),
      bottomNavigationBar: NavigationBar(
        height: 72,
        backgroundColor: Colors.white,
        indicatorColor: const Color(0xFFF2E8D5),
        selectedIndex: _currentIndex,
        onDestinationSelected: _openTab,
        destinations: [
          const NavigationDestination(
            icon: Icon(Icons.home_outlined),
            selectedIcon: Icon(Icons.home),
            label: 'Home',
          ),
          NavigationDestination(
            icon: Badge.count(
              count: _wishlistIds.length,
              isLabelVisible: _wishlistIds.isNotEmpty,
              child: const Icon(Icons.favorite_border),
            ),
            selectedIcon: Badge.count(
              count: _wishlistIds.length,
              isLabelVisible: _wishlistIds.isNotEmpty,
              child: const Icon(Icons.favorite),
            ),
            label: 'Wishlist',
          ),
          NavigationDestination(
            icon: Badge.count(
              count: _cartItems.length,
              isLabelVisible: _cartItems.isNotEmpty,
              child: const Icon(Icons.shopping_bag_outlined),
            ),
            selectedIcon: Badge.count(
              count: _cartItems.length,
              isLabelVisible: _cartItems.isNotEmpty,
              child: const Icon(Icons.shopping_bag),
            ),
            label: 'Cart',
          ),
          const NavigationDestination(
            icon: Icon(Icons.person_outline),
            selectedIcon: Icon(Icons.person),
            label: 'Account',
          ),
        ],
      ),
    );
  }
}
