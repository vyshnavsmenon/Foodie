import 'package:flutter/material.dart';
import 'package:foodie/components/TextStyle.dart';

class CategorySection extends StatelessWidget {
  const CategorySection({super.key});  

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 130,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Category',
                style: TextStyles.getTextStyle(25, FontWeight.w800, Color(0xFF0A2533)),
              ),
              Text(
                'See All',
                style: TextStyles.getTextStyle(20, FontWeight.w800, Color(0xFF70B9BE)),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SizedBox(
                width: 140,
                height: 50,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFF70B9BE),
                  ),
                  onPressed: () {},
                  child: Text(
                    'Breakfast',
                    style: TextStyles.getTextStyle(22, FontWeight.w400, Colors.white),
                  ),
                ),
              ),
              SizedBox(
                width: 110,
                height: 50,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFFF1F5F5),
                  ),
                  onPressed: () {},
                  child: Text(
                    'Lunch',
                    style: TextStyles.getTextStyle(22, FontWeight.w400, Color(0xFF0A2533)),
                  ),
                ),
              ),
              SizedBox(
                width: 120,
                height: 50,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFFF1F5F5),
                  ),
                  onPressed: () {},
                  child: Text(
                    'Dinner',
                    style: TextStyles.getTextStyle(22, FontWeight.w400, Color(0xFF0A2533)),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
