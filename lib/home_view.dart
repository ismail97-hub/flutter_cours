import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:secondapp/app_preferences.dart';
import 'package:secondapp/login_view.dart';
import 'package:secondapp/products_grid.dart';
import 'package:secondapp/produits_view.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home"),
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
            CupertinoPageRoute(builder: (_)=>ProductsGrid()));
        }, child: Text("Produits")),
      ),
    );
  }
}