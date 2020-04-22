import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class searchPage extends StatefulWidget{
  const searchPage({Key key}) : super(key: key);
  @override
  State<StatefulWidget> createState() {
    return searchPageState();
  }
}

class searchPageState extends State<searchPage>{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      body: new Center(
        child: new Text('Search Page'),
      ),
    );
  }

}