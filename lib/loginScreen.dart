import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:madproject/newpage.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController _email = TextEditingController();
  TextEditingController _password = TextEditingController();

  Future loginUser() async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(
              email: _email.text, password: _password.text);
      print("User successfully logged in");
      Navigator.push(context, MaterialPageRoute(builder: (context) {
        return Books();
      }));
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Login"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Form(
            child: Column(
          children: [
            TextFormField(
              controller: _email,
              decoration: InputDecoration(
                  hintText: "Email", icon: Icon(Icons.people_alt_outlined)),
            ),
            SizedBox(height: 20),
            TextFormField(
              controller: _password,
              obscureText: true,
              decoration: InputDecoration(
                hintText: "Password",
                icon: Icon(Icons.lock),
                //suffixIcon: Icon(Icons.visibility),
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
                onPressed: () {
                  loginUser();
                },
                child: Text(
                  "Login",
                  style: TextStyle(fontSize: 30),
                ))
          ],
        )),
      ),
    );
  }
}
