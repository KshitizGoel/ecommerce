import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomTextForCategoryProducts extends StatelessWidget{

  final String textFromTheActivity;
  final double paddingInset;
  final double fontSize;

  CustomTextForCategoryProducts(this.textFromTheActivity , this.paddingInset ,this.fontSize);

  @override
  Widget build(BuildContext context) {
    return Padding(

      padding: EdgeInsets.all(paddingInset),
      child: Text(
        textFromTheActivity,
        style: GoogleFonts.poppins(
            textStyle: TextStyle(
                fontSize: fontSize,
                fontWeight: FontWeight.bold,
                color: Colors.black
            )
        ),
      ),
    );
  }

}