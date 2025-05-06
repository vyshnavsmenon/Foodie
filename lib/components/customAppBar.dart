import 'package:flutter/material.dart';
import 'package:foodie/models/home.dart';

class CustomAppBarExample extends StatelessWidget {
  const CustomAppBarExample({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [         
          // Custom AppBar
          Positioned(
            top: 20,
            left: 0,
            right: 0,
            child: Container(
              color: Colors.white,
              height: 100,
              padding: const EdgeInsets.only(top: 24, left: 16, right: 16), // Add padding for status bar
              child: Row(                
                children: [                  
                  IconButton(
                    icon: const Icon(Icons.arrow_back, color: Colors.black),
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage()));
                    },
                  ),
                  const SizedBox(width: 110), // Placeholder for symmetry

                  // Title
                  Text(
                    'Search',
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.w800,
                      color: const Color(0xFF0A2533),
                    ),
                  ),

                  // Optional Trailing Icon                  
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
