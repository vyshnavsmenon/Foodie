import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:foodie/components/TextStyle.dart';
import 'package:foodie/components/custom_card.dart';
import 'package:foodie/models/productDetails.dart';

class CarouselWithCards extends StatelessWidget {
  final List<Map<String, String>> cardData;
  final double? width;
  final String cardType;
  final double cardHeight;
  final double imageHeight;
  final double viewportFraction;

  const CarouselWithCards({
    Key? key,
    required this.cardData,
    this.width,
    required this.cardType,
    required this.cardHeight,
    required this.imageHeight,
    required this.viewportFraction,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      options: CarouselOptions(
        height: cardHeight,
        enableInfiniteScroll: false,
        autoPlay: false,
        viewportFraction: cardType == 'recipe' ? viewportFraction : 0.85,
        padEnds: false,
      ),
      items: cardData.map((item) => Container(
        padding: const EdgeInsets.symmetric(horizontal: 4),
        child: _buildCard(item, context),
      )).toList(),
    );
  }

  Widget _buildCard(Map<String, String> item, BuildContext context) {
    return CustomCard(
      width: width,
      height: cardHeight,
      onTap: () {
        Navigator.push(context, MaterialPageRoute(
          builder: (context) => ProductDetailPage(title: item['title']!, imageUrl: item['image']!, description: item['description']!,)));
        print('Card has pressed');
      },
      child: cardType == 'recipe' ? _buildRecipeCard(item) : _buildDefaultCard(item),
    );
  }

  Widget _buildRecipeCard(Map<String, String> item) {
  return ClipRRect(
    borderRadius: BorderRadius.circular(20),
    child: Container(
      color: Colors.white, // Set background color to white
      child: Stack(
        children: [
          Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(
                height: imageHeight,
                child: Image.network(
                  item['image']!,
                  fit: BoxFit.cover,
                  loadingBuilder: (context, child, loadingProgress) {
                    if (loadingProgress == null) return child;
                    return Container(
                      height: imageHeight,
                      color: Colors.grey[200],
                      child: const Center(
                        child: CircularProgressIndicator(),
                      ),
                    );
                  },
                  errorBuilder: (context, error, stackTrace) {
                    return Container(
                      height: imageHeight,
                      color: Colors.grey[200],
                      child: const Icon(Icons.error_outline),
                    );
                  },
                ),
              ),
              Flexible(
                child: Container(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        item['title']!,
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.black87,
                        ),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                      const SizedBox(height: 12),
                      Row(
                        children: [
                          if (cardHeight == 280) ...[
                            _buildIconWithText(Icons.local_fire_department_outlined, '120 Kcal'),
                            const SizedBox(width: 16),
                            _buildIconWithText(Icons.access_time, '20 Min'),
                          ],
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          if(cardHeight == 280) 
            Positioned(
              top: 0,
              right: 0,
              child: Image.asset(
                'assets/favourite_icon.png',
                width: 80,
                height: 80,
              ),
            ),
        ],
      ),
    ),
  );
}


  Widget _buildDefaultCard(Map<String, String> item) {
    return Stack(
      children: [
        Positioned.fill(
          child: Image.asset('assets/Pattern4.png',
            fit: BoxFit.cover,
          ),
        ),
        Positioned(
          left: 16,
          right: 16,
          bottom: 16,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                item['title']!,
                style: TextStyles.getTextStyle(20, FontWeight.w700, Colors.white),
                maxLines: 2,                
                overflow: TextOverflow.ellipsis,
              ),
              const SizedBox(height: 4),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _buildProfileWithName('James Spader'),
                  _buildIconWithText(Icons.access_time, '20 Min', textColor: Colors.white),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildIconWithText(IconData icon, String text, {Color textColor = Colors.grey}) {
    return Row(
      children: [
        Icon(icon, size: 20, color: textColor),
        const SizedBox(width: 4),
        Text(
          text,
          style: TextStyle(fontSize: 14, color: textColor),
        ),
      ],
    );
  }

  Widget _buildProfileWithName(String name) {
    return Row(
      children: [
        Image.asset('assets/Person.png', width: 20, height: 20),
        const SizedBox(width: 10),
        Text(
          name,
          style: TextStyles.getTextStyle(16, FontWeight.w400, Colors.white),
        ),
      ],
    );
  }
}