import 'package:flutter/material.dart';
import 'package:foodie/components/CustomCarousel.dart';
import 'package:foodie/services/ProductDetails.dart';

class ProductCarousel extends StatelessWidget {
  final ProductDetails productService = ProductDetails();
  final double? width;
  final String cardType; 
  final double cardHeight; 
  final double? imageHeight;
  final double? viewportFraction;

    ProductCarousel(
    {Key? key,       
      this.width,      
      required this.cardHeight,
      required this.cardType,
      this.imageHeight,
      this.viewportFraction,
    }) : super(key: key);

  Future<List<Map<String, String>>> fetchProductDetails() {
    return productService.fetchProductsTitleAndDescription();
  }


  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Map<String, String>>>(
      future: fetchProductDetails(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error}'));
        } else if (snapshot.hasData) {
          return CarouselWithCards(
            cardData: snapshot.data!, 
            width: width, 
            cardType: cardType, 
            cardHeight: cardHeight,
            imageHeight: imageHeight ?? 136, viewportFraction: viewportFraction ?? 0.55,
          );
        } else {
          return Center(child: Text('No products available.'));
        }
      },
    );
  }
}
