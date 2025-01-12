import 'package:flutter/material.dart';
import 'package:foodie/components/TextStyle.dart';
import 'package:foodie/services/ProductDetails.dart';
import 'package:provider/provider.dart';
import 'package:foodie/components/FAB.dart';
import 'package:foodie/components/bottomNavigationBar.dart';
import 'package:foodie/components/creatorTile.dart';
import 'package:foodie/components/favouritesTile.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  int _currentIndex = 3;

  @override
  Widget build(BuildContext context) {
    final productProvider = Provider.of<ProductProvider>(context);

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(32.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Account',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    IconButton(
                      icon: const Icon(Icons.settings),
                      onPressed: () {},
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),              
              Material(
                elevation: 4,
                child: CreatorTile(
                  image: 'assets/Person3.png',
                  name: 'Alena Sabyan',
                  description: 'Recipe Developer',
                  heading: '',
                ),
              ),
              const SizedBox(height: 20),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'My Favourites',
                    style: TextStyles.getTextStyle(25, FontWeight.w800, Color(0xFF0A2533)),
                  ),
                  Text(
                    'See All',
                    style: TextStyles.getTextStyle(20, FontWeight.w800, Color(0xFF70B9BE)),
                  ),
                ],
              ),
              Expanded(
                child: productProvider.isLoading
                    ? const Center(child: CircularProgressIndicator())
                    : productProvider.products.isEmpty
                        ? const Center(child: Text('No recipes found'))
                        : GridView.builder(
                            padding: const EdgeInsets.all(8),
                            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              childAspectRatio: 0.8,
                              crossAxisSpacing: 10,
                              mainAxisSpacing: 10,
                            ),
                            itemCount: productProvider.products.length,
                            itemBuilder: (context, index) {
                              final recipe = productProvider.products[index];
                              return FavouritesTile(
                                imageUrl: recipe['image'] ?? '',
                                title: recipe['title'] ?? '',
                                authorName: 'James Spader',
                                authorAvatarUrl: 'assets/Person.png',
                                description: recipe['description'] ?? '',
                              );
                            },
                          ),
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
