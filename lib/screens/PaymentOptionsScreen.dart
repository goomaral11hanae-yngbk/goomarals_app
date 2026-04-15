import 'package:flutter/material.dart';

class PaymentOptionsScreen extends StatefulWidget {
  const PaymentOptionsScreen({
    super.key,
    required this.total,
    required this.itemCount,
  });

  final double total;
  final int itemCount;

  @override
  State<PaymentOptionsScreen> createState() => _PaymentOptionsScreenState();
}

class _PaymentOptionsScreenState extends State<PaymentOptionsScreen> {
  late String _selectedMethodId;

  final List<_PaymentMethod> _methods = const [
    _PaymentMethod(
      id: 'card',
      title: 'Credit or Debit Card',
      subtitle: 'Visa, Mastercard, American Express',
      icon: Icons.credit_card,
      color: Color(0xFF1E3A8A),
    ),
    _PaymentMethod(
      id: 'paypal',
      title: 'PayPal',
      subtitle: 'Fast checkout with your PayPal account',
      icon: Icons.account_balance_wallet_outlined,
      color: Color(0xFF0070BA),
    ),
    _PaymentMethod(
      id: 'apple_pay',
      title: 'Apple Pay',
      subtitle: 'Secure checkout on supported Apple devices',
      icon: Icons.phone_iphone,
      color: Color(0xFF111111),
    ),
    _PaymentMethod(
      id: 'google_pay',
      title: 'Google Pay',
      subtitle: 'Tap into your saved Google payment methods',
      icon: Icons.android,
      color: Color(0xFF34A853),
    ),
    _PaymentMethod(
      id: 'bank',
      title: 'Online Bank Transfer',
      subtitle: 'Pay directly from your banking app',
      icon: Icons.account_balance,
      color: Color(0xFF6B4F2A),
    ),
    _PaymentMethod(
      id: 'wallet',
      title: 'Digital Wallet',
      subtitle: 'Use regional wallets and saved online balances',
      icon: Icons.wallet_outlined,
      color: Color(0xFF8B5CF6),
    ),
  ];

  @override
  void initState() {
    super.initState();
    _selectedMethodId = _methods.first.id;
  }

  @override
  Widget build(BuildContext context) {
    final selectedMethod = _methods.firstWhere(
      (method) => method.id == _selectedMethodId,
    );

    return Scaffold(
      backgroundColor: const Color(0xFFF6F2EA),
      appBar: AppBar(
        backgroundColor: const Color(0xFFF6F2EA),
        elevation: 0,
        scrolledUnderElevation: 0,
        title: const Text(
          'Payment options',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: ListView(
                padding: const EdgeInsets.fromLTRB(20, 8, 20, 24),
                children: [
                  Container(
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: const Color(0xFF131313),
                      borderRadius: BorderRadius.circular(28),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Choose how you want to pay',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          '${widget.itemCount} item${widget.itemCount == 1 ? '' : 's'} ready for secure online checkout.',
                          style: const TextStyle(
                            color: Colors.white70,
                            height: 1.5,
                          ),
                        ),
                        const SizedBox(height: 18),
                        Wrap(
                          spacing: 10,
                          runSpacing: 10,
                          children: const [
                            _MethodChip(label: 'Cards'),
                            _MethodChip(label: 'Wallets'),
                            _MethodChip(label: 'Banking'),
                            _MethodChip(label: 'Express Pay'),
                          ],
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 22),
                  const Text(
                    'Available online payment methods',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 14),
                  ..._methods.map((method) {
                    final isSelected = method.id == _selectedMethodId;
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 14),
                      child: InkWell(
                        borderRadius: BorderRadius.circular(24),
                        onTap: () {
                          setState(() {
                            _selectedMethodId = method.id;
                          });
                        },
                        child: AnimatedContainer(
                          duration: const Duration(milliseconds: 220),
                          padding: const EdgeInsets.all(18),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(24),
                            border: Border.all(
                              color: isSelected
                                  ? const Color(0xFFB08D57)
                                  : Colors.transparent,
                              width: 2,
                            ),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withValues(alpha: 0.06),
                                blurRadius: 12,
                                offset: const Offset(0, 6),
                              ),
                            ],
                          ),
                          child: Row(
                            children: [
                              CircleAvatar(
                                radius: 26,
                                backgroundColor: method.color.withValues(
                                  alpha: 0.12,
                                ),
                                child: Icon(method.icon, color: method.color),
                              ),
                              const SizedBox(width: 14),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      method.title,
                                      style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16,
                                      ),
                                    ),
                                    const SizedBox(height: 4),
                                    Text(
                                      method.subtitle,
                                      style: const TextStyle(
                                        color: Colors.black54,
                                        height: 1.4,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              AnimatedContainer(
                                duration: const Duration(milliseconds: 220),
                                width: 24,
                                height: 24,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: isSelected
                                      ? const Color(0xFFB08D57)
                                      : Colors.transparent,
                                  border: Border.all(
                                    color: isSelected
                                        ? const Color(0xFFB08D57)
                                        : Colors.black26,
                                    width: 2,
                                  ),
                                ),
                                child: isSelected
                                    ? const Icon(
                                        Icons.check,
                                        size: 14,
                                        color: Colors.white,
                                      )
                                    : null,
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  }),
                ],
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
                  _SummaryLine(
                    label: 'Items',
                    value: widget.itemCount.toString(),
                  ),
                  const SizedBox(height: 8),
                  const _SummaryLine(label: 'Processing', value: 'Included'),
                  const SizedBox(height: 8),
                  _SummaryLine(
                    label: 'Pay with',
                    value: selectedMethod.title,
                  ),
                  const SizedBox(height: 8),
                  _SummaryLine(
                    label: 'Total',
                    value: '\$${widget.total.toStringAsFixed(2)}',
                    emphasized: true,
                  ),
                  const SizedBox(height: 18),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(
                              'Selected ${selectedMethod.title} for \$${widget.total.toStringAsFixed(2)}.',
                            ),
                          ),
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
                        'Continue to payment',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _PaymentMethod {
  const _PaymentMethod({
    required this.id,
    required this.title,
    required this.subtitle,
    required this.icon,
    required this.color,
  });

  final String id;
  final String title;
  final String subtitle;
  final IconData icon;
  final Color color;
}

class _MethodChip extends StatelessWidget {
  const _MethodChip({required this.label});

  final String label;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
      decoration: BoxDecoration(
        color: Colors.white.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(999),
      ),
      child: Text(
        label,
        style: const TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}

class _SummaryLine extends StatelessWidget {
  const _SummaryLine({
    required this.label,
    required this.value,
    this.emphasized = false,
  });

  final String label;
  final String value;
  final bool emphasized;

  @override
  Widget build(BuildContext context) {
    final style = TextStyle(
      fontSize: emphasized ? 18 : 15,
      fontWeight: emphasized ? FontWeight.bold : FontWeight.w500,
      color: emphasized ? Colors.black : Colors.black87,
    );

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(label, style: style),
        const SizedBox(width: 16),
        Expanded(
          child: Text(
            value,
            style: style,
            textAlign: TextAlign.right,
          ),
        ),
      ],
    );
  }
}
