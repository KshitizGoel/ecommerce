import 'package:ecommerce/Widgets/_CustomText.dart';
import 'package:flutter/material.dart';

class PageForOneCategory extends StatelessWidget{

  final String textFromTheMenu;

  PageForOneCategory(this.textFromTheMenu);


  @override
  Widget build(BuildContext context) {

    //We will use Firebase References to retrieve from the database of different Products!

    return Scaffold(

      body: Container(
        child: Center(

          child: CustomTextForCategoryProducts(textFromTheMenu , 20 , 20),

        ),
      ),

    );
  }

}

