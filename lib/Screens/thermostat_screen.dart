import 'package:flutter/material.dart';
import 'package:intelligent/Screens/chart.dart';
import 'package:intelligent/Widgets/thermostat.dart';

class ThermostatScreen extends StatefulWidget {
  static const routeName = '/thermostat';

  @override
  _ThermostatScreenState createState() => _ThermostatScreenState();
}

class _ThermostatScreenState extends State<ThermostatScreen> {


  bool _turnOn;

  @override
  void initState() {
    _turnOn = false;
    super.initState();
  }

  String title = 'A/C';
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      backgroundColor: _turnOn ? Colors.blue : Colors.white,
      appBar: AppBar(
        title: Text(
          title,
          style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
        ),
        backgroundColor:  Colors.amberAccent,
      ),
        body: new Container(

          decoration: BoxDecoration(

            /*gradient: new LinearGradient(
            colors: [
              const Color(0xFF0F2027),
              const Color(0xFF2C5364),
            ],
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
          ),*/
            ),

        child: new SafeArea(
          child: new Column(
            children: <Widget>[
              new Expanded(
                child: new Center(
                  child: new Thermostat(
                    radius: 150.0,
                    turnOn: _turnOn,
                    modeIcon: Icon(
                      Icons.ac_unit,
                      color: _turnOn ? Colors.white : Colors.blueAccent,
                      size: 30,
                    ),
                    textStyle: new TextStyle(
                      color: _turnOn ? Colors.white : Colors.black,
                      fontSize: 50.0,
                      fontWeight: FontWeight.bold,
                    ),
                    minValue: 16,
                    maxValue: 28,
                    initialValue: 26,
                    onValueChanged: (value) {
                      print('Selected value : $value');
                    },
                  ),
                ),
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Text(_turnOn ?
                  'Air Conditioner is On' : 'Air Conditioner is Off',
                    style: TextStyle(
                        color: _turnOn ? Colors.white : Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 30,),
                    textAlign: TextAlign.center,
                  )],),

              new Container(
                //width: double.infinity,
                color: _turnOn ? Colors.white : Colors.black,

                height:_turnOn ? 1.0 : 2.0,
              ),
              new Container(
                margin: EdgeInsets.symmetric(vertical: 24.0),
                child: new Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    BottomButton(
                      icon: new Icon(
                        Icons.ac_unit,
                        color: _turnOn ? Colors.white : Colors.black,
                        size: 40,
                      ),
                      text: 'Cooling',

                      onTap: () {
                        setState(() {
                          _turnOn = !_turnOn;
                        });
                      },
                    ),
                    BottomButton(
                      icon: new Icon(
                        Icons.history,
                        color: _turnOn ? Colors.white : Colors.black,
                        size: 40,
                      ),
                      text: 'History',
                      onTap: () {
                        Navigator.of(context).pushNamed(
                            HomePage.routeName,
                        );
                      },

                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}


class BottomButton extends StatelessWidget {
  final Widget icon;
  final String text;
  final VoidCallback onTap;

  const BottomButton({
    Key key,
    this.icon,
    this.text,
    this.onTap,
  }) : super(key: key);


  @override

  Widget build(BuildContext context) {

    return new GestureDetector(
      onTap: onTap,
      child: new Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[

          new Container(
            width: 80.0,
            height: 70.0,
            margin: const EdgeInsets.only(bottom: 8.0),
            decoration: new BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: Colors.black, width: 3),
            ),
            child: icon,
          ),
          new Text(
            text,
            style: const TextStyle(
              color: Colors.black,
              fontSize: 22.0,
              fontWeight: FontWeight.bold,
            ),
          )
        ],
      ),
    );
  }
}
