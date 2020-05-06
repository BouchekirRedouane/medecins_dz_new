import 'package:flutter/cupertino.dart';
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
          backgroundColor: Colors.indigo[900],
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
            IconButton(
              icon: Icon(Icons.report_problem, color: Colors.red,),
              onPressed: () {
                setState(() {

                });
              },
            ),

            IconButton(
              icon: Icon(Icons.map, color: Colors.white,),
              onPressed: () {
                setState(() {

                });
              },
            ),

            IconButton(
              icon: Icon(Icons.phone, color: Colors.white,),
              onPressed: () => setState(() {
                _makePhoneCall(
                    'tel:' + widget.medecin.numeroTel);
              }),
            ),


          ],
        ),
        body: ListView(
          children: <Widget>[

            _topProfile(),

            _doctorProfile(),

            SizedBox(
              height: 20,
            ),

           _contact(),

            SizedBox(
              height: 10,
            ),

           _programme(),

            SizedBox(
              height: 10,
            ),

            _services(),

            SizedBox(
              height: 10,
            ),

            _rdv(),

            SizedBox(
              height: 150,
            ),


        ],
        ),

      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => setState(() {
          _makePhoneCall(
              'tel:' + widget.medecin.numeroTel);
        }),
        icon: Icon(Icons.phone, ),
        backgroundColor: Colors.orange[900],
        label: Text("Appeler le Docteur",),
      ),
    );
  }

  Widget _topProfile(){
    return new Stack(
      children: <Widget>[
        new Container(
          color: Colors.indigo[900],
          width: MediaQuery.of(context).size.width,
          height: 100,
        ),



        new Container(
          alignment: Alignment.topRight,
          padding: EdgeInsets.only(left:135,top: 64,),
          child: new Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: <Widget>[
              new GestureDetector(
                onTap: (){},
                child: new Container(
                  height: 30,
                  width: 30,
                  decoration: BoxDecoration(
                    color: Colors.grey[700],
                    borderRadius: BorderRadius.circular(100),
                  ),
                  child: new Icon(
                    Icons.email,
                    color: Colors.white,
                    size: 20,
                  ),
                ),
              ),
              SizedBox(width: 10,),

              new GestureDetector(
                onTap: (){},
                child: new Container(
                  height: 30,
                  width: 30,
                  decoration: BoxDecoration(
                    color: Colors.green[600],
                    borderRadius: BorderRadius.circular(100),
                  ),
                  child: new Icon(
                    Icons.place,
                    color: Colors.white,
                    size: 20,
                  ),
                ),
              ),

              SizedBox(width: 10,),

              new GestureDetector(
                onTap: ()=> setState(() {
                  _makePhoneCall(
                      'tel:' + widget.medecin.numeroTel);
                }),
                child: new Container(
                  height: 30,
                  width: 30,
                  decoration: BoxDecoration(
                    color: Colors.indigo[400],
                    borderRadius: BorderRadius.circular(100),
                  ),
                  child: new Icon(
                    Icons.phone,
                    color: Colors.white,
                    size: 20,
                  ),
                ),
              ),

              SizedBox(width: 10,),

              new GestureDetector(
                onTap: (){},
                child: new Container(
                  height: 30,
                  width: 30,
                  decoration: BoxDecoration(
                    color: Colors.red[400],
                    borderRadius: BorderRadius.circular(100),
                  ),
                  child: new Icon(
                    Icons.remove_red_eye,
                    color: Colors.white,
                    size: 20,
                  ),
                ),
              ),
            ],
          ),
        ),


        new Container(
          padding: EdgeInsets.only(top: 105,right: 10),
          child: new Container(
            alignment: Alignment.bottomRight,
            child: new SizedBox(
              height: 23,
              width: 200,
              child: new OutlineButton(
                  textColor: Colors.indigo[900],
                  color : Colors.yellow[100],
                  onPressed: (){},
                  borderSide: BorderSide(color: Colors.indigo[900]),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      new Icon(Icons.location_on, color: Colors.red[600],size: 20,),
                      SizedBox(width: 10,),
                      new Text('Rouiba / ',textAlign: TextAlign.center,),
                      new Text('Alger',textAlign: TextAlign.center,),
                      SizedBox(width: 10,),
                    ],
                  )
              ),
            ),
          ),
        ),


        new Container(
          padding: EdgeInsets.only(left:135,top: 10,),
          child: Text(
            'Dr ' +
                widget.medecin.nom.toUpperCase() +
                ' ' +
                widget.medecin.prenom,
            style:
            TextStyle(fontSize: 20, fontWeight: FontWeight.w600, color: Colors.white),
          ),
        ),

        new Container(
          padding: EdgeInsets.only(left:135,top: 40,),
          child: new Text(
            '   '+widget.medecin.specialite + '   ',
            style: TextStyle(fontSize: 13, color: Colors.white, fontWeight: FontWeight.w600, backgroundColor: Colors.red),
          ),
        ),


        new Container(
          alignment: Alignment.topLeft,
          padding: EdgeInsets.only(top: 10, left: 5,),

          child: ClipRRect(
            borderRadius: BorderRadius.circular(60.0,),
            child: Image(
              height: 120.0,
              width: 120.0,
              image: AssetImage('images/medecin.png'),
              fit: BoxFit.cover,
            ),
          ),
        ),


      ],
    );
  }

  Widget _doctorProfile(){
    return Column(
      children: <Widget>[
        new Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[




          ],
        ),
        SizedBox(
          height: 3,
        ),

      ],
    );
  }

  Widget _contact(){
    return Container(
      alignment: Alignment.topLeft,
      padding: EdgeInsets.fromLTRB(10, 5, 10, 0),
      margin: EdgeInsets.fromLTRB(10, 5, 10, 0),
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
      child: new Column(
        children: <Widget>[
          new Row(
            children: <Widget>[
              new Container(
                height: 28,
                width: 28,
                decoration: BoxDecoration(
                  color: Colors.red[700],
                  borderRadius: BorderRadius.circular(3),
                ),
                child: new Icon(
                  Icons.contact_mail,
                  color: Colors.white,
                  size: 20,
                ),
              ),
              SizedBox(
                width: 10,
              ),
              Container(
                width: MediaQuery.of(context).size.width * 0.80,
                child: Text(
                  "Informations de Contact",
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 3,
                ),
              ),
            ],
          ),
          new Divider(),
          new Row(
            children: <Widget>[
              Icon(Icons.location_on, color: Colors.indigo[900],),
              SizedBox(
                width: 10,
              ),
              Container(
                width: MediaQuery.of(context).size.width * 0.80,
                child: Text(
                  widget.medecin.adresse,
                  style: TextStyle(fontSize: 13, color: Colors.grey),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 3,
                ),
              ),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          new Row(
            children: <Widget>[
              new Icon(Icons.phone, color: Colors.indigo[900], ),
              SizedBox(
                width: 10,
              ),
              Container(
                width: 150,
                child: Text(
                  widget.medecin.numeroTel,
                  style: TextStyle(fontSize: 13, color: Colors.grey),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 5,
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
                Icons.email,
                color: Colors.indigo[900],
              ),
              SizedBox(
                width: 10,
              ),
              Container(

                width: MediaQuery.of(context).size.width * 0.80,
                child: Text(
                  widget.medecin.adresseMail,
                  style: TextStyle(fontSize: 13, color: Colors.grey),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 5,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _programme(){
    return Container(
      alignment: Alignment.topLeft,
      padding: EdgeInsets.fromLTRB(10, 5, 10, 0),
      margin: EdgeInsets.fromLTRB(10, 5, 10, 0),
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
      child: new Column(
        children: <Widget>[
          new Row(
            children: <Widget>[
              new Container(
                height: 28,
                width: 28,
                decoration: BoxDecoration(
                  color: Colors.red[700],
                  borderRadius: BorderRadius.circular(3),
                ),
                child: new Icon(
                  Icons.schedule,
                  color: Colors.white,
                  size: 20,
                ),
              ),
              SizedBox(
                width: 10,
              ),
              Container(
                width: MediaQuery.of(context).size.width * 0.80,
                child: Text(
                  "Programme",
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 3,
                ),
              ),
            ],
          ),

          new Divider(),

          Container(
            width: MediaQuery.of(context).size.width * 0.8,
            height: 150,
            child: ListView.builder(
              padding: EdgeInsets.only(right: 100,),
              itemCount: widget.medecin.jourTravail.length,
              scrollDirection: Axis.vertical,
              itemBuilder: (BuildContext context, index) {
                  return _getDayWork(
                  widget.medecin.jourTravail, index);
              },
            ),
          ),



        ],
      ),
    );
  }

  Widget _getDayWork(List listeJourTravail, int index) {
    index = index + 1;
    String day = '';
    for (int i = 0; i < listeJourTravail.length; i++) {
      if (listeJourTravail[i].toString().contains(index.toString())) {
        if (index == 1) {
          day = 'Dimanche';
        }
        if (index == 2) {
          day = 'Lundi';
        }
        if (index == 3) {
          day = 'Mardi';
        }
        if (index == 4) {
          day = 'Mercredi';
        }
        if (index == 5) {
          day = 'Jeudi';
        }
        if (index == 6) {
          day = 'Vendredi';
        }
        if (index == 7) {
          day = 'Samedi';
        }

        return new Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[

           new Container(
            child: new Row(
              children: <Widget>[
                new Text(
                  day,
                  style: TextStyle(fontSize: 15, color: Colors.grey),
                ),
              ],
            ),
           ),
           new Container(
             margin: EdgeInsets.symmetric(vertical: 2),
             child: new Row(
               children: <Widget>[
                 Container(
                   height: 20,
                   width: 50,
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
                     "08:00",
                     style: TextStyle(fontSize: 12),
                   ),
                 ),

                 SizedBox(width: 5,),

                 Container(
                   height: 20,
                   width: 50,
                   alignment: Alignment.center,
                   margin: EdgeInsets.symmetric(horizontal: 2),
                   decoration: BoxDecoration(
                     color: Colors.red[300],
                     borderRadius: BorderRadius.circular(5.0),
                     boxShadow: [
                       BoxShadow(
                         color: Colors.black26,
                         offset: Offset(0.8, 2.0),
                         blurRadius: 1.0,
                       ),
                     ],
                   ),
                   child: new Text(
                     "16:00",
                     style: TextStyle(fontSize: 12),
                   ),
                 ),
               ],
             ),
           )

          ],
        );
      }
    }
  }

  Widget _services(){
    return Container(
      alignment: Alignment.topLeft,
      padding: EdgeInsets.fromLTRB(10, 5, 10, 0),
      margin: EdgeInsets.fromLTRB(10, 5, 10, 0),
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
      child: new Column(
        children: <Widget>[
          new Row(
            children: <Widget>[
              new Container(
                height: 28,
                width: 28,
                decoration: BoxDecoration(
                  color: Colors.red[700],
                  borderRadius: BorderRadius.circular(3),
                ),
                child: new Icon(
                  Icons.assignment_ind,
                  color: Colors.white,
                  size: 20,
                ),
              ),
              SizedBox(
                width: 10,
              ),
              Container(
                width: MediaQuery.of(context).size.width * 0.80,
                child: Text(
                  "Service",
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 3,
                ),
              ),
            ],
          ),

          new Divider(),

          Container(
            width: MediaQuery.of(context).size.width * 0.8,
            height: 150,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                new Text('Consulation', style: TextStyle(color: Colors.grey),),
                new SizedBox(height: 3,),
                new Text('Platre et chirurgie des fractures', style: TextStyle(color: Colors.grey),),
                new SizedBox(height: 3,),
                new Text('Maladies rhumatismales et rachis', style: TextStyle(color: Colors.grey),),
                new SizedBox(height: 3,),
                new Text('Chirurgie de la main et des nerfs sous microscope', style: TextStyle(color: Colors.grey),),
                new SizedBox(height: 3,),
                new Text('Arthroscopie', style: TextStyle(color: Colors.grey),),
                new SizedBox(height: 3,),
                new Text('Pied Bot', style: TextStyle(color: Colors.grey),),
                new SizedBox(height: 3,),
                new Text('Mésothérapie', style: TextStyle(color: Colors.grey),),
                new SizedBox(height: 3,),
              ],
            )
          ),



        ],
      ),
    );
  }

  Widget _rdv(){
    return Container(
      alignment: Alignment.topLeft,
      padding: EdgeInsets.fromLTRB(10, 5, 10, 0),
      margin: EdgeInsets.fromLTRB(10, 5, 10, 0),
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
      child: new Column(
        children: <Widget>[
          new Row(
            children: <Widget>[
              new Container(
                height: 28,
                width: 28,
                decoration: BoxDecoration(
                  color: Colors.red[700],
                  borderRadius: BorderRadius.circular(3),
                ),
                child: new Icon(
                  Icons.contacts,
                  color: Colors.white,
                  size: 20,
                ),
              ),
              SizedBox(
                width: 10,
              ),
              Container(
                width: MediaQuery.of(context).size.width * 0.80,
                child: Text(
                  "Comment prendre un rendez-vous ?",
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 3,
                ),
              ),
            ],
          ),

          new Divider(),

          Container(
              padding: EdgeInsets.all( 10,),
              height: 100,
              child: new Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  new GestureDetector(
                    onTap: (){},
                    child: new Column(
                      children: <Widget>[
                        new Container(
                          height: 60,
                          width: 60,
                          decoration: BoxDecoration(
                            color: Colors.orange[900],
                            borderRadius: BorderRadius.circular(100),
                          ),
                          child: new Icon(
                            Icons.phone,
                            color: Colors.white,
                            size: 45,
                          ),
                        ),

                        new Text('Téléphone'),
                      ],
                    ),
                  ),


                  new GestureDetector(
                    onTap: (){},
                    child: new Column(
                      children: <Widget>[
                        new Container(
                          height: 60,
                          width: 60,
                          decoration: BoxDecoration(
                            color: Colors.green[500],
                            borderRadius: BorderRadius.circular(100),
                          ),
                          child: new Icon(
                            Icons.person_pin_circle,
                            color: Colors.white,
                            size: 45,
                          ),
                        ),

                        new Text('Sur place'),
                      ],
                    ),
                  ),

                  new GestureDetector(
                    onTap: (){},
                    child: new Column(
                      children: <Widget>[
                        new Container(
                          height: 60,
                          width: 60,
                          decoration: BoxDecoration(
                            color: Colors.grey[700],
                            borderRadius: BorderRadius.circular(100),
                          ),
                          child: new Icon(
                            Icons.email,
                            color: Colors.white,
                            size: 45,
                          ),
                        ),

                        new Text('Email'),
                      ],
                    ),
                  ),


                  new GestureDetector(
                    onTap: (){},
                    child: new Column(
                      children: <Widget>[
                        new Container(
                          height: 60,
                          width: 60,
                          decoration: BoxDecoration(
                            color: Colors.blue[700],
                            borderRadius: BorderRadius.circular(100),
                          ),
                          child: new Icon(
                            Icons.rate_review,
                            color: Colors.white,
                            size: 45,
                          ),
                        ),

                        new Text('Notre système'),
                      ],
                    ),
                  ),


                ],
              )
          ),



        ],
      ),
    );
  }



  Future<void> _makePhoneCall(String url) async {
    if (await UrlLauncher.canLaunch(url)) {
      await UrlLauncher.launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}
