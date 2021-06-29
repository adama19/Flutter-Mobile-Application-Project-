/* 
Group members 
Kpoghomou Niankoye Adama 1629851
Muhamad Asri Bin Md Isa 1621211
Abdul Rahman bin Muhammad Suzuri (1915413)
*/

import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:madproject/loginScreen.dart';
import 'package:madproject/registrationScreen.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Mobile Application Project',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Mobile Application Project'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.network(
                'https://aamadmi.in/wp-content/uploads/2020/12/Welcome.jpg'),
            SizedBox(height: 30),
            Text(
              "Welcome to our Mobile Application Development Project",
              style: TextStyle(
                fontSize: 40,
                decoration: TextDecoration.none,
                fontStyle: FontStyle.italic,
                fontWeight: FontWeight.normal,
              ),
            ),
            Text(
              "\nThis app generate some English E-books based on some criteria",
              style: TextStyle(
                  fontSize: 30,
                  decoration: TextDecoration.none,
                  fontStyle: FontStyle.italic),
            ),
            SizedBox(height: 30),
            Text(
              "Get Satarted",
              style: TextStyle(
                fontSize: 20,
                fontStyle: FontStyle.italic,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 30),
            ElevatedButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return LoginScreen();
                  }));
                },
                child: Text(
                  "Login ",
                  style: TextStyle(fontSize: 30),
                )),
            SizedBox(height: 30),
            ElevatedButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return RegistrationScreen();
                  }));
                },
                child: Text(
                  "Register",
                  style: TextStyle(fontSize: 25),
                )),
          ],
        ),
      ),
    );
  }
}
