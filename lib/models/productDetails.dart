import 'package:flutter/material.dart';
import 'package:foodie/components/TextStyle.dart';
import 'package:foodie/components/creatorTile.dart';
import 'package:foodie/components/customTab.dart';
import 'package:foodie/components/ingredientsList.dart';
import 'package:foodie/components/nutritionInfo.dart';
import 'package:foodie/components/popularRecipe.dart';

class ProductDetailPage extends StatelessWidget {
  final String title;
  final String imageUrl;
  final String description;

  const ProductDetailPage({
    Key? key,
    required this.title,
    required this.imageUrl,
    required this.description,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          CustomScrollView(
            slivers: [
              SliverAppBar(
                expandedHeight: 200,
                floating: false,
                pinned: true,
                flexibleSpace: FlexibleSpaceBar(
                  background: Stack(
                    children: [
                      SizedBox.expand(
                        child: Image.network(
                          imageUrl,
                          fit: BoxFit.cover,
                        ),
                      ),
                                            
                      Container(
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.bottomCenter,
                            end: Alignment.topCenter,
                            colors: [
                              Colors.transparent,
                              Colors.transparent,
                              Colors.white.withOpacity(0.3),
                              Colors.white,
                            ],
                            stops: const [0.0, 0.6, 0.8, 1.0],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                leading: Container(
                  width: 80,
                  height: 80,
                  child: GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Image.asset(
                      'assets/close_icon.png',
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                actions: [
                  SizedBox(
                    width: 80,
                    height: 80,
                    child: Image.asset(
                      'assets/favourite_icon.png',
                      width: 40,
                      height: 40,
                      fit: BoxFit.cover,
                    ),
                  ),
                ],
              ),

              SliverToBoxAdapter(
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30),
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.3),
                        spreadRadius: 0,
                        blurRadius: 8,
                        offset: const Offset(0, -2),
                      ),
                    ],
                  ),
                  child: Column(
                    children: [
                      Container(
                        margin: const EdgeInsets.only(top: 12),
                        width: 60,
                        height: 8,
                        decoration: BoxDecoration(
                          color: const Color(0xFFE3EBEC),
                          borderRadius: BorderRadius.circular(16),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              title,
                              style: TextStyles.getTextStyle(
                                25,
                                FontWeight.w800,
                                const Color(0xFF0A2533),
                              ),
                            ),
                            const SizedBox(height: 8),
                            Text(
                              description,
                              style: TextStyles.getTextStyle(
                                16,
                                FontWeight.w400,
                                Colors.grey,
                              ),
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                            ),
                            const SizedBox(height: 16),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  children: [
                                    NutritionInfo(
                                      icon: Image.asset(
                                        'assets/carbs_icon.png',
                                        width: 50,
                                        height: 50,
                                      ),
                                      value: '65g',
                                      label: 'carbs',
                                    ),
                                    NutritionInfo(
                                      icon: Image.asset(
                                        'assets/protiens_icon.png',
                                        width: 50,
                                        height: 50,
                                      ),
                                      value: '27g',
                                      label: 'protein',
                                    ),
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  children: [
                                    NutritionInfo(
                                      icon: Image.asset(
                                        'assets/calories_icon.png',
                                        width: 50,
                                        height: 50,
                                      ),
                                      value: '120',
                                      label: 'kcal   ',
                                    ),
                                    NutritionInfo(
                                      icon: Image.asset(
                                        'assets/fats_icon.png',
                                        width: 50,
                                        height: 50,
                                      ),
                                      value: '91g',
                                      label: 'fat       ',
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            const SizedBox(height: 24),
                            CustomSegmentedControl(),
                            const SizedBox(height: 16),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "Ingredients",
                                      style: TextStyles.getTextStyle(
                                        25,
                                        FontWeight.w800,
                                        const Color(0xFF0A2533),
                                      ),
                                    ),
                                    Text(
                                      'Add All to Cart',
                                      style: TextStyles.getTextStyle(
                                        20,
                                        FontWeight.w800,
                                        const Color(0xFF70B9BE),
                                      ),
                                    ),
                                  ],
                                ),
                                Text(
                                  '6 Item',
                                  style: TextStyles.getTextStyle(
                                    16,
                                    FontWeight.w800,
                                    Colors.grey,
                                  ),
                                ),
                              ],
                            ),
                            const IngredientsList(),
                            const SizedBox(height: 8),
                            Container(
                              margin: const EdgeInsets.all(16),
                              width: double.infinity,
                              height: 70,
                              decoration: BoxDecoration(
                                color: const Color(0xFF70B9BE),
                                borderRadius: const BorderRadius.all(
                                  Radius.circular(25),
                                ),
                              ),
                              child: TextButton(
                                onPressed: () {},
                                child: Text(
                                  'Add To Cart',
                                  style: TextStyles.getTextStyle(
                                    20,
                                    FontWeight.w700,
                                    Colors.white,
                                  ),
                                ),
                              ),
                            ),

                            CreatorTile(
                              image: 'assets/Person2.png',
                              name: 'Natalia Luca',
                              heading: 'Creator',
                              description: "I'm the author and recipe developer",
                            ),

                            const SizedBox(height: 24),
                            PopularRecipeSection(
                              cardHeight: 180,
                              text: 'See All',
                              imageHeight: 84,
                              cardWidth: 160,
                              viewportFraction: 0.35,
                              text1: 'Related Recipes',
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
