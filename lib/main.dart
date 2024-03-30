import 'package:flutter/material.dart';
import 'start.dart';
import 'skip2.dart';

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
      home: CardioVistaHomePage(),
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
                'assets/images/main.jpg', // Provide your image path here
                width: 200, // Adjust width as needed
                height: 200, // Adjust height as needed
              ),
            ),
          ),
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
                      Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => Frontt()),
                        );
                  },
                  child: Text(
                    'Skip',
                    style: TextStyle(color: Colors.black),
                  ),
                ),
                TextButton(
                  onPressed: () {
                     Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => Login()),
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
