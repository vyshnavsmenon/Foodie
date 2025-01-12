import 'package:flutter/material.dart';
import 'package:foodie/components/TextStyle.dart';

class CreatorTile extends StatelessWidget {
  final String? heading;
  final String image;
  final String name;
  final String description;  
  
  CreatorTile({
    Key? key, 
    this.heading, 
    required this.image, 
    required this.name, 
    required this.description}) : super(key: key);

  @override
  Widget build(BuildContext context) {    
    final double fontSize = (name == 'Alena Sabyan') ? 28 : 25;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: double.infinity,
        height: (name == 'Alena Sabyan') ? 80 : 100,        
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if(name != 'Alena Sabyan')
              Text(
                heading ?? '',
                style: TextStyles.getTextStyle(25, FontWeight.w800, Color(0xFF0A2533)),
              ),
            Row(                            
              children: [
                Image.asset(image,
                  width: 50,
                  height: 50,
                ),
                const SizedBox(width: 32,),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(name,
                      style: TextStyles.getTextStyle(fontSize, FontWeight.w400, Color(0xFF0A2533)),
                    ),
                    Text(description,
                      style: TextStyles.getTextStyle(16, FontWeight.w400, Color(0xFF0A2533)),
                    ),
                  ],
                ),
                const SizedBox(width: 100,),
                if(name == 'Alena Sabyan') 
                  Container(
                    width: 32,
                    height: 32,
                    decoration: BoxDecoration(
                      color: const Color(0xFF042628),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: const Icon(
                      Icons.arrow_forward,
                      color: Colors.white,
                      size: 20,
                    ),
                  ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
