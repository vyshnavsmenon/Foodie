import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:foodie/components/TextStyle.dart';
import 'package:foodie/components/custom_card.dart';

class CarouselWithCards extends StatelessWidget {
  final List<Map<String, String>> cardData;
  final double? width;  
  final bool isBackgroundImage;

  const CarouselWithCards(
    {Key? key, 
      required this.cardData,
      required this.width,
      required this.isBackgroundImage,
    }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      options: CarouselOptions(
        height: 250,
        enableInfiniteScroll: false,
        autoPlay: false,
        viewportFraction: 0.85,
        scrollPhysics: PageScrollPhysics(),
        padEnds: false,
      ),
      items: cardData.map((item) => CustomCard(
        width: width,
        height: 172,
        // if(isBackgroundImage) {

        // }
        onTap: () {
          print('Card ${item['title']} tapped!');
        },
        child: Stack(
          children: [ 
            if (isBackgroundImage) 
                Positioned.fill(
                  child: Image.network(item['image']!,
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
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,                    
                  ),
                  const SizedBox(height: 4),                                    
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(                        
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Image.asset('assets/Person.png',
                              width: 20,
                              height: 20,                            
                            ),
                          ),
                          const SizedBox(width: 10,),
                          Text(
                            'James Spader',  
                            style: TextStyles.getTextStyle(16, FontWeight.w400, Colors.white),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Image.asset('assets/clock_icon.png',
                            width: 16,
                            height: 16,
                          ),
                          const SizedBox(width: 10,),
                          Text('20 Min',
                            style: TextStyles.getTextStyle(16, FontWeight.w400, Colors.white),
                          )
                        ],
                      )
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      )).toList(),
    );
  }
}