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
                  Colors.deepPurple[600],
                  Colors.deepPurple[600],
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
                width:150,
                child: new Image.asset('images/doctor.png'),
              ),

              new SizedBox(
                height: 30,
              ),
              new Text(
                'MED',
                style: TextStyle(color: Colors.deepOrange, fontSize: 35, fontFamily: 'Righteous', letterSpacing: 5.0 ),
              ),

              new Text(
                'Medécins El Djazair',
                style: TextStyle(color: Colors.white, fontSize: 35, fontFamily: 'Righteous' ),
              ),
            ],
          )
        ),
      ),
    );
  }

}