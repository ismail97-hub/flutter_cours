import 'package:shared_preferences/shared_preferences.dart';


void setIsLoggedIn(bool isLoggedIn)async{
  SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.setBool("login", isLoggedIn);
}

Future<bool> isLoggedIn()async{
  SharedPreferences prefs = await SharedPreferences.getInstance();
  return prefs.getBool("login")??false;
}

void setRole(String role)async{
  SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.setString("role", role);
}

Future<String> getRole()async{
  SharedPreferences prefs = await SharedPreferences.getInstance();
  return prefs.getString("role")??"";
}

void setClientId(int id)async{
  SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.setInt("id", id);
}

Future<int> getClientId()async{
  SharedPreferences prefs = await SharedPreferences.getInstance();
  return prefs.getInt("id")??0;
}