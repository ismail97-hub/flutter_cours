import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:secondapp/add_product.dart';
import 'package:secondapp/database/database.dart';
import 'package:secondapp/database/model.dart';
import 'package:secondapp/update_product.dart';

class ProduitsView extends StatefulWidget {
  const ProduitsView({super.key});

  @override
  State<ProduitsView> createState() => _ProduitsViewState();
}

class _ProduitsViewState extends State<ProduitsView> {
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
      body: ListView.builder(
        shrinkWrap: true,
        physics: ClampingScrollPhysics(),
        itemCount: produits.length,
        itemBuilder: (context, index) {
          return Dismissible(
            key: Key(produits[index].id.toString()),
            background: Container(
              color: Colors.red,
              child: Icon(Icons.delete,color: Colors.white),
            ),
            secondaryBackground: Container(
              color: Colors.green,
              child: Icon(Icons.update,color: Colors.white),
            ),
            onDismissed: (direction) async{
              if (direction==DismissDirection.endToStart) {
                Navigator.push(
                  context, 
                  CupertinoPageRoute(builder: (_)=>UpdateProductView(produit: produits[index])))
                    .then((value){
                      Navigator.of(context).pop();
                    } );
              } else if(direction==DismissDirection.startToEnd){
                final database = await AppDatabase.create();
                database.produitDAO.deleteProduit(produits[index]);
              }
            },
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 10),
              // height: 70,
              child: Card(
                child: Column(
                  children: [
                    SizedBox(
                      // height: 60,
                      child: Image.file(File(produits[index].image??""),fit: BoxFit.cover)),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Row(
                        children: [
                          Expanded(flex: 1,child: Text("${produits[index].id}",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16))),
                          Expanded(flex: 3,child: Text("${produits[index].designation}",style: TextStyle(color: Colors.grey,fontWeight: FontWeight.bold,fontSize: 18))),
                          Expanded(flex: 2,child: Text("${produits[index].pu} DH",textAlign: TextAlign.end,style: TextStyle(color: Colors.green,fontWeight: FontWeight.bold,fontSize: 16))),
                          
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}