import 'package:flutter/material.dart';
import 'start.dart';

void main() {
  runApp(const last());
}

class last extends StatelessWidget {
  const last({Key? key}) : super(key: key);

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
                'assets/images/main3.png', // Provide your image path here
                width: 200, // Adjust width as needed
                height: 200, // Adjust height as needed
              ),
            ),
          ),
           SizedBox(height: 30,),
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
                   //  Navigator.push(
                      //    context,
                       //   MaterialPageRoute(builder: (context) => CardioVistaApp()),
                       // );// Add functionality for 'skip' button here
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
                        );// Add functionality for 'next' button here
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
