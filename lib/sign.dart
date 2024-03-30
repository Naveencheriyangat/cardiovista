import 'package:flutter/material.dart';
import 'hom.dart'; // Import the file you want to navigate to
import 'start.dart';

void main() => runApp(const SignIn());

class SignIn extends StatelessWidget {
  const SignIn({Key? key}) : super(key: key);

  static const String _title = 'Cardio Vista Login';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: _title,
      theme: ThemeData(
        primarySwatch: Colors.red,
        scaffoldBackgroundColor: Color.fromARGB(255, 240, 251, 255),
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text('Cardio ', style: TextStyle(color: Colors.black)),
              Text('Vista', style: TextStyle(color: Color(0xFFAA1F24))),
            ],
          ),
          elevation: 5,
          shadowColor: Colors.black,
           leading: Container(
          child: Image.asset('assets/images/Logo.png')),
        ),
        body: Center(
          child: MyLoginPage(),
        ),
      ),
    );
  }
}

class MyLoginPage extends StatefulWidget {
  const MyLoginPage({Key? key}) : super(key: key);

  @override
  _MyLoginPageState createState() => _MyLoginPageState();
}

class _MyLoginPageState extends State<MyLoginPage> {
  late TextEditingController emailController;
  late TextEditingController passwordController;
  bool _isSignInHovered = false;
  bool _isBackHovered = false;
  bool _isPasswordValid = true; // Flag to track password validation

  @override
  void initState() {
    emailController = TextEditingController();
    passwordController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  // Function to validate password
  bool _isPasswordCompliant(String password) {
    if (password.length < 10) {
      return false;
    }
    // Regular expressions to check for capital letter and digit
    final RegExp hasCapitalLetter = RegExp(r'[A-Z]');
    final RegExp hasDigit = RegExp(r'\d');
    return hasCapitalLetter.hasMatch(password) && hasDigit.hasMatch(password);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Color(0xFFAA1F24)),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            spreadRadius: 5,
            blurRadius: 5,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                alignment: Alignment.topLeft,
                padding: EdgeInsets.only(top: 20),
                child: Text(
                  'SIGN IN',
                  style: TextStyle(
                    color: Color(0xFFAA1F24),
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    shadows: [
                      Shadow(
                        color: Colors.black.withOpacity(0.5),
                        offset: Offset(2, 2),
                        blurRadius: 2,
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 20),
              const Text(
                'Welcome back you are just one step away to your feed',
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              const SizedBox(height: 20),
              Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Color(0xFFAA1F24)),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: TextFormField(
                  controller: emailController,
                  style: TextStyle(color: Color(0xFFAA1F24)),
                  decoration: InputDecoration(
                    labelText: 'Email',
                    labelStyle: TextStyle(color: Color(0xFFAA1F24)),
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.symmetric(
                      vertical: 12,
                      horizontal: 16,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 16),
              Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Color(0xFFAA1F24)),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: TextFormField(
                  controller: passwordController,
                  style: TextStyle(color: Color(0xFFAA1F24)),
                  decoration: InputDecoration(
                    labelText: 'Password',
                    labelStyle: TextStyle(color: Color(0xFFAA1F24)),
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.symmetric(
                      vertical: 12,
                      horizontal: 16,
                    ),
                    errorText: _isPasswordValid ? null : 'Password must have at least 10 characters, one capital letter, and one digit.',
                  ),
                  onChanged: (value) {
                    setState(() {
                      _isPasswordValid = _isPasswordCompliant(value);
                    });
                  },
                ),
              ),
              const SizedBox(height: 20),
              SizedBox(
                width: double.infinity,
                height: 50,
                child: MouseRegion(
                  onEnter: (_) => setState(() => _isSignInHovered = true),
                  onExit: (_) => setState(() => _isSignInHovered = false),
                  child: ElevatedButton(
                    onPressed: () {
                      if (_isPasswordCompliant(passwordController.text)) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => CardioVistaApp()),
                        );
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      foregroundColor: _isSignInHovered ? Colors.black : Colors.white,
                      backgroundColor: _isSignInHovered ? Color(0xFFAA1F24) : Color.fromARGB(255, 240, 251, 255),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                        side: BorderSide(color: Color(0xFFAA1F24)),
                      ),
                    ),
                    child: const Padding(
                      padding: EdgeInsets.all(12.0),
                      child: Text(
                        'Sign In',
                        style: TextStyle(color: Colors.black), // Set text color to black
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 8),
              SizedBox(
                width: double.infinity,
                height: 50,
                child: MouseRegion(
                  onEnter: (_) => setState(() => _isBackHovered = true),
                  onExit: (_) => setState(() => _isBackHovered = false),
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Login()),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      foregroundColor: _isBackHovered ? Colors.black : Colors.white,
                      backgroundColor: _isBackHovered ? Color(0xFFAA1F24) : Color.fromARGB(255, 240, 251, 255),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                        side: BorderSide(color: Color(0xFFAA1F24) ),
                      ),
                    ),
                    child: const Padding(
                      padding: EdgeInsets.all(12.0),
                      child: Text(
                        'Back',
                        style: TextStyle(color: Colors.black), // Set text color to black
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
