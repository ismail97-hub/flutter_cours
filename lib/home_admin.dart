import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:secondapp/app_preferences.dart';
import 'package:secondapp/login_view.dart';

class HomeAdmin extends StatefulWidget {
  const HomeAdmin({super.key});

  @override
  State<HomeAdmin> createState() => _HomeAdminState();
}

class _HomeAdminState extends State<HomeAdmin> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home Admin"),
        actions: [
          IconButton(onPressed: (){
            Navigator.pushAndRemoveUntil(context, CupertinoPageRoute(builder: (_)=>LoginView()), (route) => false);
            setIsLoggedIn(false);
          }, icon: Icon(Icons.logout))
        ],
        ),
    );
  }
}