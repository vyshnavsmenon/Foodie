import 'package:flutter/material.dart';
import 'package:foodie/services/ProductDetails.dart';
import 'package:provider/provider.dart';
import 'package:foodie/components/CustomSearchBar.dart';
import 'package:foodie/components/EditorsChoiceSection.dart';
import 'package:foodie/components/FAB.dart';
import 'package:foodie/components/bottomNavigationBar.dart';
import 'package:foodie/components/categorySection.dart';
import 'package:foodie/components/customAppBar.dart';
import 'package:foodie/components/popularRecipe.dart';

class DiscoverPage extends StatefulWidget {
  const DiscoverPage({super.key});

  @override
  State<DiscoverPage> createState() => _DiscoverPageState();
}

class _DiscoverPageState extends State<DiscoverPage> {
  int _currentIndex = 1;

  @override
  Widget build(BuildContext context) {
    final productProvider = Provider.of<ProductProvider>(context);

    return Scaffold(
      body: Stack(
        children: [
          CustomAppBarExample(),
          CustomSearchBar(),
          Positioned(
            top: 230,
            left: 16,
            right: 16,
            child: CategorySection(isHeading: false),
          ),
          Positioned(
            top: 310,
            left: 30,
            right: 30,
            child: const PopularRecipeSection(
              cardHeight: 180,
              text: 'View All',
              imageHeight: 84,
              cardWidth: 160,
              viewportFraction: 0.35,
              text1: 'Popular Recipes',
            ),
          ),
          Positioned(
            top: 550,
            left: 30,
            right: 30,
            child: productProvider.isLoading
                ? const Center(child: CircularProgressIndicator())
                : EditorsChoice(products: productProvider.products),
          ),
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
