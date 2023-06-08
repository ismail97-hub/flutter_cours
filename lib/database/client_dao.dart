import 'package:floor/floor.dart';
import 'package:secondapp/database/model.dart';

@dao
abstract class ClientDAO {
  @Query("SELECT * FROM Client")
  Future<List<Client>> findAll();

  @Query("SELECT * FROM Client WHERE username = :username AND password = :password ")
  Future<Client?> findByUsernameAndPassword(String username,String password);

  @insert
  Future<void> insertClient(Client client);
}