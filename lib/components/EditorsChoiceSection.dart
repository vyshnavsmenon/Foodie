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

          // Scrollable List of EditorsListTile widgets
          SizedBox(height: 16), // Add some spacing
          SizedBox(
            height: 300, // Set a fixed height for the scrollable area
            child: SingleChildScrollView(
              child: Column(
                children: products.map((product) {
                  return EditorsListTile(
                    title: product['title'] ?? 'No Title', // Access each product's title
                    imageUrl: product['image'] ?? '',     // Access each product's image URL
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
