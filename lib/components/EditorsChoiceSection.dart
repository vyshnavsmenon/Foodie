import 'package:flutter/material.dart';
import 'package:foodie/components/EditorsListTile.dart';
import 'package:foodie/components/TextStyle.dart';

class EditorsChoice extends StatelessWidget {
  final List<Map<String, String>> products;

  const EditorsChoice({Key? key, required this.products}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header Row with Title and "View All" text
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Editor's Choice",
                style: TextStyles.getTextStyle(25, FontWeight.w800, Color(0xFF0A2533)),
              ),
              Text(
                'View All',
                style: TextStyles.getTextStyle(20, FontWeight.w800, Color(0xFF70B9BE)),
              ),
            ],
          ),          
          SizedBox(height: 16), 
          SizedBox(
            height: 300,
            child: SingleChildScrollView(
              child: Column(
                children: products.map((product) {
                  return EditorsListTile(
                    title: product['title'] ?? 'No Title', 
                    imageUrl: product['image'] ?? '',    
                    description: product['description'] ?? '', 
                  );
                }).toList(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
