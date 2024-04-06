
import 'package:flutter/material.dart';
import 'skip2.dart';
import 'start.dart';
void main() {
  runApp(const Front());
}

class Front extends StatelessWidget {
  const Front({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Cardio Vista',
      theme: ThemeData(
        primarySwatch: Colors.red,
        scaffoldBackgroundColor: Colors.white, // Set background color to white
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
    return Material(
      color: Colors.transparent, // Set background color to transparent
      child: PageView(
        controller: _pageController,
        physics: BouncingScrollPhysics(), // Use BouncingScrollPhysics for smoother navigation
        onPageChanged: (int index) {
          if (index == 1) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Frontt()),
            );
          }
        },
        children: [
          CardioVistaHomePage(),
          Container(color: Colors.transparent), // Placeholder for Frontt page
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
          SizedBox(height: 30,),
          Expanded(
            child: Center(
              child: Image.asset(
                'assets/images/main.jpg', // Provide your image path here
                width: 400, // Adjust width as needed
                height: 400, // Adjust height as needed
              ),
            ),
          ),
          SizedBox(height: 5,),
          Expanded(
            child: Stack(
              children: [
                Center(
                  child: Image.asset(
                    'assets/images/Ellipse.png', // Provide the path for the Ellipse image here
                    width: 400, // Adjust width as needed
                    height: 400, // Adjust height as needed
                  ),
                ),
                Center(
                  child: Text(
                    "Your heart's health at your fingertips!",
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
                    Navigator.push( // Navigate to Sign In page
                    context,
                    MaterialPageRoute(builder: (context) => Login()),
                  );// Not doing anything for Skip button as navigation is handled by swiping
                  },
                  child: Text(
                    'Skip',
                    style: TextStyle(color: Colors.black),
                  ),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.push( // Navigate to Sign In page
                    context,
                    MaterialPageRoute(builder: (context) => Frontt()),
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

class _pageController {
}
