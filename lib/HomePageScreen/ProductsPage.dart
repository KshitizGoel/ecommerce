import 'package:ecommerce/InternalProductsPage/PageForShowingProductsOneCategory.dart';
import 'package:ecommerce/Widgets/CustomText.dart';
import 'package:ecommerce/Widgets/_CustomText.dart';
import "package:flutter/material.dart";

import 'DisplayingProducts.dart';


class ProductsPage extends StatefulWidget{




  @override
  State<StatefulWidget> createState() {
    return ProductsPageState();
  }

}

class ProductsPageState extends State<ProductsPage>{

  void navigate(PageForOneCategory pageForOneCategory){
    Navigator.push(context, MaterialPageRoute(
        builder: (context) => pageForOneCategory
    ));
  }

  @override
  Widget build(BuildContext context) {

  return Scaffold(

    backgroundColor: Colors.indigo,

    appBar: AppBar(
      backgroundColor: Colors.indigo,
      elevation: 0,
    ),

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

    //Drawer will display all the categories of shoppable items..

    drawer: Drawer(


      child: ListView(
        children: <Widget>[
          DrawerHeader(
            child: CustomText('E Commerce Shop' , 20 , 20),
            decoration: BoxDecoration(
              color: Colors.indigo,
            ),
          ),

          GestureDetector(
            onTap: (){
              navigate(PageForOneCategory("Clothes")) ;
            },
            child:  Row(
              children: <Widget>[

                Padding(
                    padding: EdgeInsets.all(10),
                    child:Image.asset("image/vectorShirt.jpg" , width: 40 , height: 40,)
                ),
                CustomTextForCategoryProducts("Apparels" , 10 ,20),
              ],


            ),
          ),


          GestureDetector(
            onTap: (){
              navigate(PageForOneCategory("Shoes")) ;

            },
            child:   Row(
              children: <Widget>[
                Padding(
                    padding: EdgeInsets.all(10),
                    child:Image.asset("image/shoesVector.jpg" , width: 40 , height: 40,)
                ),
                CustomTextForCategoryProducts("Shoes" , 10 ,20),

              ],


            ),
          ),

          GestureDetector(
            onTap: (){
              navigate(PageForOneCategory("Games")) ;

            },
            child:  Row(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.all(10),
                  child: Icon(
                      Icons.videogame_asset
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 15),
                  child: CustomTextForCategoryProducts("Gaming Stations" , 10 ,20),

                )

              ],


            ),
          ),

          GestureDetector(
            onTap: (){
              navigate(PageForOneCategory("Sports")) ;

            },
            child:   Row(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.all(10),
                  child: Icon(
                      Icons.toys
                  ),
                ),

                Padding(
                  padding: EdgeInsets.only(left: 15),
                  child: CustomTextForCategoryProducts("Sports" , 10 ,20),

                )

              ],


            ),
          ),




        ],
      ),
    )



  );
  }

}