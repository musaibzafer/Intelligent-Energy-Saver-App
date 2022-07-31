import 'package:flutter/material.dart';

// ignore: must_be_immutable
class Light extends StatelessWidget {
  static const routeName = '/light';
  String title = 'Light';
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
}

class HomeBody extends StatefulWidget {
  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomeBody> {
  bool isSwitched = false;
  @override
  Widget build(BuildContext context) {
    return Container(
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
