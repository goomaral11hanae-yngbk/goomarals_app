import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../constants.dart';
import '../models/shop_product.dart';
import '../widgets/CustomButton.dart';

class ProductDetailScreen extends StatefulWidget {
  const ProductDetailScreen({
    super.key,
    required this.product,
    required this.isFavorite,
    required this.onToggleFavorite,
    required this.onAddToCart,
  });

  final ShopProduct product;
  final bool isFavorite;
  final VoidCallback onToggleFavorite;
  final ValueChanged<int> onAddToCart;

  @override
  State<ProductDetailScreen> createState() => _ProductDetailScreenState();
}

class _ProductDetailScreenState extends State<ProductDetailScreen> {
  int _selectedSize = 18;
  int _quantity = 1;
  late bool _isFavorite;

  @override
  void initState() {
    super.initState();
    _isFavorite = widget.isFavorite;
  }

  void _addToCart() {
    widget.onAddToCart(_quantity);
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('${widget.product.name} added to your cart.'),
        backgroundColor: AppConstants.primaryColor,
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(14),
        ),
      ),
    );
  }

  void _toggleFavorite() {
    setState(() => _isFavorite = !_isFavorite);
    widget.onToggleFavorite();

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          _isFavorite
              ? '${widget.product.name} saved to wishlist.'
              : '${widget.product.name} removed from wishlist.',
        ),
        backgroundColor: _isFavorite ? Colors.pink : Colors.grey,
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(14),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _circleButton(
                    icon: Iconsax.arrow_left,
                    onTap: () => Navigator.pop(context),
                  ),
                  _circleButton(
                    iconWidget: AnimatedSwitcher(
                      duration: const Duration(milliseconds: 300),
                      child: Icon(
                        _isFavorite ? Iconsax.heart5 : Iconsax.heart,
                        key: ValueKey<bool>(_isFavorite),
                        color: _isFavorite ? Colors.pink : Colors.black,
                      ),
                    ),
                    onTap: _toggleFavorite,
                  ),
                ],
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Hero(
                      tag: widget.product.imageUrl,
                      child: Container(
                        height: 320,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(22),
                          image: DecorationImage(
                            image: AssetImage(widget.product.imageUrl),
                            fit: BoxFit.cover,
                          ),
                        ),
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(22),
                            gradient: LinearGradient(
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              colors: [
                                Colors.black.withValues(alpha: 0.05),
                                Colors.black.withValues(alpha: 0.35),
                              ],
                            ),
                          ),
                          child: Align(
                            alignment: Alignment.topRight,
                            child: Container(
                              margin: const EdgeInsets.all(12),
                              padding: const EdgeInsets.symmetric(
                                horizontal: 10,
                                vertical: 6,
                              ),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  const Icon(
                                    Iconsax.star1,
                                    color: Colors.amber,
                                    size: 16,
                                  ),
                                  const SizedBox(width: 4),
                                  Text(
                                    widget.product.rating.toStringAsFixed(1),
                                    style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 24),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Text(
                            widget.product.name,
                            style: const TextStyle(
                              fontSize: 26,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Text(
                          '\$${widget.product.price.toStringAsFixed(2)}',
                          style: const TextStyle(
                            fontSize: 26,
                            fontWeight: FontWeight.bold,
                            color: AppConstants.primaryColor,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    Text(
                      widget.product.description,
                      style: const TextStyle(
                        fontSize: 16,
                        height: 1.6,
                        color: Colors.black54,
                      ),
                    ),
                    const SizedBox(height: 28),
                    const Text(
                      'Size',
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                    ),
                    const SizedBox(height: 12),
                    Wrap(
                      spacing: 12,
                      runSpacing: 12,
                      children: [16, 17, 18, 19, 20].map((size) {
                        final selected = _selectedSize == size;
                        return GestureDetector(
                          onTap: () => setState(() => _selectedSize = size),
                          child: AnimatedContainer(
                            duration: const Duration(milliseconds: 250),
                            padding: const EdgeInsets.symmetric(
                              horizontal: 20,
                              vertical: 12,
                            ),
                            decoration: BoxDecoration(
                              color: selected
                                  ? AppConstants.primaryColor
                                  : Colors.grey.shade100,
                              borderRadius: BorderRadius.circular(14),
                              boxShadow: selected
                                  ? [
                                      BoxShadow(
                                        color: AppConstants.primaryColor
                                            .withValues(alpha: 0.4),
                                        blurRadius: 8,
                                        offset: const Offset(0, 4),
                                      ),
                                    ]
                                  : [],
                            ),
                            child: Text(
                              size.toString(),
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: selected ? Colors.white : Colors.black87,
                              ),
                            ),
                          ),
                        );
                      }).toList(),
                    ),
                    const SizedBox(height: 28),
                    const Text(
                      'Quantity',
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                    ),
                    const SizedBox(height: 12),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 12),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(14),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withValues(alpha: 0.05),
                            blurRadius: 8,
                          ),
                        ],
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          IconButton(
                            icon: const Icon(Iconsax.minus),
                            onPressed: () {
                              if (_quantity > 1) {
                                setState(() => _quantity--);
                              }
                            },
                          ),
                          Text(
                            _quantity.toString(),
                            style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          IconButton(
                            icon: const Icon(Iconsax.add),
                            onPressed: () => setState(() => _quantity++),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 28),
                    _detailItem(Iconsax.star, 'Material', widget.product.material),
                    _detailItem(Iconsax.weight, 'Weight', widget.product.weight),
                    _detailItem(
                      Iconsax.shield_tick,
                      'Reviews',
                      '${widget.product.reviewCount}+ verified',
                    ),
                    const SizedBox(height: 18),
                    Row(
                      children: [
                        Expanded(
                          child: OutlinedButton.icon(
                            onPressed: () {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text(
                                    'Styling tips for ${widget.product.name} are on the way.',
                                  ),
                                ),
                              );
                            },
                            icon: const Icon(Icons.auto_awesome_outlined),
                            label: const Text('Style tips'),
                          ),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: OutlinedButton.icon(
                            onPressed: () {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text(
                                    'A gift note was prepared for ${widget.product.name}.',
                                  ),
                                ),
                              );
                            },
                            icon: const Icon(Icons.card_giftcard),
                            label: const Text('Gift option'),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 40),
                  ],
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: 0.1),
                    blurRadius: 12,
                    offset: const Offset(0, -2),
                  ),
                ],
              ),
              child: CustomButton(
                text:
                    'Add to cart • \$${(widget.product.price * _quantity).toStringAsFixed(2)}',
                backgroundColor: AppConstants.primaryColor,
                onPressed: _addToCart,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _circleButton({
    IconData? icon,
    Widget? iconWidget,
    required VoidCallback onTap,
  }) {
    return CircleAvatar(
      backgroundColor: Colors.black.withValues(alpha: 0.08),
      child: IconButton(
        icon: iconWidget ?? Icon(icon, color: Colors.black),
        onPressed: onTap,
      ),
    );
  }

  Widget _detailItem(IconData icon, String title, String value) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.05),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        children: [
          Icon(icon, color: AppConstants.primaryColor),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              title,
              style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
            ),
          ),
          Text(
            value,
            style: const TextStyle(color: Colors.black54),
          ),
        ],
      ),
    );
  }
}
