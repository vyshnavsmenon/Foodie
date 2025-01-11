import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:foodie/components/TextStyle.dart';
import 'package:foodie/components/custom_card.dart';

class CarouselWithCards extends StatelessWidget {
  final List<Map<String, String>> cardData;
  final double? width;
  final String cardType;

  const CarouselWithCards({
    Key? key,
    required this.cardData,
    this.width,
    required this.cardType,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      options: CarouselOptions(
        height: _getCarouselHeight(cardType),
        enableInfiniteScroll: false,
        autoPlay: false,
        viewportFraction: cardType == 'recipe' ? 0.55 : 0.85,
        padEnds: false,
      ),
      items: cardData.map((item) => _buildCard(item)).toList(),
    );
  }

  // Helper to get carousel height
  double _getCarouselHeight(String type) {
    return type == 'recipe' ? 300 : 250;
  }

  // Helper to build card
  Widget _buildCard(Map<String, String> item) {
    return CustomCard(
      width: width,
      height: cardType == 'recipe' ? 240 : 172,
      onTap: () => print('Card ${item['title']} tapped!'),
      child: cardType == 'recipe' ? _buildRecipeCard(item) : _buildDefaultCard(item),
    );
  }

  // Recipe card layout
  Widget _buildRecipeCard(Map<String, String> item) {
    return Stack(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Image.network(
                item['image']!,
                height: 101.5,
                fit: BoxFit.fitWidth,
              ),
              Container(
                color: Colors.white,
                padding: const EdgeInsets.all(16),
                child: Column(
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
                        _buildIconWithText(Icons.local_fire_department_outlined, '120 Kcal'),
                        const SizedBox(width: 16),
                        _buildIconWithText(Icons.access_time, '20 Min'),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        Positioned(
          right: 10,
          top: 10,
          child: Image.asset('assets/favourite_icon.png',
            width: 60,
            height: 60,
            fit: BoxFit.cover,
          ), 
        ),
      ],
    );
  }

  // Default card layout
  Widget _buildDefaultCard(Map<String, String> item) {
    return Stack(
      children: [      
        Positioned.fill(
          child:  Image.asset('assets/Pattern4.png',
              fit: BoxFit.cover,
            )        
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


  // Helper to build icon with text
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

  // Helper to build profile row
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
