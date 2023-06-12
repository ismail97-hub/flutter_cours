import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:secondapp/app_preferences.dart';
import 'package:secondapp/login_view.dart';
import 'package:secondapp/products_grid.dart';
import 'package:secondapp/produits_view.dart';

class HomeUser extends StatefulWidget {
  const HomeUser({super.key});

  @override
  State<HomeUser> createState() => _HomeUserState();
}

class _HomeUserState extends State<HomeUser> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home User"),
        actions: [
          IconButton(onPressed: (){
            Navigator.pushAndRemoveUntil(context, CupertinoPageRoute(builder: (_)=>LoginView()), (route) => false);
            setIsLoggedIn(false);
          }, icon: Icon(Icons.logout))
        ],
      ),
      body: Center(
        child: ElevatedButton(onPressed: (){
          Navigator.push(context, 
            CupertinoPageRoute(builder: (_)=>ProduitsView()));
        }, child: Text("Produits")),
      ),
    );
  }
}