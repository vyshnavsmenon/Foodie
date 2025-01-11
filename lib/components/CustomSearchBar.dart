import 'package:flutter/material.dart';

class CustomSearchBar extends StatelessWidget {
  const CustomSearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Positioned(
            top: 150,
            left: 0,
            right: 0,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 32), 
              child: SizedBox(
                height: 74,
                child: SearchBar(                                
                  leading: const Icon(Icons.search),
                  hintText: 'Search',
                  hintStyle: MaterialStateProperty.all<TextStyle>(
                    TextStyle(
                      fontFamily: 'Sofia Pro',
                      fontSize: 22,
                      fontWeight: FontWeight.w400,                      
                      decoration: TextDecoration.none,
                    ),
                  ),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                      side: const BorderSide(color: Color(0xFFE6EBF2), width: 2),
                    ),
                  ),
                  backgroundColor: MaterialStateProperty.all<Color>(const Color(0xFFE6EBF2)),
                ),
              ),
            ),
          );
  }
}