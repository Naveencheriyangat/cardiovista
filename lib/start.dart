import 'package:flutter/material.dart';
import 'sign.dart'; // Import the Sign In page
import 'reg.dart';

void main() {
  runApp(const Login());
}

class Login extends StatelessWidget {
  const Login({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Cardio Vista',
      theme: ThemeData(
        primarySwatch: Colors.red,
        scaffoldBackgroundColor: Color.fromARGB(255, 240, 251, 255),
      ),
      home: CardioVistaHomePage(),
    );
  }
}

class HoverButton extends StatefulWidget {
  final String text;
  final VoidCallback onPressed;

  const HoverButton({
    Key? key,
    required this.text,
    required this.onPressed,
  }) : super(key: key);

  @override
  _HoverButtonState createState() => _HoverButtonState();
}

class _HoverButtonState extends State<HoverButton> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (event) => _onHover(true),
      onExit: (event) => _onHover(false),
      child: ElevatedButton(
        onPressed: widget.onPressed,
        child: Text(widget.text),
        style: ElevatedButton.styleFrom(
          backgroundColor: _isHovered ? Colors.red : Theme.of(context).scaffoldBackgroundColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
            side: BorderSide(color: Color(0xFFAA1F24)),
          ),
        ),
      ),
    );
  }

  void _onHover(bool isHovered) {
    setState(() {
      _isHovered = isHovered;
    });
  }
}

class CardioVistaHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
  title: Row(
    mainAxisAlignment: MainAxisAlignment.end,
    children: [
      Text('Cardio ', style: TextStyle(color: Colors.black, fontSize: 18.0, fontWeight: FontWeight.bold)),
      Text('Vista', style: TextStyle(color: Color(0xFFAA1F24), fontSize: 18.0, fontWeight: FontWeight.bold)),
    ],
  ),
  elevation: 5,
  shadowColor: Colors.black,
  leading: Container(
    padding: EdgeInsets.all(8.0), // Add padding for better clarity
    child: Image.asset(
      'assets/images/Logo.png',
      height: 40, // Adjust the height as needed for clarity
    ),
  ),
),

      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Heart-shaped logo (you can replace this with your own image)
            Image.asset('assets/images/heartlogo.png', width: 150, height: 150),
            SizedBox(height: 10),
            Text(
              'Cardio Vista',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Text(
                'Create an account to get started on your health and happiness journey.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey[600],
                ),
              ),
            ),
            SizedBox(height: 10),
            SizedBox( 
              width: 200, // Set desired width
              child: HoverButton(
                text: 'SIGN IN',
                onPressed: () {
                  Navigator.push( // Navigate to Sign In page
                    context,
                    MaterialPageRoute(builder: (context) => SignIn()),
                  );
                },
              ),
            ),
            SizedBox(height: 10),
            SizedBox( // Wrap the buttons with SizedBox to control width
              width: 200, // Set desired width
              child: HoverButton(
                text: 'SIGN UP',
                onPressed: () {
                  Navigator.push( // Navigate to Sign Up page
                    context,
                    MaterialPageRoute(builder: (context) => RegisterPage()),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
