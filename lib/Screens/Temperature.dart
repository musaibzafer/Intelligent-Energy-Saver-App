import 'package:flutter/material.dart';
import 'package:kdgaugeview/kdgaugeview.dart';
import 'package:firebase_database/firebase_database.dart';

class Temperature extends StatefulWidget {
  static const routeName = '/temperature';

  @override
  _TemperatureState createState() => _TemperatureState();
}
class _TemperatureState extends State<Temperature> {


final  databaseReference = FirebaseDatabase.instance;


  @override
  void initState() {
    super.initState();

    databaseReference.reference()
        .child('Temperature')
        .once()
        .then((DataSnapshot snapshot) {
          double temp = snapshot.value['Temperature'];
print(temp);


    });
  }

  String title = 'Temperature';

  @override
  Widget build(BuildContext context) {
   /* final ref=databaseReference.reference().child('DHT11');
    ref.child('temperature').once().then((DataSnapshot  data){
   double temp =     data.value;
   print(temp);
    });*/
    print('temperature');
    return Scaffold(
      appBar: AppBar(
        title: Text(title,
        style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),),
        backgroundColor: Colors.amberAccent,
      ),
      body: Center(
        child: Container(
          height: 400,
          width: 400,
          padding: EdgeInsets.all(16.0),

          child: KdGaugeView(

            minSpeed: 0,
            maxSpeed: 60,
            speed: 30,
            speedTextStyle: TextStyle(
              color: Colors.black,
              fontSize: 64,
              fontWeight: FontWeight.bold,
            ),
            animate: true,
            duration: Duration(seconds: 5),
            subDivisionCircleColors: Colors.black,
            innerCirclePadding: 32.0,

            unitOfMeasurement: '°C' ,
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
      ),
    );
  }
}
