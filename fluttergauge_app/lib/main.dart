import 'dart:html';

import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
        // This makes the visual density adapt to the platform that you run
        // the app on. For desktop platforms, the controls will be smaller and
        // closer together (more dense) than on mobile platforms.
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Scaffold(
    body: Center(
    child: Container(
        child: SfRadialGauge(
            axes: <RadialAxis>[
              RadialAxis(minimum: 0, maximum: 100,

                  ranges: <GaugeRange>[
                    Range(GaugeTextStyle:),
                    GaugeRange(startValue: 0, endValue: 50, color:Colors.amberAccent),
                    GaugeRange(startValue: 50,endValue: 100,color: Colors.amberAccent),
                    GaugeRange(startValue: 100,endValue: 150,color: Colors.amberAccent)],
                  pointers: <GaugePointer>[
                    MarkerPointer(value: 90)

                  ],
                  annotations: <GaugeAnnotation>[
                    GaugeAnnotation(widget: Container(child:
                    Text('90%',style: TextStyle(fontSize: 50,fontWeight: FontWeight.bold))),
                        angle: 90, positionFactor: 0.5
                    )]
              )])
        )
    )));

  }
}



