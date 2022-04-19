import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:running/screen/form.dart';
import 'package:running/screen/home.dart';

import 'display.dart';

class WelcomeScreen extends StatelessWidget {
  final auth = FirebaseAuth.instance;
  final Future<FirebaseApp> firebse = Firebase.initializeApp();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Welcome"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Center(
          child: Column(children: [
            ElevatedButton(
                onPressed: () {
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) {
                    return FormScreen();
                  }));
                },
                child: Text("Update profile")),
            ElevatedButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return DisplayScreen();
                  }));
                },
                child: Text("profile")),
            ElevatedButton(
                onPressed: () {
                  auth.signOut().then((value) {
                    Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (context) {
                      return HomeScreen();
                    }));
                  });
                },
                child: Text("Logout"))
          ]),
        ),
      ),
    );
  }
}
