import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:secondapp/add_product.dart';
import 'package:secondapp/database/database.dart';
import 'package:secondapp/database/model.dart';

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
          return Container(
            padding: EdgeInsets.symmetric(horizontal: 10),
            height: 70,
            child: Card(
              child: Row(
                children: [
                  Expanded(flex: 1,child: Text("${produits[index].id}",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20))),
                  Expanded(flex: 3,child: Text("${produits[index].designation}",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20))),
                  Expanded(flex: 1 ,child: Text("${produits[index].pu}",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20))),
                  
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}