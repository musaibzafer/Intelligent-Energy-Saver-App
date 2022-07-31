import 'dart:ffi';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:kdgaugeview/kdgaugeview.dart';
import 'package:firebase_database/firebase_database.dart';

import 'Humidity.dart';
import 'products_overview_screen.dart';

class Temperature extends StatefulWidget {
  static const routeName = '/temperature';

  @override
  _TemperatureState createState() => _TemperatureState();
}

class _TemperatureState extends State<Temperature> {
  DatabaseReference databaseReference =
      FirebaseDatabase.instance.reference().child('APP').child('DHT11').child('temperature');

  String title = 'Temperature';

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

    print('temperature');
    return Scaffold(
        appBar: AppBar(
          title: Text(
            title,
            style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
          ),
          backgroundColor: Colors.amberAccent,
          actions: <Widget>[
            PopupMenuButton(
                onSelected: (int selectedValue) {
                  if (selectedValue == 0) {
                    Navigator.of(context).pushNamed(
                      Humidity.routeName,
                    );
                  }
                },
                color: Colors.amberAccent,
                icon: Icon(
                  Icons.more_vert,
                ),
                itemBuilder: (_) => [
                      PopupMenuItem(
                          child: Text(
                            'Humidity',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 20),
                          ),
                          value: 0),
                    ])
          ],
        ),
        body: StreamBuilder(
            stream: databaseReference.onValue,
            builder: (context, snapshot) {
              if (!snapshot.hasData) {
                return LinearProgressIndicator();
              } else {
                double temp = snapshot.data.snapshot.value +0.1;
                return Center(
                  child: Container(
                    height: 400,
                    width: 400,
                    padding: EdgeInsets.all(16.0),
                    child: KdGaugeView(
                      minSpeed: 0,
                      maxSpeed: 60,
                      speed: temp,
                      speedTextStyle: TextStyle(
                        color: Colors.black,
                        fontSize: 64,
                        fontWeight: FontWeight.bold,
                      ),
                      animate: true,
                      duration: Duration(seconds: 5),
                      subDivisionCircleColors: Colors.black,
                      innerCirclePadding: 32.0,
                      unitOfMeasurement: '°C',
                      unitOfMeasurementTextStyle: TextStyle(
                        color: Colors.black,
                        fontSize: 42,
                        fontWeight: FontWeight.bold,
                      ),
                      minMaxTextStyle: TextStyle(
                        color: Colors.black,
                        fontSize: 22.0,
                        fontWeight: FontWeight.bold,
                      ),
                      gaugeWidth: 16.0,
                      alertColorArray: [
                        Colors.black,
                        Colors.black,
                        Colors.black,
                      ],
                      alertSpeedArray: [0.0, 20.0, 50.0],
                    ),
                  ),
                );
              }
            }),
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
    );
  }
}
