import 'package:floor/floor.dart';
import 'package:secondapp/database/model.dart';

@dao
abstract class ProduitDAO {
  @Query("SELECT * FROM Produit")
  Future<List<Produit>> findAll();

  @insert
  Future<void> insertProduit(Produit produit);
}

