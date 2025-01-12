import 'package:flutter/material.dart';
import 'package:foodie/components/FAB.dart';
import 'package:foodie/components/TextStyle.dart';
import 'package:foodie/components/bottomNavigationBar.dart';
import 'package:foodie/components/categorySection.dart';
import 'package:foodie/components/featuredSection.dart';
import 'package:foodie/components/greetingRow.dart';
import 'package:foodie/components/popularRecipe.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        toolbarHeight: 34,        
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              GreetingRow(),
              Text('Alena Sabyan',
                style: TextStyles.getTextStyle(30, FontWeight.w800, Color(0xFF0A2533)),
              ),
              const SizedBox(height: 24),
              const FeaturedSection(),
              const SizedBox(height: 16),
              const CategorySection(isHeading: true,),
              const SizedBox(height: 16),
              const PopularRecipeSection(
                cardHeight: 280, 
                text: 'See All', 
                imageHeight: 136,
                cardWidth: 200,
                viewportFraction: 0.55,
              ),
            ],
          ),
        ),
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
