import 'package:flutter/material.dart';
import 'package:foodie/components/ProductCarousel.dart';
import 'package:foodie/components/TextStyle.dart';

class PopularRecipeSection extends StatelessWidget {
  final double cardHeight;
  final double cardWidth;
  final String text;
  final double imageHeight;
  final double viewportFraction;
  final String text1;

  const PopularRecipeSection({
    required this.cardHeight,
    required this.text,
    required this.imageHeight,
    required this.cardWidth,
    required this.viewportFraction,
    super.key, required this.text1,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Popular Recipes',
                style: TextStyles.getTextStyle(25, FontWeight.w800, Color(0xFF0A2533)),
              ),
              Text(
                text,
                style: TextStyles.getTextStyle(20, FontWeight.w800, Color(0xFF70B9BE)),
              ),
            ],
          ),
          const SizedBox(height: 8),
          SizedBox(
            height: cardHeight, // Add some padding
            child: ProductCarousel(
              cardHeight: cardHeight,
              imageHeight: imageHeight,
              width: cardWidth,
              cardType: 'recipe',
              viewportFraction: viewportFraction,
            ),
          ),
        ],
      ),
    );
  }
}