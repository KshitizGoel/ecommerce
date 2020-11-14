import 'package:ecommerce/Widgets/CustomText.dart';
import "package:flutter/material.dart";
import '_CustomText.dart';

class CustomCardForProducts extends StatelessWidget{

  final String nameOfTheProductRetrieved;
  final String costOfTheProductRetrieved;
  final bool availability;
  final String image_Address;

  CustomCardForProducts(this.availability  , this.costOfTheProductRetrieved , this.nameOfTheProductRetrieved , this.image_Address);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: availability? Colors.greenAccent : Colors.redAccent,
      child:  Card(

        child: Padding(

          padding: EdgeInsets.all(10.0),

          child: Column(
            children: <Widget>[

              CustomTextForCategoryProducts(nameOfTheProductRetrieved , 5.0 , 15.0),

              //Providing a dummy image.
              getImages(image_Address),

              Padding(
                padding: EdgeInsets.all(5.0),
                child: Column(

                  children: <Widget>[


                    Padding(
                      padding: EdgeInsets.only(left: 20.0 , right: 5.0),
                      child: CustomTextForCategoryProducts(
                          availability ? "Range starting from ":"Unavailable",
                          1.0,
                          15.0
                      ),
                    ),

                    Padding(
                      padding: EdgeInsets.only(left: 20.0 , right: 5.0),
                      child: CustomTextForCategoryProducts(
                          " $costOfTheProductRetrieved/-  " ,
                          1.0,
                          15.0
                      ),
                    ),

                  ]

                ),
              )

            ],
          ),
        )
      ),

    );
  }

  Widget getImages(String imageAddress){
    AssetImage assetImage = AssetImage(imageAddress);
    Image image = Image(image: assetImage , );

    return

      Container(
        height: 150,
        width: 200,
        child: image,
      );
  }

}