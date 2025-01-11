import 'package:flutter/material.dart';
import 'package:foodie/components/TextStyle.dart';

class GreetingRow extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Image.asset(
              'assets/sun_icon.png',
              width: 25,
              height: 25,
            ),
            const SizedBox(width: 8),
            Text(
              'Good Morning',
              style: TextStyles.getTextStyle(20, FontWeight.w400, Color(0xFF0A2533)),
            ),
          ],
        ),
        Image.asset(
          'assets/cart_icon.png',
          width: 29,
          height: 29,
        )
      ],
    );
  }
}
