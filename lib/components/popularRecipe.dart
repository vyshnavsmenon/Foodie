import 'package:flutter/material.dart';
import 'package:foodie/components/ProductCarousel.dart';
import 'package:foodie/components/TextStyle.dart';

class PopularRecipeSection extends StatelessWidget {
  const PopularRecipeSection({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 270,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Popular Recipes',
                style: TextStyles.getTextStyle(25, FontWeight.w800, Color(0xFF0A2533)),
              ),
              Text(
                'See All',
                style: TextStyles.getTextStyle(20, FontWeight.w800, Color(0xFF70B9BE)),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Expanded(
            child: ProductCarousel(
              width: 200,
              cardType: 'recipe',
            ),
          ),
        ],
      ),
    );
  }
}
