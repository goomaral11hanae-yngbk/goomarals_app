import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import '../constants.dart';

class ProductDetail1Screen extends StatefulWidget {
  final String name;
  final String imageUrl;
  final double price;
  final List<String>? imageGallery;

  const ProductDetail1Screen({
    super.key,
    required this.name,
    required this.imageUrl,
    required this.price,
    this.imageGallery,
  });

  @override
  State<ProductDetail1Screen> createState() => _ProductDetail1ScreenState();
}

class _ProductDetail1ScreenState extends State<ProductDetail1Screen> {
  int _currentImageIndex = 0;
  int _selectedColor = 0;
  int _quantity = 1;

  final List<Color> _availableColors = [
    const Color(0xFF4A6572),
    const Color(0xFFF9AA33),
    const Color(0xFF232F34),
    const Color(0xFF344955),
  ];

  final List<String> _defaultGallery = [
    'https://picsum.photos/seed/product1/400/400',
    'https://picsum.photos/seed/product2/400/400',
    'https://picsum.photos/seed/product3/400/400',
    'https://picsum.photos/seed/product4/400/400',
  ];

  @override
  Widget build(BuildContext context) {
    final galleryImages = widget.imageGallery ?? _defaultGallery;

    return Scaffold(
      backgroundColor: AppConstants.backgroundColor,
      body: CustomScrollView(
        slivers: [
          // 🔹 Image & App Bar
          SliverAppBar(
            backgroundColor: AppConstants.backgroundColor,
            elevation: 0,
            leading: IconButton(
              icon: const Icon(Iconsax.arrow_left, color: Colors.black),
              onPressed: () => Navigator.pop(context),
            ),
            actions: [
              IconButton(
                icon: const Icon(Iconsax.heart, color: Colors.black),
                onPressed: () {},
              ),
            ],
            expandedHeight: 400,
            flexibleSpace: FlexibleSpaceBar(
              background: Stack(
                children: [
                  PageView.builder(
                    itemCount: galleryImages.length,
                    onPageChanged: (index) {
                      setState(() => _currentImageIndex = index);
                    },
                    itemBuilder: (context, index) {
                      return Image.network(
                        galleryImages[index],
                        fit: BoxFit.cover,
                        errorBuilder: (context, error, stackTrace) =>
                            Container(
                          color: Colors.grey[200],
                          child: const Icon(Icons.image_not_supported),
                        ),
                      );
                    },
                  ),

                  // 🔸 Image Indicator
                  Positioned(
                    bottom: 20,
                    left: 0,
                    right: 0,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(galleryImages.length, (index) {
                        return Container(
                          margin: const EdgeInsets.symmetric(horizontal: 4),
                          width: 8,
                          height: 8,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: _currentImageIndex == index
                                ? AppConstants.primaryColor
                                : Colors.white.withOpacity(0.6),
                          ),
                        );
                      }),
                    ),
                  ),
                ],
              ),
            ),
          ),

          // 🔹 Product Details
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(AppConstants.defaultPadding),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // 🏷️ Title & Price
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Text(widget.name,
                            style: AppConstants.headingStyle),
                      ),
                      Text(
                        '\$${widget.price.toStringAsFixed(2)}',
                        style: AppConstants.headingStyle.copyWith(
                          color: AppConstants.primaryColor,
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 16),

                  // ⭐ Rating
                  Row(
                    children: [
                      _buildRatingStars(4.5),
                      const SizedBox(width: 8),
                      const Text(
                        '4.5 (128 reviews)',
                        style: TextStyle(color: Colors.grey),
                      ),
                      const Spacer(),
                      const Text(
                        '⭐ 5.0 Quality Score',
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          color: Colors.amber,
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 24),

                  //  Color Selection
                  Text('Өнгө сонгох', style: AppConstants.subHeadingStyle),
                  const SizedBox(height: 12),
                  Row(
                    children: List.generate(_availableColors.length, (index) {
                      return GestureDetector(
                        onTap: () => setState(() => _selectedColor = index),
                        child: Container(
                          margin: const EdgeInsets.only(right: 12),
                          width: 40,
                          height: 40,
                          decoration: BoxDecoration(
                            color: _availableColors[index],
                            shape: BoxShape.circle,
                            border: _selectedColor == index
                                ? Border.all(
                                    color: AppConstants.primaryColor, width: 3)
                                : null,
                          ),
                          child: _selectedColor == index
                              ? const Icon(Icons.check,
                                  color: Colors.white, size: 20)
                              : null,
                        ),
                      );
                    }),
                  ),

                  const SizedBox(height: 24),

                  //  Description
                  Text('Дэлгэрэнгүй мэдээлэл',
                      style: AppConstants.subHeadingStyle),
                  const SizedBox(height: 8),
                  const Text(
                    'Энэхүү гоёл чимэглэл нь Италийн дизайнеруудын гар урлалын бүтээл бөгөөд дэлхийн шилдэг чанартай материал ашиглан бүтээгдсэн. Таны гоо сайхныг онцлон тодруулж, ямар ч үйл явдалд тохиромжтой.',
                    style: AppConstants.bodyStyle,
                  ),

                  const SizedBox(height: 24),

                  //  Features
                  _buildFeatureItem(
                    icon: Iconsax.star,
                    title: '100% Жинхэнэ Гоёл',
                    subtitle: 'Байгалийн гоёлын чулуу',
                  ),
                  _buildFeatureItem(
                    icon: Iconsax.security_safe,
                    title: 'Баталгаатай',
                    subtitle: '2 жилийн баталгаа',
                  ),
                  _buildFeatureItem(
                    icon: Iconsax.truck_fast,
                    title: 'Хүргэлт',
                    subtitle: '2-3 хоногт хүргэгдэнэ',
                  ),

                  const SizedBox(height: 32),

                  //  Quantity & Cart Button
                  Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Colors.grey[50],
                      borderRadius:
                          BorderRadius.circular(AppConstants.defaultRadius),
                    ),
                    child: Row(
                      children: [
                        // Quantity Selector
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(12),
                            border: Border.all(color: Colors.grey[300]!),
                          ),
                          child: Row(
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
                                  fontWeight: FontWeight.w600,
                                  fontSize: 16,
                                ),
                              ),
                              IconButton(
                                icon: const Icon(Iconsax.add),
                                onPressed: () =>
                                    setState(() => _quantity++),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(width: 16),

                        // Add to Cart Button
                        Expanded(
                          child: ElevatedButton(
                            onPressed: () {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text(
                                      '${widget.name} сагсанд нэмэгдлээ!'),
                                  backgroundColor:
                                      AppConstants.primaryColor,
                                ),
                              );
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: AppConstants.primaryColor,
                              foregroundColor: Colors.white,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                              padding:
                                  const EdgeInsets.symmetric(vertical: 16),
                            ),
                            child: Text(
                              'Сагслах - \$${(widget.price * _quantity).toStringAsFixed(2)}',
                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 40),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  //  Rating
  Widget _buildRatingStars(double rating) {
    return Row(
      children: List.generate(5, (index) {
        return Icon(
          index < rating.floor() ? Iconsax.star1 : Iconsax.star,
          color: Colors.amber,
          size: 18,
        );
      }),
    );
  }

  //  Features
  Widget _buildFeatureItem({
    required IconData icon,
    required String title,
    required String subtitle,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius:
            BorderRadius.circular(AppConstants.defaultRadius),
        border: Border.all(color: Colors.grey[200]!),
      ),
      child: Row(
        children: [
          Icon(icon, color: AppConstants.primaryColor, size: 24),
          const SizedBox(width: 12),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title,
                  style: const TextStyle(
                      fontWeight: FontWeight.w600, fontSize: 16)),
              Text(subtitle,
                  style:
                      const TextStyle(color: Colors.grey, fontSize: 14)),
            ],
          ),
        ],
      ),
    );
  }
}
