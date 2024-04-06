import 'package:flutter/material.dart';

void main() => runApp(const ProfilePage());

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

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
  _MyLoginPageState createState() => _MyLoginPageState();
}

class _MyLoginPageState extends State<MyLoginPage> {
  late TextEditingController ageController;
  late TextEditingController weightController;
  late TextEditingController heightController;
  late TextEditingController bpController;
  late TextEditingController bioController;
  late TextEditingController chestPainController;
  late TextEditingController palpitationController;
  late TextEditingController surgeryController;
  late TextEditingController diseasesController;
  bool _isSignInHovered = false;
  bool _isBackHovered = false;

  @override
  void initState() {
    ageController = TextEditingController();
    weightController = TextEditingController();
    heightController = TextEditingController();
    bpController = TextEditingController();
    bioController = TextEditingController();
    chestPainController = TextEditingController();
    palpitationController = TextEditingController();
    surgeryController = TextEditingController();
    diseasesController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    ageController.dispose();
    weightController.dispose();
    heightController.dispose();
    bpController.dispose();
    bioController.dispose();
    chestPainController.dispose();
    palpitationController.dispose();
    surgeryController.dispose();
    diseasesController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'CREATE PROFILE',
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
              SizedBox(height: 16),
              Center(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(height: 8),
                    buildTextField('Age', ageController),
                    SizedBox(height: 8),
                    buildTextField('Weight', weightController),
                    SizedBox(height: 8),
                    buildTextField('Height', heightController),
                    SizedBox(height: 8),
                    buildTextField('Hyper tension/BP', bpController),
                    SizedBox(height: 8),
                    buildTextField('Bio', bioController),
                    SizedBox(height: 8),
                    buildTextField('Chest Pain', chestPainController),
                    SizedBox(height: 8),
                    buildTextField('Palpitation', palpitationController),
                    SizedBox(height: 8),
                    buildTextField('Surgery If Any', surgeryController),
                    SizedBox(height: 8),
                    buildTextField('Any Other Diseases', diseasesController),
                    const SizedBox(height: 20),
                    SizedBox(
                      width: double.infinity,
                      height: 50,
                      child: MouseRegion(
                        onEnter: (_) => setState(() => _isSignInHovered = true),
                        onExit: (_) => setState(() => _isSignInHovered = false),
                        child: ElevatedButton(
                          onPressed: () {},
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
                              'SAVE',
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
                              'BACK',
                              style: TextStyle(color: Colors.black),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildTextField(String labelText, TextEditingController controller) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Color(0xFFAA1F24)),
        borderRadius: BorderRadius.circular(10),
      ),
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          labelText: labelText,
          labelStyle: TextStyle(color: Color(0xFFAA1F24)),
          contentPadding: EdgeInsets.symmetric(vertical: 12, horizontal: 16),
          border: InputBorder.none,
        ),
      ),
    );
  }
}
