import 'package:flutter/material.dart';

class FloatingButton extends StatelessWidget {
  const FloatingButton({super.key});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
        onPressed: () {},
        shape: CircleBorder(),
        backgroundColor: Color(0xFF042628),
        child: FractionallySizedBox(
          widthFactor: 2.5, // Makes image 20% larger than the button
          heightFactor: 2.5,
          child: Image.asset(
            'assets/floating_icon.png',
            fit: BoxFit.cover,
          ),
        ),
      );
  }
}