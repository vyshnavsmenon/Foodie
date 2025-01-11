import 'package:flutter/material.dart';
import 'package:foodie/components/CustomSearchBar.dart';
import 'package:foodie/components/FAB.dart';
// import 'package:foodie/components/TextStyle.dart';
import 'package:foodie/components/bottomNavigationBar.dart';
import 'package:foodie/components/customAppBar.dart';

class DiscoverPage extends StatefulWidget {
  const DiscoverPage({super.key});

  @override
  State<DiscoverPage> createState() => _DiscoverPageState();
}

class _DiscoverPageState extends State<DiscoverPage> {

  int _currentIndex = 1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(  
      backgroundColor: Colors.white,    
      body: Stack(
        children: [
          CustomAppBarExample(),
          CustomSearchBar(),          
        ],
      ),
      floatingActionButton: FloatingButton(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomNavBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
    );
  }
}