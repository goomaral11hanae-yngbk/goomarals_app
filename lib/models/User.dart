class User {
  final String id;
  final String name;
  final String email;
  final String? profileImageUrl;

  // Favorites and Cart
  List<String> favoriteProductIds;
  Map<String, int> cartItems; // productId -> quantity

  User({
    required this.id,
    required this.name,
    required this.email,
    this.profileImageUrl,
    List<String>? favoriteProductIds,
    Map<String, int>? cartItems,
  })  : favoriteProductIds = favoriteProductIds ?? [],
        cartItems = cartItems ?? {};

  // ----------------- Favorites -----------------
  void addToFavorites(String productId) {
    if (!favoriteProductIds.contains(productId)) {
      favoriteProductIds.add(productId);
    }
  }

  void removeFromFavorites(String productId) {
    favoriteProductIds.remove(productId);
  }

  bool isFavorite(String productId) {
    return favoriteProductIds.contains(productId);
  }

  // ----------------- Cart -----------------
  void addToCart(String productId, [int quantity = 1]) {
    if (cartItems.containsKey(productId)) {
      cartItems[productId] = cartItems[productId]! + quantity;
    } else {
      cartItems[productId] = quantity;
    }
  }

  void removeFromCart(String productId) {
    cartItems.remove(productId);
  }

  void updateCartQuantity(String productId, int quantity) {
    if (quantity <= 0) {
      cartItems.remove(productId);
    } else {
      cartItems[productId] = quantity;
    }
  }

  int getCartQuantity(String productId) {
    return cartItems[productId] ?? 0;
  }

  int get totalCartItems {
    int total = 0;
    cartItems.forEach((_, qty) => total += qty);
    return total;
  }

  double getCartTotal(Map<String, double> productPrices) {
    double total = 0.0;
    cartItems.forEach((productId, qty) {
      final price = productPrices[productId] ?? 0.0;
      total += price * qty;
    });
    return total;
  }

  // ----------------- Convert to Map / JSON -----------------
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'profileImageUrl': profileImageUrl,
      'favoriteProductIds': favoriteProductIds,
      'cartItems': cartItems,
    };
  }

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      id: map['id'],
      name: map['name'],
      email: map['email'],
      profileImageUrl: map['profileImageUrl'],
      favoriteProductIds: List<String>.from(map['favoriteProductIds'] ?? []),
      cartItems: Map<String, int>.from(map['cartItems'] ?? {}),
    );
  }
}

