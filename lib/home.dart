import 'package:flutter/material.dart';
import 'package:foodie/components/FAB.dart';
import 'package:foodie/components/ProductCarousel.dart';
import 'package:foodie/components/TextStyle.dart';
import 'package:foodie/components/bottomNavigationBar.dart';

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
        leading: SizedBox.shrink(),
        toolbarHeight: 34,        
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 16),
                  
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Image.asset(
                            'assets/sun_icon.png',
                            width: 25,
                            height: 25,
                          ),
                          const SizedBox(width: 8), 
                          Text(
                            'Good Morning',
                            style: TextStyles.getTextStyle(20, FontWeight.w400, Color(0xFF0A2533)),                        
                          ),
                        ],
                      ),
                      Image.asset(
                        'assets/cart_icon.png',
                        width: 29,
                        height: 29,
                      )
                    ],
                  ),
                  
                  
                  Text(
                    'Alena Sabyan',
                    style: TextStyles.getTextStyle(28, FontWeight.w800, Color(0xFF0A2533)),
                  ),
                  
                  SizedBox(height: 24), 
                  
                  //Featured
                  Container(
                    width: double.infinity,
                    height: 300,                    
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Featured',
                          style: TextStyles.getTextStyle(25, FontWeight.w800, Color(0xFF0A2533)),
                        ),
                        const SizedBox(height: 20),
                        SizedBox(
                          height: 200,
                          child: ProductCarousel(width: 320, isBackgroundImage: false,),
                        ),
                      ],
                    ),
                  ),

                  SizedBox(height: 8,),

                  //category
                  SizedBox(
                    width: double.infinity,
                    height: 130,                                      
                    child: Column(                      
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('Category',
                              style: TextStyles.getTextStyle(25, FontWeight.w800, Color(0xFF0A2533)),
                            ),
                        
                            Text('See All',
                              style: TextStyles.getTextStyle(20, FontWeight.w800, Color(0xFF70B9BE)),
                            )
                          ],
                        ),

                        const SizedBox(height: 16,),

                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            SizedBox(
                              width: 140,
                              height: 50,
                              child: ElevatedButton(     
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Color(0xFF70B9BE)
                                ),                                                   
                                onPressed: () {}, 
                                child: Text('Breakfast',
                                  style: TextStyles.getTextStyle(22, FontWeight.w400, Colors.white),
                                )
                              ),
                            ),

                            SizedBox(
                              width: 110,
                              height: 50,
                              child: ElevatedButton(     
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Color(0xFFF1F5F5)
                                ),                                                   
                                onPressed: () {}, 
                                child: Text('Lunch',
                                  style: TextStyles.getTextStyle(22, FontWeight.w400, Color(0xFF0A2533)),
                                )
                              ),
                            ),

                            SizedBox(
                              width: 120,
                              height: 50,
                              child: ElevatedButton(     
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Color(0xFFF1F5F5)
                                ),                                                   
                                onPressed: () {}, 
                                child: Text('Dinner',
                                  style: TextStyles.getTextStyle(22, FontWeight.w400, Color(0xFF0A2533)),
                                )
                              ),
                            ),
                          ],
                        )
                      ],
                    ),                  
                  ),

                  const SizedBox(height: 16,),

                  SizedBox(
                    width: double.infinity,
                    height: 270,                      
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Popular Recepies',
                            style: TextStyles.getTextStyle(25, FontWeight.w800, Color(0xFF0A2533)),
                          ),
                          const SizedBox(height: 16,),
                          
                          Expanded(
                            child: ProductCarousel(width: 280, isBackgroundImage: true,)
                          ),
                        ],
                      ),
                  )
                ],
              ),
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
);}}