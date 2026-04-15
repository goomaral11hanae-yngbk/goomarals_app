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
      id: 'earring-3',
      name: 'Chateau Signature Earrings',
      imageUrl: 'assets/images/CH_earrings.jpg',
      category: 'Earrings',
      price: 169.0,
      description:
          'Sculpted statement earrings with a polished finish that still feel light enough for long wear.',
      material: 'Rose Gold',
      weight: '2.8 g',
      rating: 4.5,
      reviewCount: 53,
    ),
    ShopProduct(
      id: 'earring-4',
      name: 'Chateau Petite Earrings',
      imageUrl: 'assets/images/ch_2_earrings.jpg',
      category: 'Earrings',
      price: 149.0,
      description:
          'A smaller pair of sparkling earrings designed for everyday shine with a neat, elegant profile.',
      material: 'Gold Vermeil',
      weight: '1.9 g',
      rating: 4.7,
      reviewCount: 72,
    ),
    ShopProduct(
      id: 'necklace-3',
      name: 'Dahlia Pendant Necklace',
      imageUrl: 'assets/images/D_2_nacklace.jpg',
      category: 'Necklaces',
      price: 229.0,
      description:
          'A graceful pendant necklace with a warm metallic tone that layers beautifully with shorter chains.',
      material: 'Gold Plated Brass',
      weight: '4.0 g',
      rating: 4.6,
      reviewCount: 88,
    ),
    ShopProduct(
      id: 'bracelet-3',
      name: 'Dahlia Chain Bracelet',
      imageUrl: 'assets/images/D_bracelet.jpg',
      category: 'Bracelets',
      price: 149.0,
      description:
          'A polished chain bracelet with gentle shine and flexible links for a comfortable daily fit.',
      material: '18K Gold Plated',
      weight: '3.1 g',
      rating: 4.5,
      reviewCount: 61,
    ),
    ShopProduct(
      id: 'earring-5',
      name: 'Dahlia Stud Earrings',
      imageUrl: 'assets/images/D_earrings.jpg',
      category: 'Earrings',
      price: 129.0,
      description:
          'Bright, easy-to-style stud earrings that bring a clean sparkle to both office and evening looks.',
      material: 'Crystal and Alloy',
      weight: '1.5 g',
      rating: 4.4,
      reviewCount: 57,
    ),
    ShopProduct(
      id: 'bracelet-4',
      name: 'Swan Glow Bracelet',
      imageUrl: 'assets/images/SW_bracelet.jpg',
      category: 'Bracelets',
      price: 189.0,
      description:
          'A sleek bracelet with a luminous finish that works as a stand-alone piece or stacked with bangles.',
      material: 'Silver Tone',
      weight: '3.4 g',
      rating: 4.8,
      reviewCount: 104,
    ),
    ShopProduct(
      id: 'necklace-4',
      name: 'Swan Layered Necklace',
      imageUrl: 'assets/images/SW_2_necklace.jpg',
      category: 'Necklaces',
      price: 269.0,
      description:
          'A layered necklace with refined drape and subtle sparkle for elevated day-to-night styling.',
      material: 'Rhodium Plated',
      weight: '4.5 g',
      rating: 4.9,
      reviewCount: 136,
    ),
    ShopProduct(
      id: 'necklace-5',
      name: 'Swan Statement Necklace',
      imageUrl: 'assets/images/SW_necklace (2).jpg',
      category: 'Necklaces',
      price: 279.0,
      description:
          'A bolder necklace silhouette with elegant shine, ideal for dresses, tailoring, and special events.',
      material: 'Crystal and Silver Tone',
      weight: '4.9 g',
      rating: 4.7,
      reviewCount: 93,
    ),
    ShopProduct(
      id: 'ring-2',
      name: 'Chateau Halo Ring',
      imageUrl: 'assets/images/ring_halo_1.jpg',
      category: 'Rings',
      price: 209.0,
      description:
          'A refined halo ring with a slim shank and bright center detail for an elevated everyday look.',
      material: '18K Rose Gold',
      weight: '2.6 g',
      rating: 4.7,
      reviewCount: 84,
    ),
    ShopProduct(
      id: 'ring-3',
      name: 'Celeste Promise Ring',
      imageUrl: 'assets/images/ring_sparkle_1.jpg',
      category: 'Rings',
      price: 189.0,
      description:
          'A delicate promise ring with graceful sparkle and a polished finish that feels timeless.',
      material: 'Gold Plated Silver',
      weight: '2.3 g',
      rating: 4.6,
      reviewCount: 71,
    ),
    ShopProduct(
      id: 'ring-4',
      name: 'Aurora Solitaire Ring',
      imageUrl: 'assets/images/ring_gem_1.jpg',
      category: 'Rings',
      price: 219.0,
      description:
          'A classic solitaire silhouette with a clean profile designed to shine on its own or stacked.',
      material: 'Sterling Silver',
      weight: '2.7 g',
      rating: 4.8,
      reviewCount: 110,
    ),
    ShopProduct(
      id: 'bracelet-5',
      name: 'Chateau Link Bracelet',
      imageUrl: 'assets/images/bracelet_display_1.jpg',
      category: 'Bracelets',
      price: 169.0,
      description:
          'A polished link bracelet with soft curves and a neat clasp for easy day-to-evening styling.',
      material: 'Rose Gold Finish',
      weight: '3.5 g',
      rating: 4.6,
      reviewCount: 66,
    ),
    ShopProduct(
      id: 'bracelet-6',
      name: 'Dahlia Charm Bracelet',
      imageUrl: 'assets/images/bracelet_satin_1.jpg',
      category: 'Bracelets',
      price: 159.0,
      description:
          'A graceful bracelet with delicate detailing that adds a bright, feminine accent to layered looks.',
      material: '18K Gold Vermeil',
      weight: '3.0 g',
      rating: 4.5,
      reviewCount: 58,
    ),
    ShopProduct(
      id: 'bracelet-7',
      name: 'Swan Crystal Bracelet',
      imageUrl: 'assets/images/bracelet_chain_1.jpg',
      category: 'Bracelets',
      price: 199.0,
      description:
          'A crystal-accent bracelet with fluid shine and a sleek profile that catches light beautifully.',
      material: 'Rhodium Finish',
      weight: '3.3 g',
      rating: 4.8,
      reviewCount: 97,
    ),
    ShopProduct(
      id: 'bracelet-8',
      name: 'Swan Luxe Tennis Bracelet',
      imageUrl: 'assets/images/bracelet_diamond_1.jpg',
      category: 'Bracelets',
      price: 229.0,
      description:
          'A more elevated tennis bracelet with precise stone spacing and a secure, slim closure.',
      material: 'Platinum Tone',
      weight: '3.4 g',
      rating: 4.9,
      reviewCount: 121,
    ),
    ShopProduct(
      id: 'necklace-6',
      name: 'Royal Drop Necklace',
      imageUrl: 'assets/images/necklace_stand_1.jpg',
      category: 'Necklaces',
      price: 299.0,
      description:
          'An elegant drop necklace with graceful movement that frames the neckline with rich shine.',
      material: '24K Gold Plated',
      weight: '5.0 g',
      rating: 4.8,
      reviewCount: 117,
    ),
    ShopProduct(
      id: 'necklace-7',
      name: 'Dahlia Layer Chain',
      imageUrl: 'assets/images/necklace_chain_1.jpg',
      category: 'Necklaces',
      price: 239.0,
      description:
          'A layered chain necklace with a soft golden finish that pairs effortlessly with simple outfits.',
      material: 'Gold Tone Brass',
      weight: '4.2 g',
      rating: 4.6,
      reviewCount: 79,
    ),
    ShopProduct(
      id: 'necklace-8',
      name: 'Swan Crystal Collar',
      imageUrl: 'assets/images/necklace_minimal_1.jpg',
      category: 'Necklaces',
      price: 259.0,
      description:
          'A crystal collar necklace with a balanced silhouette that adds shine without feeling heavy.',
      material: 'Crystal Alloy',
      weight: '4.3 g',
      rating: 4.7,
      reviewCount: 90,
    ),
    ShopProduct(
      id: 'necklace-9',
      name: 'Swan Gala Necklace',
      imageUrl: 'assets/images/necklace_luxe_1.jpg',
      category: 'Necklaces',
      price: 289.0,
      description:
          'A gala-ready necklace with a fuller silhouette and bright reflective accents for special occasions.',
      material: 'Silver Tone Crystal',
      weight: '5.1 g',
      rating: 4.8,
      reviewCount: 108,
    ),
    ShopProduct(
      id: 'necklace-10',
      name: 'Swan Cascade Necklace',
      imageUrl: 'assets/images/necklace_delicate_1.jpg',
      category: 'Necklaces',
      price: 274.0,
      description:
          'A cascading layered necklace with graceful drape and a luminous finish that elevates evening wear.',
      material: 'Rhodium and Crystal',
      weight: '4.6 g',
      rating: 4.9,
      reviewCount: 125,
    ),
    ShopProduct(
      id: 'earring-6',
      name: 'Dahlia Drop Earrings',
      imageUrl: 'assets/images/earrings_gold_1.jpg',
      category: 'Earrings',
      price: 184.0,
      description:
          'A refined drop silhouette with polished shine and soft movement for dinners, gifts, and events.',
      material: 'Pearl and Gold Tone',
      weight: '2.1 g',
      rating: 4.7,
      reviewCount: 86,
    ),
    ShopProduct(
      id: 'earring-7',
      name: 'Dahlia Spark Studs',
      imageUrl: 'assets/images/earrings_jhumka_1.jpg',
      category: 'Earrings',
      price: 134.0,
      description:
          'Compact spark stud earrings designed for easy daily wear with just the right amount of shine.',
      material: 'Crystal and Silver Tone',
      weight: '1.4 g',
      rating: 4.5,
      reviewCount: 63,
    ),
    ShopProduct(
      id: 'earring-8',
      name: 'Chateau Evening Earrings',
      imageUrl: 'assets/images/earrings_gem_1.jpg',
      category: 'Earrings',
      price: 174.0,
      description:
          'An evening pair with sculpted lines and bright accents that dress up minimalist outfits instantly.',
      material: 'Rose Gold Alloy',
      weight: '2.6 g',
      rating: 4.6,
      reviewCount: 69,
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
