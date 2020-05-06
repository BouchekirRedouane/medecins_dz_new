import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class searchPage extends StatefulWidget {
  const searchPage({Key key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return searchPageState();
  }
}

class searchPageState extends State<searchPage> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      body: new Center(
        child: Column(
          children: <Widget>[
            _searchBar(),
            _specialiteList(),
          ],
        ),
      ),

      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {},
        icon: Icon(Icons.phone, ),
        backgroundColor: Colors.orange[900],
        label: Text("Service d'assistance"),
      ),

    );
  }

  Widget _searchBar() {
    return Container(
      height: 105,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            //color: Colors.black26,
            blurRadius: 0.2,
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          new Container(
            padding: EdgeInsets.fromLTRB(15, 15, 15, 0),
            child: TextField(
              textInputAction: TextInputAction.search,
              decoration: InputDecoration(
                  hintText: "Chercher un docteur?",
                  border: new OutlineInputBorder(
                    borderSide: new BorderSide(
                      color: Colors.grey,
                    ),
                  ),
                  contentPadding: EdgeInsets.only(left: 15.0, top: 15.0),
                  suffixIcon: IconButton(
                    icon: Icon(Icons.search),
                    onPressed: () {
                      print('Lancer la recherche');
                    },
                    iconSize: 30.0,
                  )),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          new Container(
            margin: EdgeInsets.symmetric(horizontal: 15),
            width: 130,
            child: new SizedBox(
              height: 23,
              child: new OutlineButton(
                  textColor: Colors.indigo[900],
                  color: Colors.white,
                  onPressed: (){},
                  borderSide: BorderSide(color: Colors.indigo[900]),
                  child: Row(
                    children: <Widget>[
                      new Icon(Icons.location_on, color: Colors.red[600],size: 20,),
                      SizedBox(width: 10,),
                      new Text('Alger'),
                      SizedBox(width: 10,),
                      new Icon(Icons.keyboard_arrow_down, color: Colors.indigo[900],size: 20,),
                    ],
                  )
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _specialiteList() {
    return new Container(
        child: new Expanded(
      child: ListView(
        children: [


          new Container(
            padding: EdgeInsets.fromLTRB(20,20,0,15),
            child: new Row(
              children: <Widget>[
                new Text(
                  'Recherche par spécialité...',
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
                ),
              ],
            ),
          ),

          new Container(
            padding: EdgeInsets.symmetric(horizontal: 15),
            child: Card(
              child: ListTile(
                title: Text('Ophtalmologie'),
                leading: Image.asset('images/Ophtalmologie.png',height: 45,),
                trailing : Icon(Icons.arrow_forward_ios, color: Colors.red,),
                onTap: () {},
              ),
            ),
          ),

          new Container(
            padding: EdgeInsets.symmetric(horizontal: 15),
            child: Card(
              child: ListTile(
                title: Text('Dermatologie'),
                leading: Image.asset('images/Dermatologie.png',height: 45,),
                trailing : Icon(Icons.arrow_forward_ios, color: Colors.red,),
                onTap: () {},
              ),
            ),
          ),

          new Container(
            padding: EdgeInsets.symmetric(horizontal: 15),
            child: Card(
              child: ListTile(
                title: Text('Pédiatrie'),
                leading: Image.asset('images/Pediatrie.png',height: 45,),
                trailing : Icon(Icons.arrow_forward_ios, color: Colors.red,),
                onTap: () {},
              ),
            ),
          ),

          new Container(
            padding: EdgeInsets.symmetric(horizontal: 15),
            child: Card(
              child: ListTile(
                title: Text('Neurologie'),
                leading: Image.asset('images/endocrinologue.png',height: 45,),
                trailing : Icon(Icons.arrow_forward_ios, color: Colors.red,),
                onTap: () {},
              ),
            ),
          ),

          new Container(
            padding: EdgeInsets.symmetric(horizontal: 15),
            child: Card(
              child: ListTile(
                title: Text('Orthodontie'),
                leading: Image.asset('images/Orthodontie.png',height: 45,),
                trailing : Icon(Icons.arrow_forward_ios, color: Colors.red,),
                onTap: () {},
              ),
            ),
          ),

          new Container(
            padding: EdgeInsets.symmetric(horizontal: 15),
            child: Card(
              child: ListTile(
                title: Text('Gastro-entérologie'),
                leading: Image.asset('images/Gastro-enterologie.png',height: 45,),
                trailing : Icon(Icons.arrow_forward_ios, color: Colors.red,),
                onTap: () {},
              ),
            ),
          ),

          new Container(
            padding: EdgeInsets.symmetric(horizontal: 15),
            child: Card(
              child: ListTile(
                title: Text('ORL'),
                leading: Image.asset('images/ORL.png',height: 45,),
                trailing : Icon(Icons.arrow_forward_ios, color: Colors.red,),
                onTap: () {},
              ),
            ),
          ),

          new Container(
            padding: EdgeInsets.symmetric(horizontal: 15),
            child: Card(
              child: ListTile(
                title: Text('Cardiologie'),
                leading: Image.asset('images/Cardiologie.png',height: 45,),
                trailing : Icon(Icons.arrow_forward_ios, color: Colors.red,),
                onTap: () {},
              ),
            ),
          ),

          new Container(
            padding: EdgeInsets.symmetric(horizontal: 15),
            child: Card(
              child: ListTile(
                title: Text('Chirurgie dentaire'),
                leading: Image.asset('images/Chirurgie_dentaire.png',height: 45,),
                trailing : Icon(Icons.arrow_forward_ios, color: Colors.red,),
                onTap: () {},
              ),
            ),
          ),

          new Container(
            padding: EdgeInsets.symmetric(horizontal: 15),
            child: Card(
              child: ListTile(
                title: Text('Diabétologie'),
                leading: Image.asset('images/Diabetologie.png',height: 45,),
                trailing : Icon(Icons.arrow_forward_ios, color: Colors.red,),
                onTap: () {},
              ),
            ),
          ),

          new Container(
            padding: EdgeInsets.symmetric(horizontal: 15),
            child: Card(
              child: ListTile(
                title: Text('Médecin Généraliste'),
                leading: Image.asset('images/Generaliste.png',height: 45,),
                trailing : Icon(Icons.arrow_forward_ios, color: Colors.red,),
                onTap: () {},
              ),
            ),
          ),

          new Container(
            padding: EdgeInsets.symmetric(horizontal: 15),
            child: Card(
              child: ListTile(
                title: Text('Pneumologie'),
                leading: Image.asset('images/Pneumologie.png',height: 45,),
                trailing : Icon(Icons.arrow_forward_ios, color: Colors.red,),
                onTap: () {},
              ),
            ),
          ),

          new Container(
            padding: EdgeInsets.symmetric(horizontal: 15),
            child: Card(
              child: ListTile(
                title: Text('Psychiatrie'),
                leading: Image.asset('images/Psychiatrie.png',height: 45,),
                trailing : Icon(Icons.arrow_forward_ios, color: Colors.red,),
                onTap: () {},
              ),
            ),
          ),

          new Container(
            padding: EdgeInsets.symmetric(horizontal: 15),
            child: Card(
              child: ListTile(
                title: Text('Urologie'),
                leading: Image.asset('images/Urologie.png',height: 45,),
                trailing : Icon(Icons.arrow_forward_ios, color: Colors.red,),
                onTap: () {},
              ),
            ),
          ),

          new SizedBox(height: 20,),

          new Container(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: SizedBox(
              height: 55,
              width: MediaQuery.of(context).size.width*0.1,
              child: RaisedButton(
                  elevation: 10.0,
                  shape: new RoundedRectangleBorder(
                    borderRadius: new BorderRadius.circular(10.0),
                  ),
                  color: Colors.indigo[900],
                  child: new Text(
                    'Vous en voulez plus ? Lancer une recherche',
                    style: TextStyle(fontSize: 18, color: Colors.white,),
                  ),
                  onPressed: () {}
              ),
            ),
          ),

          new SizedBox(height: 100,),




      ],
      ),
    ));
  }
}
