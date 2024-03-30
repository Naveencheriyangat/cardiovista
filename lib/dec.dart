import 'package:flutter/material.dart';
import 'hom.dart';
import 'prof.dart';

void main() {
  runApp(const decription());
}

class decription extends StatelessWidget {
  const decription({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Cardio Vista',
      theme: ThemeData(
        primarySwatch: Colors.red,
        scaffoldBackgroundColor: Color.fromARGB(255, 240, 251, 255),
      ),
      home: VistaHomePage(),
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

class VistaHomePage extends StatelessWidget {
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
        shadowColor: Colors.black, leading: Container(
          child: Image.asset('assets/images/Logo.png')),

      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(left: 16.0, top: 16.0),
              child: Text(
                'Dr name',
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
    );
  }
}
