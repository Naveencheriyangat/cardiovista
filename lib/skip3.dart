import 'package:flutter/material.dart';
import 'start.dart';
import 'skip2.dart'; // Import the skip2.dart file

void main() {
  runApp(const Last());
}

class Last extends StatelessWidget {
  const Last({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Cardio Vista',
      theme: ThemeData(
        primarySwatch: Colors.red,
        scaffoldBackgroundColor: Colors.white, // Set background color to white//hi
      ),
      home: CardioVistaHomePage(),
    );
  }
}

class CardioVistaHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onHorizontalDragEnd: (details) {
        if (details.primaryVelocity != null) {
          // Detect if drag velocity is positive (swiping from left to right)
          if (details.primaryVelocity! > 0) {
            // Swipe from left to right, navigate to skip2.dart
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Frontt()),
            );
          } else {
            // Swipe from right to left, navigate to previous page
            Navigator.pop(context);
          }
        }
      },
      child: Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: Center(
                child: Image.asset(
                  'assets/images/main3.png', // Provide your image path here
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
                      'assets/images/ellip.png', // Provide the path for the Ellipse image here
                      width: 400, // Adjust width as needed
                      height: 400, // Adjust height as needed
                    ),
                  ),
                  Center(
                    child: Text(
                      "Uncover your heart health, just for you",
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
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Login()),
                      );
                    },
                    child: Text(
                      'Skip',
                      style: TextStyle(color: Colors.black),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
