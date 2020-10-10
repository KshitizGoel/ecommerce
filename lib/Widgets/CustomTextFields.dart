import 'package:flutter/material.dart';

class CustomTextFields extends StatelessWidget{

  final TextEditingController controller;
  final IconData data;
  final String labelText;
  bool isObscure = true;


  CustomTextFields(this.controller, this.data , this.labelText, this.isObscure);

  @override
  Widget build(BuildContext context) {

    return Container(
      child: Padding(
        padding: EdgeInsets.only(top: 10.0, right: 20, left: 20),

        child: TextFormField(
          controller: controller,
          obscureText: isObscure,
          cursorColor: Theme.of(context).primaryColor,
          decoration: InputDecoration(

            prefixIcon: Icon(
              data,
              color: Theme.of(context).primaryColor,
            ),
            focusColor: Theme.of(context).primaryColor,
            labelText: labelText,
            labelStyle: TextStyle(
              fontWeight: FontWeight.bold,
              color:Colors.black
            )
          ),
        ),

      ),
    );

  }

}