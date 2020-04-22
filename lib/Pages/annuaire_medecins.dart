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
    return new ListView.builder(
          itemCount: listMedecin.length,
          itemBuilder: (BuildContext context, int index) {
            return _Item(listMedecin[index]);
          },

        );
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
          height: 130,
          margin: EdgeInsets.all(10.0),
          decoration: BoxDecoration(
            gradient: LinearGradient(colors: [
              Colors.blue[500],
              Colors.blue[100],
            ]),
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
            children: <Widget>[
              Container(
                padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20.0),
                  child: Image(
                    height: 100.0,
                    width: 90.0,
                    image: AssetImage(medecin.urlPhoto),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Container(
                  height: 130,
                  alignment: Alignment.topLeft,
                  padding: EdgeInsets.fromLTRB(10, 10, 0, 0),
                  child: new Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        'Dr. ' +
                            medecin.nom.toUpperCase() +
                            ' ' +
                            medecin.prenom,
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
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
                              color: Colors.red[300],
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
                              style: TextStyle(fontSize: 13),
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
                            color: Colors.black,
                          ),
                          new Container(
                            width: MediaQuery.of(context).size.width * 0.50,
                            child: Text(
                              medecin.adresse,
                              overflow: TextOverflow.ellipsis,
                              maxLines: 2,
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
                            color: Colors.black,
                            size: 20,
                          ),
                          Container(
                            width: 150,
                            child: Text(
                              medecin.numeroTel,
                              overflow: TextOverflow.ellipsis,
                              maxLines: 5,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      SizedBox(
                        width: 100,
                      ),
                    ],
                  )),
            ],
          )),
    );
  }

  void _printDoctorDetails(Medecin medecin) {
    Navigator.push(context,
        MaterialPageRoute(builder: (context) => FicheDoctor(medecin: medecin)));
  }
}
