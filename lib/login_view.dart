import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:secondapp/data_source.dart';
import 'package:secondapp/home_view.dart';
import 'package:secondapp/model.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  String? username;
  String? password;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text("Login",
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                color: Colors.blue)),
            SizedBox(height: 50),    
            TextField(
              decoration: getInputDecoration("Username"),
              onChanged: (value){
                setState(() {
                  username = value;
                });
              }),
            SizedBox(height: 20),    
            TextField(
              obscureText: true,
              decoration: getInputDecoration("Password"),
              onChanged: (value){
                setState(() {
                  password = value;
                });
              }),
            SizedBox(height: 40),
            SizedBox(
              height: 50,
              width: double.infinity,
              child: ElevatedButton(onPressed: (){
                for (Client client in clients) {
                  if (client.username==username&&client.password==password) {
                    Navigator.pushAndRemoveUntil(context, CupertinoPageRoute(builder: (_)=>HomeView()),(_)=>false);
                  }
                }
              }, child: Text("Login")))    
          ],
        ),
      ),
    );
  }

  InputDecoration getInputDecoration(String label){
    return InputDecoration(
      labelText: label, //username or password
      hintText: label,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(6),
        borderSide: BorderSide(color: Colors.blue)
      )
    );
  }
}