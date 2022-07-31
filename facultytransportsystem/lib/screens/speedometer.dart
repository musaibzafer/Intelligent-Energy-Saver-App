

import 'dart:ffi';

import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:kdgaugeview/kdgaugeview.dart';

import 'mainscreen.dart';


class Speed extends StatefulWidget {
  static const routeName = '/speed';

  @override
  _SpeedState createState() => _SpeedState();
}

class _SpeedState extends State<Speed> {
  DatabaseReference databaseReference =
  FirebaseDatabase.instance.reference().child('APP').child('Transport').child('speed');

  String title = 'Bus Speed';

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

    print('speed');
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
              double result= double.parse(temp);

              return Center(
                child: Container(
                  height: 400,
                  width: 400,
                  padding: EdgeInsets.all(16.0),
                  child: KdGaugeView(
                    minSpeed: 0,
                    maxSpeed: 100,
                    speed: result,
                    speedTextStyle: TextStyle(
                      color: Colors.lightGreen,
                      fontSize: 64,
                      fontWeight: FontWeight.bold,
                    ),
                    animate: true,
                    duration: Duration(seconds: 5),
                    subDivisionCircleColors: Colors.lightGreen,
                    innerCirclePadding: 32.0,
                    unitOfMeasurement: 'km/hr',
                    unitOfMeasurementTextStyle: TextStyle(
                      color: Colors.lightGreen,
                      fontSize: 42,
                      fontFamily: 'Arial Black',
                      fontWeight: FontWeight.w900,
                    ),
                    minMaxTextStyle: TextStyle(
                      color: Colors.lightGreen,
                      fontSize: 20.0,
                      fontWeight: FontWeight.w900,
                    ),
                    gaugeWidth: 16.0,
                    alertColorArray: [
                      Colors.lightGreen,
                      Colors.lightGreen,
                      Colors.lightGreen,
                    ],
                    alertSpeedArray: [0.0, 40.0, 60.0],
                  ),
                ),
              );
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
