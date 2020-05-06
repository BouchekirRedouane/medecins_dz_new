import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:medecins_dz/Model/medecin.dart';
import 'ficheDoctor.dart';

class annuaire_medecins extends StatefulWidget {
  const annuaire_medecins({Key key}) : super(key: key);
  @override
  State<StatefulWidget> createState() {
    return annuaire_medecinsState();
  }
}

class annuaire_medecinsState extends State<annuaire_medecins> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        _searchBar(),
        _istMedecins(),
      ],
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
            blurRadius: 0.8,
          ),
        ],
      ),
      child: Column(
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

          new Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              new Container(
                margin: EdgeInsets.symmetric(horizontal: 15),
                child: new SizedBox(
                  height: 23,
                  width: 130,
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

              new Container(
                margin: EdgeInsets.symmetric(horizontal: 15),
                child: new SizedBox(
                  height: 23,
                  child: new OutlineButton(
                    textColor: Colors.indigo[900],
                    color: Colors.white,
                    onPressed: (){},
                    borderSide: BorderSide(color: Colors.indigo[900]),
                    child: Row(
                      children: <Widget>[
                        new Icon(Icons.filter_list, color: Colors.red[600],size: 20,),
                        SizedBox(width: 10,),
                        new Text('Filtrer'),
                        SizedBox(width: 10,),
                        new Icon(Icons.keyboard_arrow_down, color: Colors.indigo[900],size: 25,),
                      ],
                    )
                  ),
                ),
              ),

            ],
          ),


        ],
      ),
    );
  }

  Widget _istMedecins(){
    return new Container(
        child: new Expanded(
        child: new ListView.builder(
      itemCount: listMedecin.length,
      itemBuilder: (BuildContext context, int index) {
        return _Item(listMedecin[index]);
      },

    )));
  }

  Widget _Item(Medecin medecin) {
    if (medecin.urlPhoto == null) {
      medecin.urlPhoto = 'images/medecin.png';
    }

    return GestureDetector(
      onTap: () {
        _printDoctorDetails(medecin);
      },
      child: Container(
          height: 125,
          margin: EdgeInsets.all(10.0),
          decoration: BoxDecoration(
            color: Colors.grey[200],
            borderRadius: BorderRadius.circular(10.0),
            boxShadow: [
              BoxShadow(
                color: Colors.black26,
                offset: Offset(0.8, 2.0),
                blurRadius: 6.0,
              ),
            ],
          ),

          child: new Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              Container(
                padding: EdgeInsets.fromLTRB(2, 2, 2, 2),
                decoration: BoxDecoration(
                  color: Colors.indigo[900],
                  borderRadius: BorderRadius.circular(100.0),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20.0),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(60.0,),
                    child: Image(
                      height: 100.0,
                      width: 100.0,
                      image: AssetImage('images/medecin.png'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              Container(
                  height: 130,
                  alignment: Alignment.topLeft,
                  padding: EdgeInsets.fromLTRB(15, 10, 0, 0),
                  child: new Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        ' Dr. ' +
                            medecin.nom.toUpperCase() +
                            ' ' +
                            medecin.prenom,
                        style: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 3,
                      ),
                      new Row(
                        children: <Widget>[
                          new Container(
                            height: 20,
                            alignment: Alignment.center,
                            margin: EdgeInsets.symmetric(horizontal: 2),
                            decoration: BoxDecoration(
                              color: Colors.red[700],
                              borderRadius: BorderRadius.circular(2.0),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black26,
                                  offset: Offset(0.8, 2.0),
                                  blurRadius: 6.0,
                                ),
                              ],
                            ),
                            child: new Text(
                              '  ' + medecin.specialite + '  ',
                              style: TextStyle(fontSize: 13, color: Colors.white),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      new Row(
                        children: <Widget>[
                          new Icon(
                            Icons.location_on,
                            color: Colors.indigo[900],
                          ),
                          new Container(
                            width: MediaQuery.of(context).size.width * 0.50,
                            child: Text(
                              medecin.adresse,
                              overflow: TextOverflow.ellipsis,
                              maxLines: 2,
                              style: TextStyle(fontSize: 12,),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      new Row(
                        children: <Widget>[
                          new Icon(
                            Icons.call,
                            color: Colors.indigo[900],
                            size: 20,
                          ),
                          Container(
                            child: Text(
                              medecin.numeroTel,
                              overflow: TextOverflow.ellipsis,
                              maxLines: 1,
                              style: TextStyle(fontSize: 13),
                            ),
                          ),
                        ],
                      ),


                    ],
                  )),
              Container(
                alignment: Alignment.centerRight,
                decoration: BoxDecoration(
                  color: Colors.indigo[900],
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(10),
                    bottomRight: Radius.circular(10),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black26,
                      offset: Offset(0.8, 2.0),
                      blurRadius: 6.0,
                    ),
                  ],
                ),
                child: new Icon(Icons.arrow_forward_ios, color: Colors.white,size: 30,),
              )
            ],
          )),
    );
  }

  void _printDoctorDetails(Medecin medecin) {
    Navigator.push(context,
        MaterialPageRoute(builder: (context) => FicheDoctor(medecin: medecin)));
  }
}
