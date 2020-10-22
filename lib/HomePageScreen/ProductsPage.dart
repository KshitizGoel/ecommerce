import 'package:ecommerce/Widgets/CustomText.dart';
import "package:flutter/material.dart";
import 'package:google_fonts/google_fonts.dart';

import 'DisplayingProducts.dart';

class ProductsPage extends StatefulWidget{




  @override
  State<StatefulWidget> createState() {
    return ProductsPageState();
  }

}

class ProductsPageState extends State<ProductsPage>{
  @override
  Widget build(BuildContext context) {
  return Scaffold(

    backgroundColor: Colors.indigo,

    body: ListView(
      children: <Widget>[

        Padding(
          padding: EdgeInsets.only(top: 150 , left: 15, ),
          child: CustomText("Your Shopping cart is Empty !" , 10 , 50),
        ),

        

        Padding(

          padding: EdgeInsets.only( top: 250, left: 100),
          child: RaisedButton(


            color: Colors.indigo,

            onPressed: (){
              Navigator.push(context, MaterialPageRoute(
                  builder: (context) => DisplayingProducts()
              ));

            },

              child: Row(
                children: <Widget>[


                  Padding(
                    padding: EdgeInsets.all(5.0),
                    child: CustomText("Start Exploring " , 20 , 20),
                  ),

                  Padding(
                    padding: EdgeInsets.all(5.0),
                    child: Icon(
                      Icons.navigate_next,
                      color: Colors.white,
                    ),
                  ),
                ],
              )
            ),
          ),



      ],
    ),


  );
  }

}