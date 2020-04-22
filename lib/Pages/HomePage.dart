import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:medecins_dz/Pages/annuaire_medecins.dart';
import 'package:medecins_dz/Pages/searchPage.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  GlobalKey _bottomNavigationKey = GlobalKey();
  int _currentIndex;
  final PageStorageBucket bucket = PageStorageBucket();
  @override
  void initState() {
    // TODO: implement initState
    _currentIndex =0;
    super.initState();
  }

  final List<Widget> pages = [
    searchPage(
      key: PageStorageKey('Page2'),
    ),

    annuaire_medecins(
      key: PageStorageKey('Page1'),
    ),
  ];


  final tabs_titles =[
    new Text('Recherche d\'un medecin'),
    new Text('Annuaire des medesins'),
    new Text('Recherche Géolocaliser des Medecins'),
    new Text('Listes des hopitaux'),
    new Text('Profile'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: CurvedNavigationBar(
          key: _bottomNavigationKey,
          index: 0,
          height: 50.0,
          items: <Widget>[
            Icon(Icons.search, size: 30),
            Icon(Icons.list, size: 30),
            Icon(Icons.compare_arrows, size: 30),
            Icon(Icons.call_split, size: 30),
            Icon(Icons.perm_identity, size: 30),
          ],
          color: Colors.white,
          buttonBackgroundColor: Colors.blue,
          backgroundColor: Colors.grey[200],
          animationCurve: Curves.easeInOut,
          animationDuration: Duration(milliseconds: 300),
          onTap: (index) {
            setState(() {
              _currentIndex = index;
            });
          },
        ),

        appBar: AppBar(
          elevation: 10,
          backgroundColor: Colors.blue[400],
          title: tabs_titles[_currentIndex],
          centerTitle: true,
        ),

        body: PageStorage(
          child: pages[_currentIndex],
          bucket: bucket,
        ),

    );
  }
}