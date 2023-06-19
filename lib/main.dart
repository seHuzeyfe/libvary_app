import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Container(
          padding: EdgeInsets.all(5),
          child: Column(children: [
            Expanded(child: Image.asset('images/image2.jpg')),
            SizedBox(height: 1),

            TextField(
              decoration: InputDecoration(
                  hintStyle: TextStyle(color: Colors.black),
                  hintText: "E-mail"),
            ),
            SizedBox(height: 20),
            TextField(
              decoration: InputDecoration(
                  hintStyle: TextStyle(color: Colors.black),
                  hintText: "Password"),
            ),
            SizedBox(height: 20.0),
            ElevatedButton(
              child: Text('Log in'),
              onPressed: () {
                // Perform login logic
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.black,

                elevation: 20, // Elevation
                shadowColor: Colors.black26, // Shadow Color
              ),
            ),
            SizedBox(height: 10.0),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.black,

                elevation: 20, // Elevation
                shadowColor: Colors.black26, // Shadow Color
              ),
              onPressed: () {
                // Perform login with Google logic
              },
              child: Column(
                children: [
                  Text('Log in with Google'),
                ],
              ),
            ),
          ]),
        ),
      ),
    );
  }
}