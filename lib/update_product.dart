import 'package:flutter/material.dart';
import 'package:secondapp/common/functions.dart';
import 'package:secondapp/database/database.dart';
import 'package:secondapp/database/model.dart';

class UpdateProductView extends StatefulWidget {
  final Produit produit;
  const UpdateProductView({super.key, required this.produit});

  @override
  State<UpdateProductView> createState() => _UpdateProductViewState();
}

class _UpdateProductViewState extends State<UpdateProductView> {
  String designation = "";
  int quantite = 0;
  double pu = 0;
  final designationController = TextEditingController();
  final puController = TextEditingController();
  final quantiteController = TextEditingController();

  load(){
    designationController.text = widget.produit.designation;
    puController.text = widget.produit.pu.toString();
    quantiteController.text = widget.produit.qte.toString();
    setState(() {
      designation = widget.produit.designation;
      pu = widget.produit.pu;
      quantite = widget.produit.qte;
    });
  }

  @override
  void initState() {
    load();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Modifier Produit ${widget.produit.id}")),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30,vertical: 50),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TextField(
              controller: designationController,
              decoration: getInputDecoration("Désignation"),
              onChanged: (value) {
                setState(() {
                  designation = value;
                });
              },
            ),
            SizedBox(height: 20),
            TextField(
              controller: puController,
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
              controller: quantiteController,
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
                  database.produitDAO.updateProduit(Produit(widget.produit.id, designation,"",pu, quantite));
                  Navigator.of(context).pop();
                }, 
                child: Text("Modifier")))
          ],
        ),
      ),
    );
  }
}