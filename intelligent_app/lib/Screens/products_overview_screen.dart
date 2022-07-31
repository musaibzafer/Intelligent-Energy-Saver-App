import 'dart:developer';

import 'package:flutter/rendering.dart';
import 'package:flutter/material.dart';
import '../Widgets/products_grid.dart';
import 'package:intl/intl.dart';

import 'light.dart';

class ProductsOverviewScreen extends StatelessWidget {
  static const routeName = '/mainscreen';

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
                    'IntelligentEnergySaver',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      decoration: TextDecoration.underline,
                      decorationColor: Colors.white,
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
                height: 50,
                width: 50,
                decoration: BoxDecoration(
                    border: Border.all(width: 3, color: Colors.white),
                    borderRadius: BorderRadius.circular(25)),
                child: Icon(
                  Icons.power,
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
                        'kwh',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                          decoration: TextDecoration.none,
                        ),
                      ),
                    ],
                  ),
                  Text(
                    'Power uses for today',
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
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.white,
        child: Column(children: <Widget>[
          Container(
            height: 230,
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
                    colors: [Colors.amber, Colors.amberAccent]),
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(50),
                    bottomRight: Radius.circular(50))),
            child: _upperContainer(),
          ),
         Expanded(child: Container(
            height: 500,
            child: Scaffold(
              body: ProductsGrid(),
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
            ),
          ),
         )]));
  }
}
