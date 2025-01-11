import 'package:flutter/material.dart';
import 'package:foodie/discover.dart';
import 'package:foodie/home.dart';
import 'package:foodie/profile.dart';

class BottomNavBar extends StatelessWidget {
  final Function(int)? onTap; 
  final int currentIndex; 

  const BottomNavBar({
    super.key,
    this.onTap,
    this.currentIndex = 0,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white, 
        boxShadow: [
          BoxShadow(
            color: Color(0xFF95A8C326).withOpacity(0.1), 
            blurRadius: 40, 
            offset: Offset(0, -10), 
          ),
        ],
      ),
      child: BottomAppBar(
        shape: const CircularNotchedRectangle(),
        notchMargin: 8.0,
        color: Colors.transparent, 
        elevation: 0, 
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconButton(              
              icon: currentIndex == 0 ? Image.asset('assets/home_coloured_icon.png') : Image.asset('assets/home_icon.png'),              
              onPressed: () {
                onTap?.call(0);                
                Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage()));                
              } 
            ),
            IconButton(
              icon: currentIndex == 1 ? Image.asset('assets/search_coloured_icon.png') : Image.asset('assets/search_icon.png'),              
              onPressed: () {
                onTap?.call(1);                
                Navigator.push(context, MaterialPageRoute(builder: (context) => DiscoverPage()));
              }
            ),
            const SizedBox(width: 48), 
            IconButton(
              icon: Image.asset('assets/notification_icon.png'),              
              onPressed: () => onTap?.call(2),
            ),
            IconButton(
              icon: currentIndex == 3 ? Image.asset('assets/profile_coloured_icon.png') : Image.asset('assets/profile_icon.png'),              
              onPressed: () {
                onTap?.call(3);
                Navigator.push(context, MaterialPageRoute(builder: (context) => ProfilePage()));
              } 
            ),
          ],
        ),
      ),
    );
  }
}
