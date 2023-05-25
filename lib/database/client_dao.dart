import 'package:floor/floor.dart';
import 'package:secondapp/database/model.dart';

@dao
abstract class ClientDAO {
  @Query("SELECT * FROM Client")
  Future<List<Client>> findAll();

  @insert
  Future<void> insertClient(Client client);
}