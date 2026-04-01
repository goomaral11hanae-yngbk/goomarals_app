import 'package:flutter/material.dart';

import '../models/shop_product.dart';

class CartSummaryScreen extends StatelessWidget {
  const CartSummaryScreen({
    super.key,
    required this.cartItems,
    required this.onRemove,
  });

  final List<ShopProduct> cartItems;
  final ValueChanged<ShopProduct> onRemove;

  @override
  Widget build(BuildContext context) {
    final total = cartItems.fold<double>(
      0,
      (sum, item) => sum + item.price,
    );

    if (cartItems.isEmpty) {
      return const _EmptyState(
        icon: Icons.shopping_bag_outlined,
        title: 'Your cart is empty',
        subtitle: 'Add a few pieces you love and they will show up here.',
      );
    }

    return Column(
      children: [
        Expanded(
          child: ListView.separated(
            padding: const EdgeInsets.all(20),
            itemCount: cartItems.length,
            separatorBuilder: (_, __) => const SizedBox(height: 12),
            itemBuilder: (context, index) {
              final item = cartItems[index];
              return Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(22),
                ),
                child: Row(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(18),
                      child: Image.asset(
                        item.imageUrl,
                        width: 84,
                        height: 84,
                        fit: BoxFit.cover,
                      ),
                    ),
                    const SizedBox(width: 14),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            item.name,
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                          const SizedBox(height: 6),
                          Text(
                            item.category,
                            style: const TextStyle(color: Colors.black54),
                          ),
                          const SizedBox(height: 10),
                          Text(
                            '\$${item.price.toStringAsFixed(2)}',
                            style: const TextStyle(
                              color: Color(0xFFB08D57),
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                    IconButton(
                      onPressed: () => onRemove(item),
                      icon: const Icon(Icons.delete_outline),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
        Container(
          padding: const EdgeInsets.fromLTRB(20, 18, 20, 24),
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.vertical(top: Radius.circular(28)),
          ),
          child: Column(
            children: [
              _SummaryRow(label: 'Items', value: cartItems.length.toString()),
              const SizedBox(height: 8),
              const _SummaryRow(label: 'Shipping', value: 'Free'),
              const SizedBox(height: 8),
              _SummaryRow(
                label: 'Total',
                value: '\$${total.toStringAsFixed(2)}',
                isEmphasized: true,
              ),
              const SizedBox(height: 18),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Checkout flow coming next.')),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFFB08D57),
                    foregroundColor: Colors.black,
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  child: const Text(
                    'Proceed to checkout',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _SummaryRow extends StatelessWidget {
  const _SummaryRow({
    required this.label,
    required this.value,
    this.isEmphasized = false,
  });

  final String label;
  final String value;
  final bool isEmphasized;

  @override
  Widget build(BuildContext context) {
    final style = TextStyle(
      fontSize: isEmphasized ? 18 : 15,
      fontWeight: isEmphasized ? FontWeight.bold : FontWeight.w500,
      color: isEmphasized ? Colors.black : Colors.black87,
    );

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(label, style: style),
        Text(value, style: style),
      ],
    );
  }
}

class _EmptyState extends StatelessWidget {
  const _EmptyState({
    required this.icon,
    required this.title,
    required this.subtitle,
  });

  final IconData icon;
  final String title;
  final String subtitle;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(32),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            CircleAvatar(
              radius: 34,
              backgroundColor: const Color(0xFFF2E8D5),
              child: Icon(icon, color: const Color(0xFF8E6A3E), size: 34),
            ),
            const SizedBox(height: 20),
            Text(
              title,
              style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Text(
              subtitle,
              textAlign: TextAlign.center,
              style: const TextStyle(color: Colors.black54, height: 1.5),
            ),
          ],
        ),
      ),
    );
  }
}
