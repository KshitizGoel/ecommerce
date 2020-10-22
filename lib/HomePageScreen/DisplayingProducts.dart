import 'package:ecommerce/Widgets/CustomCard.dart';
import 'package:ecommerce/Widgets/CustomText.dart';
import 'package:flutter/material.dart';

class DisplayingProducts extends StatefulWidget{

  @override
  State<StatefulWidget> createState() {
   return DisplayingProductsState();
  }

}

class DisplayingProductsState extends State<DisplayingProducts>{
  @override
  Widget build(BuildContext context) {
   return Scaffold(

    appBar: AppBar(
      automaticallyImplyLeading: false,
      backgroundColor: Colors.indigo,
       centerTitle: true,
       title: CustomText('Your Products' , 15,25),
       toolbarHeight: 100,
       shape: RoundedRectangleBorder(
         borderRadius: BorderRadius.vertical(
           bottom: Radius.circular(500),
         ),
       ),
     ),

     body: ListView(

       children: <Widget>[

        GestureDetector(
          onTap: (){

          },

          child:  Padding(
                    padding: EdgeInsets.all(10),
                    child: CustomCard("Clothes" , "image/clothes.jpg" , "Shop trendy fashion"),
          ),
        )      ,



         Padding(
           padding: EdgeInsets.all(10),
           child: CustomCard("Shoes" , "image/shoes.jpg" , "Shop all kinds of shoes!"),
         ),

         Padding(
           padding: EdgeInsets.all(10),
           child: CustomCard("Gaming Stations" , "image/gaming_stations.png" , "Geeks shopping"),
         ),

         Padding(
           padding: EdgeInsets.all(10),
           child: CustomCard("Sports" , "image/sports.jpg" , "Athlete shopping"),
         ),

       ],

     ),

   ) ;
  }

}