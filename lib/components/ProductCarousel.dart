import 'package:flutter/material.dart';
import 'package:foodie/components/CustomCarousel.dart';
import 'package:foodie/services/ProductDetails.dart';

class ProductCarousel extends StatelessWidget {
  final ProductDetails productService = ProductDetails();
  final double? width;
  final bool isBackgroundImage;

    ProductCarousel(
    {Key? key,       
      this.width,
      required this.isBackgroundImage,
    }) : super(key: key);

  Future<List<Map<String, String>>> _fetchProductsTitleAndDescription() {
    return productService.fetchProductsTitleAndDescription();
  }


  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Map<String, String>>>(
      future: _fetchProductsTitleAndDescription(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error}'));
        } else if (snapshot.hasData) {
          return CarouselWithCards(cardData: snapshot.data!, width: width, isBackgroundImage: isBackgroundImage,);
        } else {
          return Center(child: Text('No products available.'));
        }
      },
    );
  }
}
