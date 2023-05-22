import 'package:flutter/material.dart';
import 'package:secondapp/app_preferences.dart';
import 'package:secondapp/home_view.dart';
import 'package:secondapp/login_view.dart';

void main(List<String> args) {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: FutureBuilder<bool>(
        future: isLoggedIn(),
        builder: (context, snapshot) {
          bool isLoggedIn = snapshot.data??false;
          return isLoggedIn == true?HomeView():LoginView();
        }
      ),
    );
  }
}