import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomTextFields extends StatelessWidget{

  final TextEditingController controller;
  final IconData data;
  final String labelText;
  bool isObscure = true;



  final TextInputType keyBoardType;

  CustomTextFields(this.controller, this.data , this.labelText, this.isObscure, this.keyBoardType);

  @override
  Widget build(BuildContext context) {

    return Container(
      child: Padding(
        padding: EdgeInsets.only(top: 10.0, right: 20, left: 20),

        child: TextFormField(
          controller: controller,
          obscureText: isObscure,
          keyboardType: keyBoardType,
            cursorColor:  Colors.white,



          decoration: InputDecoration(

              enabledBorder: const OutlineInputBorder(

                borderRadius: const BorderRadius.all(
                const Radius.circular(10.0),
                ),
                borderSide: const BorderSide(color: Colors.white, width: 4.0),
              ),
              border: const OutlineInputBorder(),



            prefixIcon: Icon(
              data,
              color: Colors.white,
            ),
            focusColor: Theme.of(context).primaryColor,
            labelText: labelText,
            labelStyle: GoogleFonts.poppins(
              textStyle: TextStyle(
                  fontWeight: FontWeight.bold,
                  color:Colors.white
              )
            )
          ),
        ),

      ),
    );

  }

}