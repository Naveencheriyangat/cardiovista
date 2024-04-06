import 'package:flutter/material.dart';
import 'prof.dart';
import 'hom.dart';


void main() {
  runApp(PatientListPage());
}

class PatientListPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Cardio Vista',
      theme: ThemeData(
        primarySwatch: Colors.red,
        scaffoldBackgroundColor: Color.fromARGB(255, 240, 251, 255),
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
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


      body: PatientList(),
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

class PatientList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
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
          crossAxisAlignment: CrossAxisAlignment.start, // Align text to the left
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Padding(
              padding: EdgeInsets.only(left: 20, top: 20), // Adjust left padding
              child: Text(
                ' Doctor List',
                style: TextStyle(
                  fontSize: 28,
                  color: Color(0xFFAA1F24),
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            buildPatientButton('Dr name', '02/02/2002', context),
            buildPatientButton('Dr name', '05/08/2002', context),
            buildPatientButton('Dr name', '02/05/2002', context),
          ],
        ),
      ),
    );
  }

Widget buildPatientButton(String name, String date, BuildContext context) {
  return GestureDetector(
    onTap: () {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => AnotherPage(name: name, date: date)),
      );
    },
    child: Container(
      margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Color(0xFFAA1F24), width: 2),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                name,
                style: TextStyle(
                  color: Color(0xFFAA1F24),
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
              SizedBox(height: 5),
              Text(
                date,
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 16,
                ),
              ),
            ],
          ),
        ],
      ),
    ),
  );
}
}

class AnotherPage extends StatefulWidget {
  final String name;
  final String date;

  AnotherPage({required this.name, required this.date});

  @override
  _AnotherPageState createState() => _AnotherPageState();
}

class _AnotherPageState extends State<AnotherPage> {
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
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(left: 16.0, top: 16.0),
              child: Text(
                widget.name,
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.red),
              ),
            ),
            SizedBox(height: 10), // Add some space between the heading and the card
            Expanded(
              child: Center(
                child: Card(
                  color: Color.fromARGB(255, 240, 251, 255), // Set the background color to white
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                    side: BorderSide(color: Color(0xFFAA1F24)), // Border color is red
                  ),
                  child: SizedBox(
                    height: 400,
                    width: 300, // Adjust the height of the card here
                    child: Padding(
                      padding: const EdgeInsets.all(24.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('Description'),
                          Text('Good health'),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            )
          ],
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
                onPressed: () {
                  // Handle home button tap
                },
              ),
              IconButton(
                icon: Icon(Icons.person, color: Colors.white),
                onPressed: () {
                  // Handle profile button tap
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}