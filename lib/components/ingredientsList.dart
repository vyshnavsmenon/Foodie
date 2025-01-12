import 'package:flutter/material.dart';
import 'package:foodie/components/TextStyle.dart';

class IngredientsList extends StatelessWidget {
  const IngredientsList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ingredients = [
      {'name': 'Tortilla Chips', 'imagePath': 'assets/tortilla.png', 'number': '2'},
      {'name': 'Avocado', 'imagePath': 'assets/Avocado.png', 'number': '1'},
      {'name': 'Red Cabbage', 'imagePath': 'assets/Cabbage.png', 'number': '9'},
      {'name': 'Peanuts', 'imagePath': 'assets/Peanuts.png', 'number': '1'},
      {'name': 'Red Onions', 'imagePath': 'assets/RedOnion.png', 'number': '1'},
    ];

    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: ingredients.length,
      itemBuilder: (context, index) {
        return Container(
          height: 100,
          margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16), 
          child: Material(
            elevation: 4,
            borderRadius: BorderRadius.circular(8),
            child: Center(
              child: ListTile(
                leading: Image.asset(
                  ingredients[index]['imagePath'] as String,
                  width: 80,
                  height: 80,
                ),
                title: Text(ingredients[index]['name'] as String,
                  style: TextStyles.getTextStyle(18, FontWeight.w900, Color(0xFF0A2533)),
                ),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Image.asset(
                        'assets/subtract_icon.png',
                        width: 24,
                        height: 24,
                      ),
                    const SizedBox(width: 8),
                    Text(
                      ingredients[index]['number'] as String,
                      style: TextStyle(fontSize: 16),
                    ),
                    const SizedBox(width: 8),
                    Image.asset(
                        'assets/add_icon.png',
                        width: 24,
                        height: 24,
                      ),                    
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}