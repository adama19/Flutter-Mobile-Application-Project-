import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class RegistrationScreen extends StatefulWidget {
  @override
  _RegistrationScreen createState() => _RegistrationScreen();
}

class _RegistrationScreen extends State<RegistrationScreen> {
  TextEditingController _email = TextEditingController();
  TextEditingController _password = TextEditingController();

  Future registerUser() async {
    try {
      UserCredential userCredential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: _email.text,
        password: _password.text,
      );
      print("User Registered succesfully");
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Register"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Form(
            child: Column(
          children: [
            TextFormField(
              controller: _email,
              decoration: InputDecoration(
                  border: OutlineInputBorder(), hintText: "Enter Email"),
            ),
            SizedBox(height: 20),
            TextFormField(
              controller: _password,
              decoration: InputDecoration(
                  border: OutlineInputBorder(), hintText: "Enter Password"),
            ),
            SizedBox(height: 20),
            ElevatedButton(
                onPressed: () {
                  registerUser();
                },
                child: Text(
                  "Register",
                  style: TextStyle(fontSize: 30),
                ))
          ],
        )),
      ),
    );
  }
}
