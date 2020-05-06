import 'dart:async';
import 'package:flutter/material.dart';
import 'HomePage.dart';

class LogoPage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return LogoPageState();
  }
}


class LogoPageState extends State<LogoPage>{



  @override
  void initState(){
    Timer(Duration(seconds: 3),(){
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (BuildContext context) => HomePage()));
    });
    super.initState();
  }



  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new Container(

        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end : Alignment.bottomCenter,
                colors: [
                  Colors.indigo[900],
                  Colors.indigo[900],
                  //Colors.blue[300],
                ]
            )
        ),

        child:  new Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[

             new SizedBox(
               child:  new Image.asset('images/logo.png',),
             ),

              new SizedBox(
                height: 30,
              ),
              new Text(
                'SihatiDz',
                style: TextStyle(color: Colors.yellow, fontSize: 35, fontFamily: 'Righteous', letterSpacing: 5.0 ),
              ),

              new Text(
                'Trouver un médecin en Algérie en toute facilité',
                style: TextStyle(color: Colors.white, fontSize: 15, fontFamily: 'Righteous' ),
              ),
            ],
          ),
        ),
      ),
    );
  }

}