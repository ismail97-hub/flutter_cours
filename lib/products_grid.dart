import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:secondapp/add_product.dart';
import 'package:secondapp/database/database.dart';
import 'package:secondapp/database/model.dart';
import 'package:secondapp/update_product.dart';

class ProductsGrid extends StatefulWidget {
  const ProductsGrid({super.key});

  @override
  State<ProductsGrid> createState() => _ProductsGridState();
}

class _ProductsGridState extends State<ProductsGrid> {
  List<Produit> produits = [];

  getToutProduit()async{
    final database = await AppDatabase.create();
    database.produitDAO.findAll().then((value) {
      setState(() {
        produits = value;
      });    
    });
  }
  
  @override
  void initState() {
    getToutProduit();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("List produit"),
        actions: [
          IconButton(
            onPressed: (){
              Navigator.push(
                context, 
                CupertinoPageRoute(builder: (_)=>AddProductView())).then(
                  (value){
                    getToutProduit();
                  });
            }, 
            icon: Icon(Icons.add),
          )
        ],  
      ),
      body: GridView.builder(
        itemCount: produits.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 5),
        itemBuilder: ((context, index) {
          return SizedBox(
            child: Image.file(File(produits[index].image??""),fit: BoxFit.cover,));
        }))
    );
  }
}