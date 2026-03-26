import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class ProductDetailScreen extends StatelessWidget {
  final Map<String, String> product;

  const ProductDetailScreen({
    super.key,
    required this.product,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 0, 0, 0),
      body: Stack(
        children: [
          //  IMAGE + GRADIENT
          Stack(
            children: [
              Hero(
                tag: product['image']!,
                child: Image.asset(
                  product['image']!,
                  height: 420,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
              Container(
                height: 420,
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Colors.transparent,
                      Colors.black54,
                    ],
                  ),
                ),
              ),
            ],
          ),

          // TOP BAR
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _circleButton(
                    icon: Iconsax.arrow_left_2,
                    onTap: () => Navigator.pop(context),
                  ),
                  _circleButton(
                    icon: Iconsax.heart,
                    onTap: () {},
                  ),
                ],
              ),
            ),
          ),

          //  DETAILS 
          DraggableScrollableSheet(
            initialChildSize: 0.6,
            minChildSize: 0.6,
            maxChildSize: 0.9,
            builder: (_, controller) {
              return Container(
                padding: const EdgeInsets.all(24),
                decoration: const BoxDecoration(
                  color: Color.fromARGB(255, 0, 0, 0),
                  borderRadius: BorderRadius.vertical(top: Radius.circular(32)),
                ),
                child: SingleChildScrollView(
                  controller: controller,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // drag handle
                      Center(
                        child: Container(
                          height: 5,
                          width: 44,
                          decoration: BoxDecoration(
                            color: Colors.grey[300],
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),

                      const SizedBox(height: 24),

                      // TITLE & PRICE 
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: Text(
                              product['name']!,
                              style: const TextStyle(
                                fontSize: 26,
                                fontWeight: FontWeight.bold,
                                height: 1.3,
                              ),
                            ),
                          ),
                          Text(
                            "\$${product['price']}",
                            style: const TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFFB08D57),
                            ),
                          ),
                        ],
                      ),

                      const SizedBox(height: 12),

                      //
                      Row(
                        children: List.generate(
                          5,
                          (index) => Icon(
                            index < 4 ? Iconsax.star1 : Iconsax.star,
                            color: index < 4 ? Colors.amber : Colors.grey[400],
                            size: 18,
                          ),
                        )..add(
                            const Padding(
                              padding: EdgeInsets.only(left: 8),
                              child: Text(
                                "4.0 (128 reviews)",
                                style: TextStyle(color: Colors.black54),
                              ),
                            ),
                          ),
                      ),

                      const SizedBox(height: 28),

                      //  DESCRIPTION 
                      const Text(
                        "Description",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(height: 10),
                      const Text(
                        "This premium jewelry piece is crafted with exceptional detail "
                        "and high-quality materials. Designed to elevate your style "
                        "for both everyday elegance and special occasions.",
                        style: TextStyle(
                          fontSize: 15,
                          height: 1.6,
                          color: Colors.black54,
                        ),
                      ),

                      const SizedBox(height: 28),

                      // INFO
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const [
                          _InfoTile(title: "Material", value: "18K Gold"),
                          _InfoTile(title: "Weight", value: "12g"),
                          _InfoTile(title: "Warranty", value: "1 Year"),
                        ],
                      ),

                      const SizedBox(height: 40),

                      //  BUTTON
                      SizedBox(
                        width: double.infinity,
                        height: 56,
                        child: ElevatedButton.icon(
                          onPressed: () {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                backgroundColor: const Color(0xFFB08D57),
                                content: Text(
                                  "${product['name']} added to cart 🛒",
                                ),
                              ),
                            );
                          },
                          icon: const Icon(
                            Iconsax.shopping_bag,
                            color: Colors.black,
                          ),
                          label: const Text(
                            "Add to Cart",
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFFB08D57),
                            elevation: 0,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30),
                            ),
                          ),
                        ),
                      ),

                      const SizedBox(height: 20),
                    ],
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }

  // CIRCLE BUTTON
  Widget _circleButton({
    required IconData icon,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.9),
          shape: BoxShape.circle,
        ),
        child: Icon(icon, color: Colors.black),
      ),
    );
  }
}

//  INFO TILE 
class _InfoTile extends StatelessWidget {
  final String title;
  final String value;

  const _InfoTile({
    required this.title,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(
            color: Colors.black54,
            fontSize: 13,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          value,
          style: const TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    );
  }
}
