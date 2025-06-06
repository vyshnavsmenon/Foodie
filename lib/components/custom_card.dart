import 'package:flutter/material.dart';

class CustomCard extends StatelessWidget {
  final Widget? child;
  final VoidCallback? onTap;
  final double? height;
  final double? width;
  
  const CustomCard({
    Key? key,
    this.child,
    this.onTap,
    this.height,
    this.width
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: width,
        height: height,                
        decoration: BoxDecoration(
          color: Color(0xFF70B9BE),
          borderRadius: BorderRadius.circular(20),                        
        ),
        child: child,
      ),
    );
  }
}