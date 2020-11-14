import 'package:ecommerce/DialogBox/DialogBox.dart';
import 'package:ecommerce/InternalProductsPage/PageForShowingProductsOneCategory.dart';
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

  DialogBox alertDialog = DialogBox();

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

           navigate(PageForOneCategory("Clothes")) ;
           //Here we will provide the child name to the PageForOneCategory.dart file which will then retrieve the data from the
            //Firebase Realtime Database and accordingly fetch the data
          },

          child:  Padding(
                    padding: EdgeInsets.all(10),
                    child: CustomCard("Clothes" , "image/clothes.jpg" , "Shop trendy fashion"),
          ),
        ),



         GestureDetector(
           onTap: (){

             navigate(PageForOneCategory("Shoes"));

           },

           child:Padding(
             padding: EdgeInsets.all(10),
             child: CustomCard("Shoes" , "image/shoes.jpg" , "Shop all kinds of shoes!"),
           ),


         ),

         GestureDetector(
           onTap: (){
             navigate(PageForOneCategory("Games"));

           },

           child:   Padding(
             padding: EdgeInsets.all(10),
             child: CustomCard("Gaming Stations" , "image/gaming_stations.png" , "Geeks shopping"),
           ),

         ),


         GestureDetector(
           onTap: (){
              navigate( PageForOneCategory("Athletic"));

           },

           child: Padding(
             padding: EdgeInsets.all(10),
             child: CustomCard("Sports" , "image/sports.jpg" , "Athlete shopping"),
           ) ,

         )

       ],

     ),

   ) ;
  }

  void navigate(PageForOneCategory pageForOneCategory){
    Navigator.push(context, MaterialPageRoute(
      builder: (context) => pageForOneCategory
    ));
  }

}