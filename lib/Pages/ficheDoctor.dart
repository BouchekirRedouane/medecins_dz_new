import 'package:flutter/material.dart';
import 'package:medecins_dz/Model/medecin.dart';
import 'package:url_launcher/url_launcher.dart' as UrlLauncher;
import 'dart:async';

class FicheDoctor extends StatefulWidget {
  Medecin medecin;
  FicheDoctor({Key key, @required this.medecin}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _FicheDoctorState();
  }
}

class _FicheDoctorState extends State<FicheDoctor> {

  var _colorPrefredMedecin;


  @override
  void initState() {
    // TODO: implement initState
    _colorPrefredMedecin= Colors.white;
    super.initState();
  }

  
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
        appBar: new AppBar(
          backgroundColor: Colors.grey,
          elevation: 0,
          centerTitle: true,
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.star, color: _colorPrefredMedecin,),
              onPressed: () {
                setState(() {
                  _colorPrefredMedecin = Colors.yellow;
                });
              },
            ),
          ],
        ),
        body: ListView(
          children: <Widget>[
            new Stack(
              children: <Widget>[
                new Container(
                  color: Colors.grey,
                  width: MediaQuery.of(context).size.width,
                  height: 80,
                ),
                new Container(
                  alignment: Alignment.center,
                  padding: EdgeInsets.only(top: 15),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(60.0),
                    child: Image(
                      height: 120.0,
                      width: 120.0,
                      image: AssetImage('images/medecin.png'),
                      fit: BoxFit.cover,
                    ),
                  ),
                )
              ],
            ),
            Container(
                alignment: Alignment.topLeft,
                padding: EdgeInsets.fromLTRB(10, 5, 10, 0),
                child: new Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      'Dr ' +
                          widget.medecin.nom.toUpperCase() +
                          ' ' +
                          widget.medecin.prenom,
                      style:
                          TextStyle(fontSize: 30, fontWeight: FontWeight.w600, letterSpacing: 1.2),
                    ),
                    SizedBox(
                      height: 3,
                    ),
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
                        '  ' + widget.medecin.specialite + '  ',
                        style: TextStyle(fontSize: 13),
                      ),
                    ),
                    SizedBox(
                      height: 40,
                    ),
                    new Row(
                      children: <Widget>[
                        new Container(
                          decoration: BoxDecoration(
                            color: Colors.blue,
                            borderRadius: BorderRadius.circular(3),
                          ),
                          child: new Icon(
                            Icons.location_on,
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width * 0.80,
                          child: Text(
                            widget.medecin.adresse,
                            style: TextStyle(fontSize: 18),
                            overflow: TextOverflow.ellipsis,
                            maxLines: 3,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    new Row(
                      children: <Widget>[
                        new Container(
                          decoration: BoxDecoration(
                            color: Colors.blue,
                            borderRadius: BorderRadius.circular(3),
                          ),
                          child: new Icon(
                            Icons.call,
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Container(
                          width: 150,
                          child: Text(
                            widget.medecin.numeroTel,
                            style: TextStyle(fontSize: 18),
                            overflow: TextOverflow.ellipsis,
                            maxLines: 5,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    new Row(
                      children: <Widget>[
                        new Container(
                          decoration: BoxDecoration(
                            color: Colors.blue,
                            borderRadius: BorderRadius.circular(3),
                          ),
                          child: new Icon(
                            Icons.email,
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width * 0.80,
                          child: Text(
                            widget.medecin.adresseMail,
                            style: TextStyle(fontSize: 18),
                            overflow: TextOverflow.ellipsis,
                            maxLines: 5,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    new Row(
                      children: <Widget>[
                        new Container(
                          decoration: BoxDecoration(
                            color: Colors.blue,
                            borderRadius: BorderRadius.circular(3),
                          ),
                          child: new Icon(
                            Icons.access_time,
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Container(
                          width: 150,
                          child: Text(
                            widget.medecin.horaireOuverture +
                                ' - ' +
                                widget.medecin.horaireFermeture,
                            style: TextStyle(fontSize: 18),
                            overflow: TextOverflow.ellipsis,
                            maxLines: 5,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    new Row(
                      children: <Widget>[
                        new Container(
                          decoration: BoxDecoration(
                            color: Colors.blue,
                            borderRadius: BorderRadius.circular(3),
                          ),
                          child: new Icon(
                            Icons.av_timer,
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Container(
                            width: MediaQuery.of(context).size.width * 0.8,
                            height: 30,
                            child: ListView.builder(
                                itemCount: widget.medecin.jourTravail.length,
                                scrollDirection: Axis.horizontal,
                                itemBuilder: (BuildContext context, index) {
                                  return _getDayWork(
                                      widget.medecin.jourTravail, index);
                                })),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),

                    Divider(),

                    new Container(
                      alignment: Alignment.centerRight,
                      child: new FlatButton(
                        onPressed: (){

                        },
                        child: new Text(
                          'Il ya un problème? veuillez nous le signaler.',
                          style: TextStyle(
                            color: Colors.red,
                            fontSize: 15,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 50,
                    ),
                    new Container(
                      child: new Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          SizedBox(
                            height: 55,
                            width: 120,
                            child: RaisedButton(
                              elevation: 8,
                              shape: new RoundedRectangleBorder(
                                  borderRadius: new BorderRadius.circular(10.0)
                              ),
                              onPressed: () => setState(() {
                                _makePhoneCall(
                                    'tel:' + widget.medecin.numeroTel);
                              }),
                              color: Colors.blue[700],
                              child:new Icon(
                                Icons.phone,
                                color: Colors.white,
                                size: 30,
                              ),

                            ),
                          ),
                          SizedBox(
                            width: 30,
                          ),
                          SizedBox(
                            height: 55,
                            width: 120,
                            child: RaisedButton(
                              elevation: 8,
                              shape: new RoundedRectangleBorder(
                                  borderRadius: new BorderRadius.circular(10.0)
                              ),
                              onPressed: () => setState(() {

                              }),
                              color: Colors.green[600],
                              child:new Icon(
                                Icons.directions,
                                color: Colors.white,
                                size: 30,
                              ),

                            ),
                          ),




                        ],
                      ),
                    ),

                    SizedBox(height: 20,),




                  ],
                )),
          ],
        ));
  }

  Widget _getDayWork(List listeJourTravail, int index) {
    index = index + 1;
    String day = '';
    for (int i = 0; i < listeJourTravail.length; i++) {
      if (listeJourTravail[i].toString().contains(index.toString())) {
        if (index == 1) {
          day = 'Dim.';
        }
        if (index == 2) {
          day = 'Lun.';
        }
        if (index == 3) {
          day = 'Mar.';
        }
        if (index == 4) {
          day = 'Mer.';
        }
        if (index == 5) {
          day = 'Jeu.';
        }
        if (index == 6) {
          day = 'Ven.';
        }
        if (index == 7) {
          day = 'Sam.';
        }

        return new Container(
          height: 12,
          width: 40,
          alignment: Alignment.center,
          margin: EdgeInsets.symmetric(horizontal: 2),
          decoration: BoxDecoration(
            color: Colors.green[300],
            borderRadius: BorderRadius.circular(5.0),
            boxShadow: [
              BoxShadow(
                color: Colors.black26,
                offset: Offset(0.8, 2.0),
                blurRadius: 6.0,
              ),
            ],
          ),
          child: new Text(
            day,
            style: TextStyle(fontSize: 12),
          ),
        );
      }
    }
  }

  Future<void> _makePhoneCall(String url) async {
    if (await UrlLauncher.canLaunch(url)) {
      await UrlLauncher.launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}
