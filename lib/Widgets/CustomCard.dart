import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomCard extends StatelessWidget{

  final String title;
  final String imageAddress;
  final String description;

   CustomCard(this.title, this.imageAddress ,this.description );

  @override
  Widget build(BuildContext context) {

    return Container(
      alignment: Alignment.center,
      child:Padding(

        padding: EdgeInsets.all(10),

        child: Card(

          elevation: 5,

          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
              top: Radius.circular(50),
            bottom: Radius.circular(50),
            ),
          ),
          child: Column(

            children: <Widget>[

              Padding(
                padding: EdgeInsets.all(5),
                child: Text(
                  title,
                  style: GoogleFonts.poppins(
                      textStyle: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          color: Colors.black
                      )
                  ),
                ),
              ),

              Padding(
                padding: EdgeInsets.all(7),
                child: getImages(),
              ),

              Padding(
                padding: EdgeInsets.all(5),
                child: Text(
                  description,
                  style: GoogleFonts.poppins(
                      textStyle: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                          color: Colors.blueGrey
                      ))
                ),
              )

            ],

          )



        ),

      )
    );
  }

  Widget getImages(){
    AssetImage assetImage = AssetImage(imageAddress);
    Image image = Image(image: assetImage , );

    return

      Container(
        height: 300,
      width: 400,
      child: image,
    );
  }

}

