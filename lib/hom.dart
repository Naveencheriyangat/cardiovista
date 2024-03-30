import 'package:flutter/material.dart';
import 'package:flutter_application_2/doctorlist.dart';
import 'package:flutter_application_2/prev.dart';
import 'prof.dart';

void main() {
  runApp(CardioVistaApp());
}

class CardioVistaApp extends StatelessWidget {
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

class CardioVistaHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
      body: SingleChildScrollView( // Wrap the body with SingleChildScrollView
        child: Container(
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Colors.black12,
                spreadRadius: 5,
                blurRadius: 5,
                offset: Offset(0, 2),
              ),
            ],
          ),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                GestureDetector(
                  onTap: () {
                    // Navigate to search functionality
                  },
                  child: Container(
                    margin: EdgeInsets.all(20),
                    height: 50,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(color: Color(0xFFAA1F24), width: 2), // Reduced border width
                    ),
                    child: Material(
                      color: Color.fromARGB(255, 240, 251, 255),
                      borderRadius: BorderRadius.circular(20),
                      child: InkWell(
                        borderRadius: BorderRadius.circular(20),
                        onTap: () {
                          // Handle tap functionality
                        },
                        splashColor: Color(0xFFAA1F24),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Search',
                              style: TextStyle(color: Colors.black),
                            ),
                            Row(
                              children: [
                                Icon(Icons.search, color: Colors.black),
                                SizedBox(width: 8),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    // Navigate to Your Details page
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => YourDetailsPage()),
                    );
                  },
                  child: Container(
                    margin: EdgeInsets.all(20),
                    height: 100,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(color: Color(0xFFAA1F24), width: 2), // Reduced border width
                    ),
                    child: Material(
                      color:Color.fromARGB(255, 240, 251, 255),
                      borderRadius: BorderRadius.circular(20),
                      child: InkWell(
                        borderRadius: BorderRadius.circular(20),
                        onTap: () {
                          // Navigate to Your Details page
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => YourDetailsPage()),
                          );
                        },
                        splashColor: Color(0xFFAA1F24),
                        child: Center(
                          child: Text(
                            'Your Details',
                            style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 20),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => PatientListPage()));
                  },

                  child: Container(
                    margin: EdgeInsets.all(20),
                    height: 100,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(color: Color(0xFFAA1F24), width: 2), // Reduced border width
                    ),
                    child: Material(
                      color: Color.fromARGB(255, 240, 251, 255),
                      borderRadius: BorderRadius.circular(20),
                      child: InkWell(
                        borderRadius: BorderRadius.circular(20),
                        onTap: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => PatientListPage()));
                        },
                        splashColor: Color(0xFFAA1F24),
                        child: Center(
                          child: Text(
                            'Doctor History',
                            style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 20),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    // Navigate to record screen
                  },
                  child: Container(
                    margin: EdgeInsets.all(20),
                    height: 100,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(color: Color(0xFFAA1F24), width: 2), // Reduced border width
                    ),
                    child: Material(
                      color:Color.fromARGB(255, 240, 251, 255),
                      borderRadius: BorderRadius.circular(20),
                      child: InkWell(
                        borderRadius: BorderRadius.circular(20),
                        onTap: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => record()));
                          // Handle tap functionality for record screen
                        },
                        splashColor: Color(0xFFAA1F24),
                        child: Center(
                          child: Text(
                            'Previous Record',
                            style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 20),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar:SizedBox(height:50, child:  ClipRRect(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20.0),
          topRight: Radius.circular(20.0),
        ),
        child: BottomAppBar(
          shape: CircularNotchedRectangle(),
          color: Colors.black,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              IconButton(
                icon: Icon(Icons.home, color: Colors.white),
                onPressed: () { Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => CardioVistaApp()),
                );
                },
              ),
              IconButton(
                icon: Icon(Icons.person, color: Colors.white),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ProfilePage()),
                  );
                },
              ),
            ],
          ),
        ),
      ),),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}

// YourDetailsPage widget

class YourDetailsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'My Profile',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFFAA1F24),
                ),
              ),
              SizedBox(height: 20),
              CircleAvatar(
                radius: 60,
                backgroundColor: Colors.grey[300], // Placeholder background color
                child: Icon(
                  Icons.person,
                  size: 60,
                  color: Colors.grey, // Placeholder icon color
                ),
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Your Name', // Placeholder for name, replace with actual name
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFFAA1F24),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10),
              Text(
                'Your Email', // Placeholder for email, replace with actual email
                style: TextStyle(
                  fontSize: 18,
                ),
              ),
              SizedBox(height: 20),
              ProfileInfoField(label: 'Licence number', value: '22'),
              ProfileInfoField(label: 'Email', value: '0'),
              ProfileInfoField(label: 'Phone number', value: '0'),
              ProfileInfoField(label: 'Specialization', value: 'No'),
              ProfileInfoField(label: 'Bio', value: 'Female'),
              SizedBox(height: 20),
            ],
          ),
        ),
      ),
      bottomNavigationBar: ClipRRect(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20.0),
          topRight: Radius.circular(20.0),
        ),
        child: BottomAppBar(
          shape: CircularNotchedRectangle(),
          color: Colors.black,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              IconButton(
                icon: Icon(Icons.home, color: Colors.white),
                onPressed: () { Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => CardioVistaApp()),
                );
                },
              ),
              IconButton(
                icon: Icon(Icons.person, color: Colors.white),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ProfilePage()),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ProfileInfoField extends StatelessWidget {
  final String label;
  final String value;

  ProfileInfoField({required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      padding: EdgeInsets.only(bottom: 10),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: Colors.grey,
            width: 1,
          ),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            value,
            style: TextStyle(
              fontSize: 18,
            ),
          ),
        ],
      ),
    );
  }
}
