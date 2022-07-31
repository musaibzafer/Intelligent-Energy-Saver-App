import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:cloud_firestore/cloud_firestore.dart';
class HomePage extends StatefulWidget {
  final Widget child;
  static const routeName = '/chart';
  HomePage({Key key, this.child}) : super(key: key);

  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  List<charts.Series<Stats, int>> _seriesLineData;
  List<Stats> mydata;

  _generateData(mydata) {
    _seriesLineData = List<charts.Series<Stats,int>>();
    _seriesLineData.add(
      charts.Series(
        domainFn: (Stats stats, _) => stats.hours,
        measureFn: (Stats stats, _) => stats.status,
        colorFn: (__, _) => charts.ColorUtil.fromDartColor(Colors.purpleAccent),
        id: 'Stats',
        data: mydata,
        //labelAccessorFn: (Stats row, _) => "${row.status}",
      ),
    );
  }


  @override
  Widget build(BuildContext context) {
    return
         DefaultTabController(
            length: 1,
            child:
            Scaffold(
              appBar: AppBar(
                title: Text(
                  'Statistics',
                  style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
                ),
                backgroundColor: Colors.amberAccent,
              ),
              body: _buildBody(context),
            ));
  }
  Widget _buildBody(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: Firestore.instance.collection('post').snapshots(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return LinearProgressIndicator();
        } else {
          List<Stats> stats = snapshot.data.documents
              .map((documentSnapshot) => Stats.fromMap(documentSnapshot.data))
              .toList();
          return _buildChart(context, stats);
        }
      },
    );
  }
  Widget _buildChart(BuildContext context, List<Stats> statsdata) {
    mydata = statsdata;
    _generateData(mydata);
    return TabBarView(
        children: [
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Container(
              child: Center(
                child: Column(
                  children: <Widget>[
                    Text(
                      'Appliance History',
                      style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    Expanded(
                      child: charts.LineChart(
                        _seriesLineData,
                        defaultRenderer: new charts.LineRendererConfig(
                            includeArea: true, stacked: true,includePoints: true ),
                        animate: true,
                        animationDuration: Duration(seconds: 5),
                        behaviors: [
                          new charts.ChartTitle('Hours',
                              behaviorPosition: charts.BehaviorPosition.bottom,
                              titleOutsideJustification:charts.OutsideJustification.middleDrawArea),
                          new charts.ChartTitle('Status',
                              behaviorPosition: charts.BehaviorPosition.start,
                              titleOutsideJustification: charts.OutsideJustification.middleDrawArea),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          )]);
  }
}


class Stats {

  int hours;
  final int status;

  Stats(this.status, this.hours);

  Stats.fromMap(Map<String, dynamic> map)
      : assert(map['status'] != null),
        assert(map['hours'] != null),
        status = map['status'],
        hours = map['hours'];
  @override
  String toString() => "Record<$status:$hours>";

}
