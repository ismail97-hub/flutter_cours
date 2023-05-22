import 'package:floor/floor.dart';

@entity
class Client {
  @PrimaryKey(autoGenerate: true)
  int? id;

  String username;
  
  String password;
  
  String telephone;
  
  String role;

  Client(this.id,this.username,this.password,this.telephone,this.role);
}