import 'package:facultytransportsystem/screens/signupadmin.dart';
import 'package:facultytransportsystem/screens/signinUser.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class MainScreen extends StatelessWidget {
  static const routeName = '/mainscreen';
/*
  Widget _upperContainer() {
    return Container(
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
                      Text(
                        DateFormat.yMMMd().format(DateTime.now()),
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
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
                    ],),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    'Faculty Transport System',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    //  decoration: TextDecoration.underline,
                     // decorationColor: Colors.white,
                    ),
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
                    border: Border.all(width: 3, color: Colors.white),
                    borderRadius: BorderRadius.circular(25)),
                child: Icon(
                  MdiIcons.bus,
                  color: Colors.white,
                  size: 40,
                ),
              ),
              SizedBox(
                width: 15,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
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
                        'DASHBOARD',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                          decoration: TextDecoration.none,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    'Hamdard University',
                    style: TextStyle(
                      color: Colors.white54,
                      fontSize: 18,
                      decoration: TextDecoration.none,
                    ),
                  ),
                ],
              )
            ],
          )
        ],
      ),
    );
  }*/

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.white,
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[

          Container(
            height: 220,
            width: MediaQuery.of(context).size.width,
            padding: EdgeInsets.only(
                top: MediaQuery.of(context).padding.top + 30,
                bottom: 30,
                left: 30,
                right: 30.0),
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [Colors.greenAccent, Colors.green]),
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(50),
                    bottomRight: Radius.circular(50))),
            child: Container(
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
                            ],),
                          SizedBox(
                            height: 10,
                          ),


                          Text(
                            'FACULTY TRANSPORT SYSTEM',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontFamily: 'ArialBlack',
                              fontWeight: FontWeight.w900,
                               decoration: TextDecoration.underline,
                               decorationColor: Colors.white,
                            ),
                          ),

                        ],
                      ),

                    ],
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        height: 60,
                        width: 60,
                       // decoration: BoxDecoration(
                         //   border: Border.all(width: 3, color: Colors.white),
                           // borderRadius: BorderRadius.circular(25)),
                        child: Icon(
                          MdiIcons.bus,
                          color: Colors.white,
                          size: 80,
                        ),
                      ),
                      SizedBox(
                        width: 22,
                      ),

                      Column(

                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          SizedBox(
                            height: 12,
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
                                'DASHBOARD',
                                style: TextStyle(
                                  fontFamily: 'ArialBlack',
                                  color: Colors.white,
                                  fontSize: 22,
                                  fontWeight: FontWeight.bold,
                                  decoration: TextDecoration.underline,
                                  decorationColor: Colors.white54,
                                ),
                              ),
                            ],
                          ),

                          Text(
                            'HAMDARD UNIVERSITY',
                            style: TextStyle(
                              fontFamily: 'ArialBlack',
                              color: Colors.white54,
                              fontSize: 20,
                              decoration: TextDecoration.underline,
                              decorationColor: Colors.white54,
                            ),
                          ),
                        ],
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
          Expanded(child: Container(
            height: 500,

            child: Scaffold(
              body:Center(
                child : Column(
                children:<Widget>[
                  SizedBox(
                    height: 70,
                  ),
                  Container(

                    height: 100,
                    child: Image.asset(
                       'assets/images/6.gif' ,
                    ),

                  ),
                  SizedBox(
                    height: 80,
                  ),
                  Container(
                    margin: EdgeInsets.all(5),
                    child: FlatButton.icon(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                      minWidth: 300,
                      height: 45,
                      icon: Icon(Icons.admin_panel_settings),
                      label: Text("ADMIN",
                        style: TextStyle(
                        fontSize: 24.0,
                        fontWeight: FontWeight.bold,
                      ),),
                      color: Colors.green,
                      textColor: Colors.white,
                      onPressed: () {
                        Navigator.of(context).pushNamed(
                          SignupPage.routeName,

                        );
                      },
                    ),
              ),

                Container(

                  child:FlatButton.icon(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)
                    ),
                    minWidth: 300,
                    height: 45,
                    icon: Icon(Icons.supervised_user_circle),
                    label: Text("USER",
                      style: TextStyle(
                        fontSize: 24.0,
                        fontWeight: FontWeight.bold,
                      ),),
                    color: Colors.green,
                    textColor: Colors.white,
                    onPressed: () {
                      Navigator.of(context).pushNamed(
                          SigninPage.routeName,
                      );
                    },
                  ),


                ),
                ],

                ),),
              bottomNavigationBar: BottomNavigationBar(
                backgroundColor: Colors.green,
                iconSize: 30,
                items:[
                  BottomNavigationBarItem(
                    icon: Icon(Icons.home,color: Colors.white,),
                    title:Text('Home',
                      style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
                  ),
                ],
               /* onTap: (_){
                  Navigator.of(context).pushNamed(
                    ProductsOverviewScreen.routeName,
                  );},
              ),*/
            ),
          ),
          ))]));
  }
}