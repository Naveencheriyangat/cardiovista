import 'package:flutter/material.dart';
import 'sign.dart';


void main() => runApp(const RegisterPage());

class RegisterPage extends StatelessWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Cardio Vista',
      theme: ThemeData(
        primarySwatch: Colors.red,
        scaffoldBackgroundColor: Color.fromARGB(255, 240, 251, 255),
      ),
      home: const Login(),
    );
  }
}

class Login extends StatelessWidget {
  const Login({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
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
        child: MyLoginPage(),
      ),
    );
  }
}

class MyLoginPage extends StatefulWidget {
  const MyLoginPage({Key? key}) : super(key: key);

  @override
  _MyLoginPageState createState() => _MyLoginPageState();//hloo
}

class _MyLoginPageState extends State<MyLoginPage> {
  late TextEditingController emailController;
  late TextEditingController passwordController;
  bool _isSignInHovered = false;
  bool _isBackHovered = false;

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

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'SIGN UP',
            style: TextStyle(
              color:Color(0xFFAA1F24),
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
          SizedBox(height: 16),
          Text('Don\'t have an account? Create your account, it takes less than a minute'),
          SizedBox(height: 16),
          Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: 8),
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Color(0xFFAA1F24)),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: TextField(
                    decoration: InputDecoration(
                      labelText: 'First Name',
                       labelStyle: TextStyle(color: Color(0xFFAA1F24)),
                      contentPadding: EdgeInsets.symmetric(vertical: 12, horizontal: 16),
                      border: InputBorder.none,
                    ),
                  ),
                ),
                SizedBox(height: 8),
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Color(0xFFAA1F24)),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: TextField(
                    decoration: InputDecoration(
                      labelText: 'Last Name',
                       labelStyle: TextStyle(color: Color(0xFFAA1F24)),
                      contentPadding: EdgeInsets.symmetric(vertical: 12, horizontal: 16),
                      border: InputBorder.none,
                    ),
                  ),
                ),
                SizedBox(height: 8),
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Color(0xFFAA1F24)),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: TextField(
                    decoration: InputDecoration(
                      labelText: 'Email',
                       labelStyle: TextStyle(color: Color(0xFFAA1F24)),
                      contentPadding: EdgeInsets.symmetric(vertical: 12, horizontal: 16),
                      border: InputBorder.none,
                    ),
                  ),
                ),
                SizedBox(height: 8),
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Color(0xFFAA1F24)),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: TextField(
                    decoration: InputDecoration(
                      labelText: 'Password',
                       labelStyle: TextStyle(color: Color(0xFFAA1F24)),
                      contentPadding: EdgeInsets.symmetric(vertical: 12, horizontal: 16),
                      border: InputBorder.none,
                    ),
                    obscureText: true,
                  ),
                ),
                SizedBox(height: 8),
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Color(0xFFAA1F24)),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: TextField(
                    decoration: InputDecoration(
                      labelText: 'Confirm Password',
                       labelStyle: TextStyle(color: Color(0xFFAA1F24)),
                      contentPadding: EdgeInsets.symmetric(vertical: 12, horizontal: 16),
                      border: InputBorder.none,
                    ),
                    obscureText: true,
                  ),
                ),
                SizedBox(height: 8),
                Row(
                  children: [
                    Checkbox(
                      value: true, // Replace with your logic for accepting terms
                      onChanged: (bool? value) {
                        // Handle checkbox state
                      },
                    ),
                    Text('I accept the terms and privacy policy'),
                  ],
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
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => SignIn()),
                        );
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
                          'Next',
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
                          side: BorderSide(color: Color(0xFFAA1F24)),
                        ),
                      ),
                      child: const Padding(
                        padding: EdgeInsets.all(12.0),
                        child: Text(
                          'Back',
                          style: TextStyle(color: Colors.black),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        )
        ],
      ),
    );
  }
}