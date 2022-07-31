

import 'dart:ffi';

import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:kdgaugeview/kdgaugeview.dart';

import 'mainscreen.dart';


class Location extends StatefulWidget {
  static const routeName = '/location';

  @override
  _LocationState createState() => _LocationState();
}

class _LocationState extends State<Location> {
  DatabaseReference databaseReference =
  FirebaseDatabase.instance.reference().child('APP').child('Transport').child('location');

  String title = 'Bus Location';

  @override
  Widget build(BuildContext context) {
    /* final ref=databaseReference.reference().child('DHT11');
    ref.child('temperature').once().then((DataSnapshot  data){
   double temp =     data.value;
   print(temp);
    });*/
    /* databaseReference.reference().child('Temperature').once()
        .then((DataSnapshot snapshot) {
        double tip = snapshot.value();





    });*/

    print('location');
    return Scaffold(
      appBar: AppBar(
        title: Text(
          title,
          style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.lightGreen,
      ),
      body: StreamBuilder(
          stream: databaseReference.onValue,
          builder: (context, AsyncSnapshot<DatabaseEvent> snapshot) {
            if (!snapshot.hasData) {
              return LinearProgressIndicator();
            } else {
              String temp = snapshot.data!.snapshot.value.toString();
              //double result= double.parse(temp);

              return Center(
                child: Container (
                  child: Column(
                      children: <Widget>[
                  Container(
                  padding: EdgeInsets.only(top: 50.0),
                  child: Container(
                    height: 300,
                    child: Image.asset(
                       'assets/images/map.jpg' ,
                    ),
                  ),
                ),
                Text("BUS LOCATION",
                  style: TextStyle(
                    color: Colors.green,
                    fontSize: 28,
                    fontFamily: 'ArialBlack',
                     fontWeight: FontWeight.w900,
                    decoration: TextDecoration.underline,
                    decorationColor: Colors.green,
                  ),
                ),
                        SizedBox(
                          height: 15,
                        ),
                Container(
                  height: 80,
                  width: 400,
                  padding: EdgeInsets.all(16.0),
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [Colors.greenAccent, Colors.lightGreen]),
                      borderRadius: BorderRadius.only(
                          topRight: Radius.circular(60),
                          bottomRight: Radius.circular(60)
                      )),
                 //color: Colors.lightGreen,
                child:Text(
                  temp,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontFamily: 'ArialBlack',
                   // fontWeight: FontWeight.w900,
                    decoration: TextDecoration.underline,
                    decorationColor: Colors.white,
                  ),
                ),

                ),
              ])));
            }
          }),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.lightGreen,
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
            MainScreen.routeName,
          );},
      ),
    );
  }
}
