
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:facultytransportsystem/screens/Data.dart';
import 'package:facultytransportsystem/screens/mainscreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:intl/intl.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'createAccount.dart';


class DashboardAdmin extends StatefulWidget {


  static const routeName = '/dashadmin';
  @override
  _DashboardAdminState createState() => _DashboardAdminState();
}

class _DashboardAdminState extends State<DashboardAdmin> {

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        /*appBar: AppBar(

          backgroundColor: Colors.green,
          title: Text(
            "",
            style: TextStyle(fontSize: 26,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),

          ),

        ),*/

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

        body:
    Column(crossAxisAlignment: CrossAxisAlignment.start, children:
    <Widget>[
    Container(
    child: Stack(
    children: <Widget>[
    Container(

    height: 220,
    width:450,
    padding: EdgeInsets.only(
    top: 30,
    bottom: 30,
    left: 30,
    right: 30.0),
    decoration: BoxDecoration(
    gradient: LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,

    colors: [Colors.greenAccent, Colors.lightGreen]),

    borderRadius: BorderRadius.only(
    bottomLeft: Radius.circular(60),
    bottomRight: Radius.circular(60))),
    child:
    Container(

    alignment: Alignment.topLeft,
    padding: EdgeInsets.all(0),
    child: Column(

    crossAxisAlignment: CrossAxisAlignment.start,
    children: <Widget>[
    Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: <Widget>[
    Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: <Widget>[
    Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: <Widget>[
      SizedBox(
        height: 45,
      ),
      Text(
        DateFormat.yMMMd().format(DateTime.now()),
        style: TextStyle(
          fontFamily: 'ArialBlack',
          color: Colors.white,
          fontSize: 20,
          fontWeight: FontWeight.bold,
          decoration: TextDecoration.none,
        ),
      ),
      SizedBox(
        width: 135,
      ),

    /* Text(
                        DateFormat.jm().format(new DateTime.now()),
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          decoration: TextDecoration.none,
                        ),),*/
    ],
    ),

    Text(
    'ADMIN DASHBOARD',
    style: TextStyle(
    color: Colors.white,
      fontFamily: 'ArialBlack',
    fontSize: 30,
    fontWeight: FontWeight.bold,
    decoration: TextDecoration.underline,
    decorationColor: Colors.white,
    ),

    //textAlign: TextAlign.center,
    ),
    ],
    ),
    SizedBox(
    height: 50,
    ),
    ],
    ),
    SizedBox(
    height: 10,
    ),
    Row(
    mainAxisAlignment: MainAxisAlignment.start,
    children: <Widget>[
    Container(
    height: 60,
    width: 60,
    decoration: BoxDecoration(
    //  border: Border.all(width: 3, color: Colors.white),
    //    borderRadius: BorderRadius.circular(25)
    ),
    child: Icon(
    MdiIcons.accountBox,
    color: Colors.white,
    size: 80,
    ),
    ),
    SizedBox(
    width: 25,
    ),
    Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: <Widget>[
      SizedBox(
        height: 13,
      ),
    Row(
    children: <Widget>[
    /* Text(
                        '7.9',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                          decoration: TextDecoration.none,
                        ),
                      ),*/

    Text(
    'Hi',
    style: TextStyle(
    color: Colors.white,
      fontFamily: 'ArialBlack',
    fontSize: 22,
    fontWeight: FontWeight.w900,
    decoration: TextDecoration.none,
    ),
    ),
    ],
    ),
    //SizedBox(
    //height: 5,
    //),


    Text(
    "ADMIN",
    style: TextStyle(
      fontFamily: 'ArialBlack',
    color: Colors.white,
    fontSize: 22,
    decoration: TextDecoration.underline,
      decorationColor: Colors.white,
      fontWeight: FontWeight.w900,
    ),
    ),
    ],
    )
    ],
    )
    ],
    ),
    ))]

    /*Text(
                    'ADMIN DASHBOARD',
                    style:
                    TextStyle(fontSize: 30.0, fontWeight: FontWeight.bold,color: Colors.white),
                    textAlign: TextAlign.center,

                  ),*/


    ),



    ),

    Expanded(child: Container(
    height: 500,

    child: Scaffold(
    body:Center(
    child : Column(
    children:<Widget>[
    SizedBox(
    height: 20,
    ),
    Container(
    margin: EdgeInsets.all(5),
    child: FlatButton.icon(
    shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(10)),
    minWidth: 400,
    height: 100,
    icon: Icon(Icons.app_registration),
    label: Text("NEW REGISTERATION",
    style: TextStyle(
    fontSize: 26.0,
    fontWeight: FontWeight.bold,
    ),),
    color: Colors.lightGreen,
    textColor: Colors.white,
    onPressed: () {
    Navigator.of(context).pushNamed(
      CreateAccount.routeName,

    );
    },
    ),
    ),

    Container(
      margin: EdgeInsets.all(5),
    child:FlatButton.icon(
    shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(10)
    ),
    minWidth: 400,
    height: 100,
    icon: Icon(Icons.date_range_outlined),
    label: Text("ALL DATA",
    style: TextStyle(
    fontSize: 26.0,
    fontWeight: FontWeight.bold,
    ),),
    color: Colors.lightGreen,
    textColor: Colors.white,
    onPressed: () {
      Navigator.of(context).pushNamed(
        Data.routeName,

      );
    },
    ),


    ),
      Container(
        margin: EdgeInsets.all(5),
        child:FlatButton.icon(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10)
          ),
          minWidth: 400,
          height: 100,
          icon: Icon(Icons.comment),
          label: Text("COMPLAINS",
            style: TextStyle(
              fontSize: 26.0,
              fontWeight: FontWeight.bold,
            ),),
          color: Colors.lightGreen,
          textColor: Colors.white,
          onPressed: () {
            //Navigator.of(context).pushNamed(
            //SigninPage.routeName,
            //);
          },
        ),


      ),
    ]
    )
    )
    )
    )
    )
    ]
    )
    );



  }
  }