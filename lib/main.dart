import 'package:flutter/material.dart';
import 'Pages/LogoPage.dart';

void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      debugShowCheckedModeBanner: false,
      home: new LogoPage(),
    );
  }
}

