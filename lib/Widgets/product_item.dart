import 'dart:io';
import '../Screens/thermostat_screen.dart';
import '../Screens/light.dart';
import '../Screens/fan.dart';
import '../Screens/Temperature.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../Screens/product_details_screen.dart';

// ignore: must_be_immutable
class ProductItem extends StatefulWidget {
  final String id;
  final String title;
  final String subtitle;
  final IconData leftIcon;
  final IconData topRightIcon;
  final IconData bottomRightIcon;
  bool isEnable;


  ProductItem(this.id, this.title, this.subtitle, this.leftIcon,
      this.topRightIcon, this.bottomRightIcon, this.isEnable);

  @override
  _ProductItemState createState() => _ProductItemState();
}

class _ProductItemState extends State<ProductItem> {
  @override
  Widget build(BuildContext context) {

    return  Container(
      child:Scaffold(
        body: Container(
          decoration: BoxDecoration(
              boxShadow: <BoxShadow>[
                BoxShadow(
                    blurRadius: 20, offset: Offset(0, 5), color: Colors.grey),
              ],
              gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: widget.isEnable
                      ? [Colors.amberAccent, Colors.amberAccent]
                      : [Colors.white, Colors.white]),
              borderRadius: BorderRadius.circular(20)),

          child:Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.stretch,

            children: <Widget>[

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[


                  Icon(widget.leftIcon,
                      size: 40,
                      color: widget.isEnable
                          ? Colors.white
                          : Color(0xffa3a3a3)),

                  Switch(
                      value: widget.isEnable,
                      activeColor: Color(0xff457be4),
                      onChanged: (_) {
                        setState(() {
                          widget.isEnable =
                              widget.isEnable;
                        });
                      })
                ],
              ),
              SizedBox(
                height: 15,
              ),

Container(decoration: BoxDecoration(
  border: Border.all(
    color: Colors.white,
  ),),),

              Text(
                widget.title,
                style: TextStyle(

                    color: widget.isEnable
                        ? Colors.white
                        : Color(0xff302e45),

                    fontSize: 28,
                    fontWeight: FontWeight.bold),
              ),
              Text(
                widget.subtitle,
                style: TextStyle(
                    color: widget.isEnable
                        ? Colors.white
                        : Color(0xffa3a3a3),
                    fontSize: 20),
               ),
 Expanded(child:
              GestureDetector(
                onTap: ()
                {
                  if(widget.title=='Temperature') {
                    Navigator.of(context).pushNamed(
                      Temperature.routeName,
                      arguments: widget.id,
                    );
                  }
                  else if(widget.title=='Light') {
                    Navigator.of(context).pushNamed(
                      Light.routeName,
                      arguments: widget.id,
                    );
                  }
                  else if(widget.title=='Fan') {
                    Navigator.of(context).pushNamed(
                      Fan.routeName,
                      arguments: widget.id,
                    );
                  }
                  else if(widget.title=='A/C') {
                    Navigator.of(context).pushNamed(
                      ThermostatScreen.routeName,
                      arguments: widget.id,
                    );
                  }
                  else{
                    Navigator.of(context).pushNamed(
                      ProductDetailScreen.routeName,
                      arguments: widget.id,
                    );}
                },
              // Icon(model.allYatch[index].topRightIcon,color:model.allYatch[index].isEnable ? Colors.white : Color(0xffa3a3a3))
              ),)],



        ),),));
    //child: GridTile(
    //child: Container(
    //padding: EdgeInsets.all(2.0),
    //margin: EdgeInsets.all(10),
    //width: 200,
    //height: 200,
    //decoration: BoxDecoration(
    //border: Border.all(color: Colors.amberAccent, width: 3.0),
    //color: Color.fromRGBO(220, 220, 220, 1),
    //borderRadius: BorderRadius.circular(10),
    //shape: BoxShape.rectangle,
    //),
    //child: GestureDetector(
    //onTap: () {
    //    Navigator.of(context).pushNamed(
    //        ProductDetailScreen.routeName,
    //          arguments: id,
    //          );
    //          },

    // ),
    //),
    //footer: GridTileBar(
    // leading: IconButton(
    //  icon: Icon(Icons.favorite),
    // onPressed: () {},
    //color: Theme.of(context).accentColor,
    //),
    //title: Text(
    //title,
    //style: TextStyle(
    //  color: Colors.black, fontSize: 24, fontWeight: FontWeight.bold),
    //textAlign: TextAlign.center,
    //),
    //trailing: IconButton(
    // icon: Icon(Icons.shopping_cart),
    //onPressed: () {},
    //color: Theme.of(context).accentColor,
    //),
    //),
    //),
    //);
    //}
//}
  }
}