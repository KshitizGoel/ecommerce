import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginPageScreen extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return LoginPageScreenState();
  }

}

class LoginPageScreenState extends State<LoginPageScreen>{

  TextEditingController _emailTextEditingController = TextEditingController();
  TextEditingController _passwordTextEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: <Widget>[

          Padding(
            padding: EdgeInsets.all(10.0),
            child: getImageAsset(),

          ),

          Padding(
            padding: EdgeInsets.only(top:10.0, left: 90),
            child: Text(
              "Login to your account",
              style: GoogleFonts.poppins(
                textStyle: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20
                )
              ),
            ),

          ),

          Padding(
            padding: EdgeInsets.only(top: 20, left: 20),

            child: TextFormField(
              keyboardType: TextInputType.emailAddress,

              decoration: InputDecoration(
                labelText: "Email ID",
                labelStyle: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.black
                ),
                  prefixIcon: Icon(
                Icons.account_box,
                color: Colors.blue,
              )

              ),
              controller: _emailTextEditingController,
            ),

          ),

          Padding(
            padding: EdgeInsets.only(top: 20, left: 20),

            child: TextFormField(
              obscureText: true,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                  labelText: "Password",
                  labelStyle: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.black
                  ),
                  prefixIcon: Icon(
                    Icons.lock,
                    color: Colors.blue,
                  )
              ),
              controller: _passwordTextEditingController,
            ),

          ),



          Padding(
              padding: EdgeInsets.only(left:20.0, right: 20.0, bottom: 20.0, top: 50.0),

              child: ButtonTheme(

                height: 50.0,


                child: RaisedButton(



                  onPressed: (){
                    //Used in backend for logging in authentically..


                  },
                  child: Column(
                    children: <Widget>[

                      Icon(
                          Icons.details,
                          color:Colors.black
                      ),

                      Text(
                        "Login",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.black
                        ),
                      )

                    ],
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25.0),

                  ),
                  

                ),
              )
          ),


        ],
      )
    );
  }

}
class getImageAsset extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    AssetImage assetImage = AssetImage("image/shoppingBags.png");
    Image image = Image(image: assetImage);

    return Container(
      child: image,
    );
  }
}