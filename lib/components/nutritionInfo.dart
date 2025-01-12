import 'package:flutter/material.dart';
import 'package:foodie/components/TextStyle.dart';

class NutritionInfo extends StatelessWidget {
  final Widget icon; 
  final String value;
  final String label;

  const NutritionInfo({
    Key? key,
    required this.icon,
    required this.value,
    required this.label,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
            Container(
              padding: const EdgeInsets.all(8),
             
              child: Row(
                children: [
                  icon,
                  const SizedBox(width: 6,),
                  Text(
                    '$value $label',
                    textAlign: TextAlign.center,
                    style: TextStyles.getTextStyle(16, FontWeight.w400, const Color(0xFF0A2533)),
                  ),
                ],
              ),
            ),            
          ],              
    );
  }
}
