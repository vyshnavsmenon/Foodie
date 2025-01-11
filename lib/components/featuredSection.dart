import 'package:flutter/material.dart';
import 'package:foodie/components/ProductCarousel.dart';
import 'package:foodie/components/TextStyle.dart';

class FeaturedSection extends StatelessWidget {
  const FeaturedSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 300,                    
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Featured',
            style: TextStyles.getTextStyle(25, FontWeight.w800, Color(0xFF0A2533)),
          ),
          const SizedBox(height: 20),
          SizedBox(
            height: 200,
              child: ProductCarousel(width: 320, cardType: 'default',),
            ),
        ],
      ),
    );
  }
}