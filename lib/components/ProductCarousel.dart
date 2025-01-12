import 'package:flutter/material.dart';
import 'package:foodie/components/CustomCarousel.dart';
import 'package:foodie/services/ProductDetails.dart';
import 'package:provider/provider.dart';

class ProductCarousel extends StatelessWidget {
  final double? width;
  final String cardType;
  final double cardHeight;
  final double? imageHeight;
  final double? viewportFraction;

  ProductCarousel({
    Key? key,
    this.width,
    required this.cardHeight,
    required this.cardType,
    this.imageHeight,
    this.viewportFraction,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Access the product provider
    final productProvider = Provider.of<ProductProvider>(context);

    return productProvider.isLoading
        ? Center(child: CircularProgressIndicator())
        : productProvider.products.isEmpty
            ? Center(child: Text('No products available.'))
            : CarouselWithCards(
                cardData: productProvider.products,
                width: width,
                cardType: cardType,
                cardHeight: cardHeight,
                imageHeight: imageHeight ?? 136,
                viewportFraction: viewportFraction ?? 0.55,
              );
  }
}
