import 'package:flutter/material.dart';

class AccountScreen extends StatelessWidget {
  const AccountScreen({super.key, required this.cartCount});

  final int cartCount;

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(20),
      children: [
        Container(
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: const Color(0xFF1A1A1A),
            borderRadius: BorderRadius.circular(28),
          ),
          child: const Row(
            children: [
              CircleAvatar(
                radius: 30,
                backgroundColor: Color(0xFFB08D57),
                child: Icon(Icons.person, color: Colors.black, size: 30),
              ),
              SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Goomaral Gomboo',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 4),
                    Text(
                      'Premium member',
                      style: TextStyle(color: Colors.white70),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 20),
        _AccountTile(
          icon: Icons.local_shipping_outlined,
          title: 'Track orders',
          subtitle: '2 packages are on the way',
          trailing: const Icon(Icons.chevron_right),
          onTap: () {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Order tracking coming soon.')),
            );
          },
        ),
        _AccountTile(
          icon: Icons.credit_card_outlined,
          title: 'Payment methods',
          subtitle: 'Visa ending in 1024',
          trailing: const Icon(Icons.chevron_right),
          onTap: () {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Payment settings opened.')),
            );
          },
        ),
        _AccountTile(
          icon: Icons.shopping_bag_outlined,
          title: 'Cart summary',
          subtitle: '$cartCount items ready for checkout',
          trailing: const Icon(Icons.chevron_right),
          onTap: () {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text('You have $cartCount items in your cart.')),
            );
          },
        ),
        _AccountTile(
          icon: Icons.support_agent_outlined,
          title: 'Customer support',
          subtitle: 'Chat with a stylist',
          trailing: const Icon(Icons.chevron_right),
          onTap: () {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('A stylist will contact you shortly.')),
            );
          },
        ),
      ],
    );
  }
}

class _AccountTile extends StatelessWidget {
  const _AccountTile({
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.trailing,
    required this.onTap,
  });

  final IconData icon;
  final String title;
  final String subtitle;
  final Widget trailing;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 14),
      elevation: 0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(22)),
      child: ListTile(
        onTap: onTap,
        contentPadding: const EdgeInsets.symmetric(horizontal: 18, vertical: 8),
        leading: CircleAvatar(
          backgroundColor: const Color(0xFFF2E8D5),
          child: Icon(icon, color: const Color(0xFF8E6A3E)),
        ),
        title: Text(
          title,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        subtitle: Text(subtitle),
        trailing: trailing,
      ),
    );
  }
}
