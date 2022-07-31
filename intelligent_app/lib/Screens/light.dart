import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';

import 'products_overview_screen.dart';
// ignore: must_be_immutable
/*class Light extends StatelessWidget {



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          title,
          style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.amberAccent,
      ),
      body: HomeBody(),
    );
  }
}*/

class Light extends StatefulWidget {
  static const routeName = '/light';
  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<Light> {

  DatabaseReference databaseReference =
  FirebaseDatabase.instance.reference().child('APP').child('RELAY').child('Lights');

  String title = 'Light';


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
      title: Text(
      title,
      style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
    ),

    backgroundColor: Colors.amberAccent,
      ),
    body: StreamBuilder(
    stream: databaseReference.onValue,
    builder: (context, snapshot) {
    if (!snapshot.hasData) {
    return LinearProgressIndicator();
    } else {
      bool isSwitched  = snapshot.data.snapshot.value;
    return
        Container(
        color: isSwitched ? Colors.amberAccent : Colors.white,
        child: Column(
          children: <Widget>[
            Container(
              padding: EdgeInsets.only(top: 50.0),
              child: Container(
                height: 400,
                child: Image.asset(
                  isSwitched ? 'assets/images/b2.png' : 'assets/images/b1.jpg',
                ),
              ),
            ),
            Container(
              child: Center(
                child: Switch(
                  value: isSwitched,
                  onChanged: (value) {
                    if (isSwitched == false) {
                      setState(() {
                        isSwitched = value;
                      });
                    } else {
                      isSwitched = false;
                    }
                  },
                  activeColor: Colors.orange,
                ),
              ),
            ),
            Text(
              isSwitched ? 'Lights Are On' : 'Lights Are Off',
              style: TextStyle(
                color: isSwitched ? Colors.white : Colors.black,
                fontSize: 26,
                fontWeight: FontWeight.bold,
              ),
            )
          ],
        ));
  }
}
    ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.amberAccent,
        iconSize: 30,
        items:[
          BottomNavigationBarItem(
            icon: Icon(Icons.home,color: Colors.white,),
            title:Text('Home',
              style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
          ),
        ],
        onTap: (_){
          Navigator.of(context).pushNamed(
            ProductsOverviewScreen.routeName,
          );},
      ),

    );}}