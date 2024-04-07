import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

void main() => runApp(ProfilePage());

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
      home: Login(),
    );
  }
}

class Login extends StatelessWidget {
  const Login({Key? key}) : super(key: key);

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
          padding: EdgeInsets.all(8.0),
          child: Image.asset(
            'assets/images/Logo.png',
            height: 40,
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
  late TextEditingController nameController;
  late TextEditingController dobController;
  late TextEditingController numberController;
  late TextEditingController ageController;
  late TextEditingController weightController;
  late TextEditingController heightController;
  late TextEditingController bpController;
  late TextEditingController bioController;
  late TextEditingController chestPainController;
  late TextEditingController palpitationController;
  late TextEditingController surgeryController;
  late TextEditingController diseasesController;
  late TextEditingController useridController;
  late TextEditingController sexController;

  // Declare hover state variables
  bool _isSignInHovered = false;
  bool _isBackHovered = false;

  @override
  void initState() {
    nameController = TextEditingController();
    dobController = TextEditingController();
    numberController = TextEditingController();
    ageController = TextEditingController();
    weightController = TextEditingController();
    heightController = TextEditingController();
    bpController = TextEditingController();
    bioController = TextEditingController();
    chestPainController = TextEditingController();
    palpitationController = TextEditingController();
    surgeryController = TextEditingController();
    diseasesController = TextEditingController();
    useridController = TextEditingController();
    sexController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    nameController.dispose();
    dobController.dispose();
    numberController.dispose();
    ageController.dispose();
    weightController.dispose();
    heightController.dispose();
    bpController.dispose();
    bioController.dispose();
    chestPainController.dispose();
    palpitationController.dispose();
    surgeryController.dispose();
    diseasesController.dispose();
    useridController.dispose();
    sexController.dispose();
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
                    buildTextField('Name', nameController),
                    SizedBox(height: 8),
                    buildDatePickerField('Dob', dobController),
                    SizedBox(height: 8),
                    buildPhoneNumberField('Phone number', numberController), // Modified to accept only numeric input
                    SizedBox(height: 8),
                    buildTextField('Age', ageController), // Modified to accept only numeric input
                    SizedBox(height: 8),
                    buildTextField('Weight', weightController), // Modified to accept only numeric input
                    SizedBox(height: 8),
                    buildTextField('Height', heightController), // Modified to accept only numeric input
                    SizedBox(height: 8),
                    buildDropdownField('Sex', sexController, ['Male', 'Female', 'Other']),
                    SizedBox(height: 8),
                    buildDropdownField('Hyper tension bp', bpController, ['yes', 'no']),
                    SizedBox(height: 8),
                    buildDropdownField('Chest Pain', chestPainController, ['yes', 'no']),
                    SizedBox(height: 8),
                    buildDropdownField('Palpitation', palpitationController, ['yes', 'no']),
                    SizedBox(height: 8),
                    buildDropdownField('Surgery', surgeryController,['yes' , 'no']),
                    SizedBox(height: 8),
                    buildResizableTextField('Any other', diseasesController),
                    SizedBox(height: 8),
                    buildDropdownField('User id', useridController, ['admin','anelbabu','adheena','gopesh']),
                    SizedBox(height: 20),
                    SizedBox(
                      width: double.infinity,
                      height: 50,
                      child: MouseRegion(
                        onEnter: (_) => setState(() => _isSignInHovered = true),
                        onExit: (_) => setState(() => _isSignInHovered = false),
                        child: ElevatedButton(
                          onPressed: () {
                            submitData();
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
                              'SAVE',
                              style: TextStyle(color: Colors.black), // Set text color to black
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 8),
                    SizedBox(
                      width: double.infinity,
                      height: 50,
                      child: MouseRegion(
                        onEnter: (_) => setState(() => _isBackHovered = true),
                        onExit: (_) => setState(() => _isBackHovered = false),
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.pop(context); // Use Navigator.pop instead of Navigator.push to go back
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
      child: TextFormField(
        controller: controller,
        keyboardType: TextInputType.text,
        decoration: InputDecoration(
          labelText: labelText,
          labelStyle: TextStyle(color: Color(0xFFAA1F24)),
          contentPadding: EdgeInsets.symmetric(vertical: 12, horizontal: 16),
          border: InputBorder.none,
        ),
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Please enter a value';
          }
          return null;
        },
      ),
    );
  }
  Widget buildDatePickerField(String labelText, TextEditingController controller) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Color(0xFFAA1F24)),
        borderRadius: BorderRadius.circular(10),
      ),
      child: TextFormField(
        controller: controller,
        decoration: InputDecoration(
          labelText: labelText,
          labelStyle: TextStyle(color: Color(0xFFAA1F24)),
          contentPadding: EdgeInsets.symmetric(vertical: 12, horizontal: 16),
          border: InputBorder.none,
          suffixIcon: IconButton(
            icon: Icon(Icons.calendar_today),
            onPressed: () async {
              final DateTime? pickedDate = await showDatePicker(
                context: context,
                initialDate: DateTime.now(),
                firstDate: DateTime(1900),
                lastDate: DateTime.now(),
              );
              if (pickedDate != null) {
                setState(() {
                  controller.text = pickedDate.toString().split(' ')[0];
                });
              }
            },
          ),
        ),
        readOnly: true,
      ),
    );
  }
  Widget buildResizableTextField(String labelText, TextEditingController controller) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Color(0xFFAA1F24)),
        borderRadius: BorderRadius.circular(10),
      ),
      child: TextFormField(
        controller: controller,
        decoration: InputDecoration(
          labelText: labelText,
          labelStyle: TextStyle(color: Color(0xFFAA1F24)),
          contentPadding: EdgeInsets.symmetric(vertical: 12, horizontal: 16),
          border: InputBorder.none,
        ),
        keyboardType: TextInputType.multiline,
        maxLines: null,
      ),
    );
  }

Widget buildDropdownField(String labelText, TextEditingController controller, List<String> items) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Color(0xFFAA1F24)),
        borderRadius: BorderRadius.circular(10),
      ),
      child: DropdownButtonFormField(
        value: controller.text.isNotEmpty ? controller.text : null,
        onChanged: (newValue) {
          setState(() {
            controller.text = newValue.toString();
          });
        },
        items: items.map<DropdownMenuItem<String>>((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(value),
          );
        }).toList(),
        decoration: InputDecoration(
          labelText: labelText,
          labelStyle: TextStyle(color: Color(0xFFAA1F24)),
          contentPadding: EdgeInsets.symmetric(vertical: 12, horizontal: 16),
          border: InputBorder.none,
        ),
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Please select an option';
          }
          return null;
        },
      ),
    );
  }


  Widget buildPhoneNumberField(String labelText, TextEditingController controller) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Color(0xFFAA1F24)),
        borderRadius: BorderRadius.circular(10),
      ),
      child: TextFormField(
        controller: controller,
        keyboardType: TextInputType.phone,
        decoration: InputDecoration(
          labelText: labelText,
          labelStyle: TextStyle(color: Color(0xFFAA1F24)),
          contentPadding: EdgeInsets.symmetric(vertical: 12, horizontal: 16),
          border: InputBorder.none,
        ),
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Please enter a valid phone number';
          }
          return null;
        },
      ),
    );
  }

  // Other Widget builders remain unchanged...

  void submitData() async {
    final name = nameController.text;
    final dob = dobController.text;
    final number = numberController.text;
    final age = ageController.text;
    final weight = weightController.text;
    final height = heightController.text;
    final sex = sexController.text;
    final bp = bpController.text;
    final chestPain = chestPainController.text;
    final palpitation = palpitationController.text;
    final surgery = surgeryController.text;
    final diseases = diseasesController.text;
    final userid = useridController.text;

    final body = {
      "name": name,
      "dob": dob,
      "phone_number": number,
      "age": age,
      "weight": weight,
      "height": height,
      "sex": sex,
      "hyper_tension_bp": bp,
      "chest_pain": chestPain,
      "palpitation": palpitation,
      "surgery": surgery,
      "any_other": diseases,
      "user_id": userid,
      
    };
    print(body);

    final url = 'http://127.0.0.1:8000/patient_details/Pcreate';
    final uri = Uri.parse(url);

    try {
      final response = await http.post(
        uri,
        body: jsonEncode(body),
        headers: {'Content-Type': 'application/json'},
      );

      if (response.statusCode == 200) {
        // Request successful
        print('Data submitted successfully');
        // Handle response data if needed
      } else {
        // Request failed with an error status code
        print('Failed to submit data. Status code: ${response.statusCode}');
        // Handle error response if needed
      }
    } catch (e) {
      // An error occurred during the request
      print('Error submitting data: $e');
      // Handle error if needed
    }
  }
}
