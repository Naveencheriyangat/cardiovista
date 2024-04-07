import 'package:flutter/material.dart';
import 'skip3.dart';

void main() {
  runApp(const Frontt());
}

class Frontt extends StatelessWidget {
  const Frontt({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Cardio Vista',
      theme: ThemeData(
        primarySwatch: Colors.red,
        scaffoldBackgroundColor: Colors.white, // Set background color to white//hi
      ),
      home: SwipeNavigation(),
    );
  }
}

class SwipeNavigation extends StatefulWidget {
  @override
  _SwipeNavigationState createState() => _SwipeNavigationState();
}

class _SwipeNavigationState extends State<SwipeNavigation> {
  late PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _pageController,
        physics: BouncingScrollPhysics(), // Use BouncingScrollPhysics for smoother navigation
        onPageChanged: (int index) {
          if (index == 0) { // Check if swiped to the leftmost page
            Navigator.pushReplacement( // Navigate to main.dart
              context,
              MaterialPageRoute(builder: (context) => Frontt()),
            );
          }
        },
        children: [
          CardioVistaHomePage(),
          Container(color: Colors.transparent), // Placeholder for next page
        ],
      ),
    );
  }
}

class CardioVistaHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Center(
              child: Image.asset(
                'assets/images/main2.png', // Provide your image path here
                width: 400, // Adjust width as needed
                height: 400, // Adjust height as needed
              ),
            ),
          ),
          SizedBox(height: 10,),
          Expanded(
            child: Stack(
              children: [
                Center(
                  child: Image.asset(
                    'assets/images/cloud.png', // Provide the path for the Ellipse image here
                    width: 400, // Adjust width as needed
                    height: 400, // Adjust height as needed
                  ),
                ),
                Center(
                  child: Text(
                    "Explore live heart tracking magic",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextButton(
                  onPressed: () {
               // Not doing anything for Skip button as navigation is handled by swiping
                  },
                  child: Text(
                    'Skip',
                    style: TextStyle(color: Colors.black),
                  ),
                ),
                TextButton(
                  onPressed: () {
                      Navigator.push( // Navigate to Sign Up page
                    context,
                    MaterialPageRoute(builder: (context) => Last()),
                  );
                  },
                  child: Text(
                    'Next',
                    style: TextStyle(color: Colors.black),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
