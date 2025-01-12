import 'package:flutter/material.dart';
import 'package:foodie/components/CustomSearchBar.dart';
import 'package:foodie/components/EditorsChoiceSection.dart';
import 'package:foodie/components/FAB.dart';
import 'package:foodie/components/bottomNavigationBar.dart';
import 'package:foodie/components/categorySection.dart';
import 'package:foodie/components/customAppBar.dart';
import 'package:foodie/components/popularRecipe.dart';
import 'package:foodie/services/ProductDetails.dart';

class DiscoverPage extends StatefulWidget {
  const DiscoverPage({super.key});

  @override
  State<DiscoverPage> createState() => _DiscoverPageState();
  
}

class _DiscoverPageState extends State<DiscoverPage> {
  final ProductDetails productservice = ProductDetails();
  late Future<List<Map<String, String>>> _productDetailsFuture;

  int _currentIndex = 1;

  @override
  void initState() {
    super.initState();
    _productDetailsFuture = fetchProductDetails();
  }

  Future<List<Map<String, String>>> fetchProductDetails() {
    return productservice.fetchProductsTitleAndDescription();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          CustomAppBarExample(),
          CustomSearchBar(),
          Positioned(
              top: 230,
              left: 16,
              right: 16,
              child: CategorySection(isHeading: false)),
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
              )),
          Positioned(
            top: 550,
            left: 30,
            right: 30,
            child: FutureBuilder<List<Map<String, String>>>(
              future: _productDetailsFuture,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const CircularProgressIndicator();
                } else if (snapshot.hasError) {
                  return Text('Error: ${snapshot.error}');
                } else if (snapshot.hasData) {
                  return EditorsChoice(products: snapshot.data ?? []);
                } else {
                  return const Text('No products available.');
                }
              },
            ),
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