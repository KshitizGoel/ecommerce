import 'package:ecommerce/Widgets/CustomCardForProducts.dart';
import 'package:ecommerce/Widgets/_CustomText.dart';
import 'package:flutter/material.dart';


class PageForOneCategory extends StatelessWidget{

  final String textFromTheMenu;

  //The above String will act as a child for retrieving the data from the database
  
  PageForOneCategory(this.textFromTheMenu);


  @override
  Widget build(BuildContext context) {

    //We will use Firebase References to retrieve from the database of different Products!

    return Scaffold(


        body: ListView(
          shrinkWrap: true,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(left: 20 , top: 10 ),
              child: CustomTextForCategoryProducts(
                "Ethnic Wear" ,
                1,
                24.0
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 20 , right: 20, top: 10, bottom: 10),
              child: CustomCardForProducts(
                true,
                "699",
                "Women's Kurta",
                "image/women_Kurta_one.jpg"
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 20 , right: 20, top: 10, bottom: 10),
              child: CustomCardForProducts(
                  true,
                  "599",
                  "Kid's Kurta",
                  "image/Women_kurta_Two.jpg"
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 20 , right: 20, top: 10, bottom: 10),
              child: CustomCardForProducts(
                  false,
                  "599",
                  "Men's Kurta",
                  "image/men_Kurta_One.jpg"
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 20 , right: 20, top: 10, bottom: 10),
              child: CustomCardForProducts(
                  true,
                  "699",
                  "Ethnic Wear",
                  "image/men_Kurta_Two.jpg"
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 20 , right: 20, top: 10, bottom: 10),
              child: CustomCardForProducts(
                  true,
                  "699",
                  "Kid's Ethnic Wear",
                  "image/girld_Child_Kurta.jpg"
              ),
            ),


          ],
        ),
    );
  }

}

