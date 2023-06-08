import 'package:flutter/material.dart';
import 'package:secondapp/app_preferences.dart';
import 'package:secondapp/database/database.dart';
import 'package:secondapp/database/model.dart';
import 'package:secondapp/home_view.dart';
import 'package:secondapp/login_view.dart';

void main(List<String> args) {
  AppDatabase.create();
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  insertClient()async{
    final database = await AppDatabase.create();
    List<Client> clients = await database.clientDao.findAll();
    if(clients.isEmpty){
      database.clientDao.insertClient(Client(null,"ismail97", "123456","0653406950","user"));     
    }
  }

  @override
  void initState() {
    insertClient();
    super.initState();
  }


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