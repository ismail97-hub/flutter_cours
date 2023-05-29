import 'package:flutter/material.dart';
import 'package:secondapp/common/functions.dart';
import 'package:secondapp/database/database.dart';
import 'package:secondapp/database/model.dart';

class AddProductView extends StatefulWidget {
  const AddProductView({super.key});

  @override
  State<AddProductView> createState() => _AddProductViewState();
}

class _AddProductViewState extends State<AddProductView> {
  String designation = "";
  int quantite = 0;
  double pu = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Ajouter Produit")),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30,vertical: 50),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TextField(
              decoration: getInputDecoration("Désignation"),
              onChanged: (value) {
                setState(() {
                  designation=value;
                });
              },
            ),
            SizedBox(height: 20),
            TextField(
              decoration: getInputDecoration("Prix unitaire"),
              keyboardType: TextInputType.number,
              onChanged: (value) {
                setState(() {
                  pu= double.parse(value);
                });
              },
            ),
            SizedBox(height: 20),
            TextField(
              decoration: getInputDecoration("Quantité"),
              keyboardType: TextInputType.number,
              onChanged: (value) {
                setState(() {
                  quantite = int.parse(value);
                });
              },
            ),
            SizedBox(height: 50),
            SizedBox(
              height: 50,
              width: double.infinity,
              child: ElevatedButton(
                onPressed: ()async{
                  final database = await AppDatabase.create();
                  database.produitDAO.insertProduit(Produit(null, designation, pu, quantite));
                  Navigator.of(context).pop();
                }, 
                child: Text("Ajouter")))
          ],
        ),
      ),
    );
  }
}