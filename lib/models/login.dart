import 'package:flutter/material.dart';
import 'package:foodie/models/home.dart';
import 'package:foodie/services/ProductDetails.dart';
import 'package:provider/provider.dart';
import '../components/TextStyle.dart';
import '../components/CustomButton.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  @override
  void initState() {
    super.initState();
    Provider.of<ProductProvider>(context, listen: false).fetchProducts();
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [          
          Container(color: const Color(0xFF70B9BE)),
          
          Positioned.fill(
            top: 20,
            child: Image.asset(
              'assets/Pattern.png',
              fit: BoxFit.fitHeight,
              color: const Color(0xFF3DA0A7),
            ),
          ),

          
          Positioned(
            top: 60,
            left: 360,
            width: 60,
            height: 28,
            child: Text(
              'Later',
              style: TextStyles.getTextStyle(24, FontWeight.w800, const Color(0xFFE6EBF2)),
            ),
          ),
          
          ...buildImages(),
          
          Positioned(
            top: 630,
            left: 52.5,
            width: 343,
            height: 85,
            child: Text(
              'Help your path to health goals with happiness',
              textAlign: TextAlign.center,
              style: TextStyles.getTextStyle(32, FontWeight.w900, Colors.white),
            ),
          ),

          // Buttons
          Positioned(
            top: 740,
            left: 52.5,
            width: 343,
            height: 128,
            child: Column(
              children: [
                 CustomButton(
                  text: 'Login',
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage()));
                  },
                  color: const Color(0xFF042628),
                ),
                const SizedBox(height: 10),
                TextButton(
                  onPressed: () {},
                  child: Text(
                    'Create New Account',
                    style: TextStyles.getTextStyle(20, FontWeight.w700, Colors.white),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  List<Widget> buildImages() {
    return [
      Positioned(
        top: 240,
        left: 75,
        width: 82,
        height: 72,
        child: Image.asset('assets/Group1.png'),
      ),
      Positioned(
        top: 230,
        left: 190,
        width: 5,
        height: 6,
        child: Image.asset('assets/Vector1.png'),
      ),
      Positioned(
        top: 280,
        left: 210,
        width: 6,
        height: 6,
        child: Image.asset('assets/Ellipse1.png'),
      ),
      Positioned(
        top: 330,
        left: 80,
        width: 7,
        height: 7,
        child: Image.asset('assets/Ellipse1.png'),
      ),
      Positioned(
        top: 320,
        left: 170,
        width: 3.7,
        height: 3.84,
        child: Image.asset('assets/Ellipse1.png'),
      ),
      Positioned(
        top: 300,
        left: 40,
        width: 12,
        height: 16,
        child: Image.asset('assets/Group8.png'),
      ),
      Positioned(
        width: 86.46,
        height: 79.96,
        top: 245,
        left: 300,
        child: Image.asset('assets/Group4.png'),
      ),
      Positioned(
        top: 220,
        left: 320,
        width: 7,
        height: 7,
        child: Image.asset('assets/Ellipse1.png'),
      ),
      Positioned(
        top: 260,
        left: 400,
        width: 13,
        height: 16,
        child: Image.asset('assets/Group9.png'),
      ),
      Positioned(
        top: 363,
        left: 133,
        height: 46,
        width: 47,
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            Positioned(
              height: 46,
              width: 47,
              top: 0,
              left: 0,
              child: Image.asset('assets/Group3.png'),
            ),
            Positioned(
              height: 46,
              width: 47,
              top: 23,
              left: 0,
              child: Image.asset('assets/Group2.png'),
            ),
          ],
        ),
      ),
      Positioned(
        width: 10,
        height: 11,
        top: 390,
        left: 210,
        child: Image.asset('assets/Vector6.png'),
      ),
      Positioned(
        width: 9,
        height: 9,
        top: 425,
        left: 120,
        child: Image.asset('assets/Ellipse1.png'),
      ),
      Positioned(
        width: 47.8,
        height: 47.8,
        top: 360,
        left: 260,
        child: Image.asset('assets/Group5.png'),
      ),
      Positioned(
        width: 5,
        height: 5,
        top: 330,
        left: 290,
        child: Image.asset('assets/Vector3.png'),
      ),
      Positioned(
        width: 9,
        height: 9,
        top: 440,
        left: 310,
        child: Image.asset('assets/Ellipse1.png'),
      ),
      Positioned(
        width: 9,
        height: 9,
        top: 410,
        left: 400,
        child: Image.asset('assets/Ellipse1.png'),
      ),
      Positioned(
        width: 130,
        height: 103,
        top: 448,
        left: 267,
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            Positioned(
              width: 20,
              height: 70,
              top: -45,
              left: 90,
              child: Image.asset('assets/Vector2.png'),
            ),
            Positioned(
              child: Image.asset('assets/Group6.png'),
            ),
          ],
        ),
      ),
      Positioned(
        top: 535,
        left: 355,
        width: 11,
        height: 8,
        child: Image.asset('assets/Vector5.png'),
      ),
      Positioned(
        width: 10,
        height: 9,
        top: 480,
        left: 50,
        child: Image.asset('assets/Vector4.png'),
      ),
      Positioned(
        width: 88,
        height: 90,
        top: 480,
        left: 90,
        child: Image.asset('assets/Group7.png'),
      ),
      Positioned(
        width: 15,
        height: 20,
        top: 560,
        left: 50,
        child: Image.asset('assets/Ellipse2.png'),
      ),
      Positioned(
        width: 3,
        height: 3,
        top: 505,
        left: 255,
        child: Image.asset('assets/Ellipse1.png'),
      ),
    ];
  }
}
