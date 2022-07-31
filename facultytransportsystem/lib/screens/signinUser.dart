import 'package:facultytransportsystem/screens/mainscreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

import 'Methods.dart';
import 'dashboardAdmin.dart';
import 'dashboardUser.dart';

class SigninPage extends StatefulWidget {
  static const routeName = '/signuser';
  @override
  _SigninPageState createState() => _SigninPageState();
}

class _SigninPageState extends State<SigninPage> {
  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();
  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: AppBar(

          backgroundColor: Colors.green,
          title: Text(
            "",
            style: TextStyle(fontSize: 26,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),

          ),
        ),
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
           onTap: (_){
                  Navigator.of(context).pushNamed(
                    MainScreen.routeName,
                  );},
              ),

        body:
      isLoading
      ? Center(
      child: Container(
      height:  20,
      width: 20,
      child: CircularProgressIndicator(color: Colors.green,),
    ),
    )
        :
    Column(crossAxisAlignment: CrossAxisAlignment.start, children: <
    Widget>[

    Container(
    child: Stack(
    children: <Widget>[


    Container(

    height: 100,
    width:200,
    padding: EdgeInsets.only(
    top: 30,
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
    child: Text(
    'USER',
    style:
    TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold,color: Colors.white),
    textAlign: TextAlign.center,
    ),

    ),



    Container(
    padding: EdgeInsets.fromLTRB(15.0, 110.0, 0.0, 0.0),
    child: Text(
    'Sign In',
    style:
    TextStyle(fontSize: 80.0, fontWeight: FontWeight.bold,color: Colors.green),
    ),
    ),
    /*  Container(
                  padding: EdgeInsets.fromLTRB(260.0, 125.0, 0.0, 0.0),
                  child: Text(
                    ' .',
                    style: TextStyle(
                        fontSize: 80.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.green),
                  ),
                )*/

    ]),
    ),
    Expanded(
    child:SingleChildScrollView(
    child:
    Container(
    padding: EdgeInsets.only(top: 35.0, left: 20.0, right: 20.0),
    child: Column(
    children: <Widget>[
    TextField(
    controller:_email,
    decoration: InputDecoration(
    labelText: 'ID',
    labelStyle: TextStyle(
    fontFamily: 'Montserrat',
    fontWeight: FontWeight.bold,
    color: Colors.grey),
    // hintText: 'EMAIL',
    // hintStyle: ,
    focusedBorder: UnderlineInputBorder(
    borderSide: BorderSide(color: Colors.green))),
    ),
    SizedBox(height: 10.0),
    TextField(
    controller: _password,

    decoration: InputDecoration(

    labelText: 'PASSWORD ',
    labelStyle: TextStyle(
    fontFamily: 'Montserrat',
    fontWeight: FontWeight.bold,
    color: Colors.grey),
    focusedBorder: UnderlineInputBorder(
    borderSide: BorderSide(color: Colors.green))),
    obscureText: true,
    ),
    SizedBox(height: 10.0),
    /* TextField(
                    decoration: InputDecoration(
                        labelText: 'NICK NAME ',
                        labelStyle: TextStyle(
                            fontFamily: 'Montserrat',
                            fontWeight: FontWeight.bold,
                            color: Colors.grey),
                        focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.green))),
                  ),*/
    SizedBox(height: 50.0),
    Container(

    child:FlatButton(
    shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(20)
    ),

    minWidth: 350,
    height: 50,
    child: Text("SIGN IN",
    style: TextStyle(
    fontSize: 24.0,
    fontWeight: FontWeight.bold,
    ),),

    color: Colors.green,
    textColor: Colors.white,
    onPressed: () {
    if (_email.text.isNotEmpty && _password.text.isNotEmpty) {
    setState(() {
    isLoading = true;
    });

    logIn(_email.text, _password.text).then((user) {
    if (user != null) {
    print("Login Sucessfull");
    setState(() {
    isLoading = false;
    });
    Navigator.of(context).pushNamed(
    DashboardUser.routeName,
    );
    } else {
    print("Login Failed");
    setState(() {
    isLoading = false;
    createAlertDialog(context);
    });
    }
    });
    } else {
    print("Please fill form correctly");
    creatAlertDialog(context);
    }


    },
    ),


    ),
    /*   Container(
                      height: 45.0,
                      child: Material(
                        borderRadius: BorderRadius.circular(20.0),
                        shadowColor: Colors.greenAccent,
                        color: Colors.green,
                        elevation: 7.0,
                        child: GestureDetector(

                          onTap: () {
                            if (_email.text.isNotEmpty && _password.text.isNotEmpty) {
                              setState(() {
                                isLoading = true;
                              });

                              logIn(_email.text, _password.text).then((user) {
                                if (user != null) {
                                  print("Login Sucessfull");
                                  setState(() {
                                    isLoading = false;
                                  });
                                  Navigator.of(context).pushNamed(
                                    DashboardAdmin.routeName,
                                  );
                                } else {
                                  print("Login Failed");
                                  setState(() {
                                    isLoading = false;
                                    createAlertDialog(context);
                                  });
                                }
                              });
                            } else {
                              print("Please fill form correctly");
                              createAlertDialog(context);
                            }

                          },
                          child: Center(

                            child: Text(
                              'SIGN IN',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'Montserrat'),
                            ),
                          ),
                        ),
                      )),*/
    SizedBox(height: 20.0),
    /*  Container(
                    height: 40.0,
                    color: Colors.transparent,
                    child: Container(
                      decoration: BoxDecoration(
                          border: Border.all(
                              color: Colors.black,
                              style: BorderStyle.solid,
                              width: 1.0),
                          color: Colors.transparent,
                          borderRadius: BorderRadius.circular(20.0)),
                      child: InkWell(
                        onTap: () {
                          Navigator.of(context).pop();
                        },
                        child:

                        Center(
                          child: Text('Go Back',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'Montserrat')),
                        ),


                      ),
                    ),
                  ),*/

    ],
    )),

    // SizedBox(height: 15.0),
    // Row(
    //   mainAxisAlignment: MainAxisAlignment.center,
    //   children: <Widget>[
    //     Text(
    //       'New to Spotify?',
    //       style: TextStyle(
    //         fontFamily: 'Montserrat',
    //       ),
    //     ),
    //     SizedBox(width: 5.0),
    //     InkWell(
    //       child: Text('Register',
    //           style: TextStyle(
    //               color: Colors.green,
    //               fontFamily: 'Montserrat',
    //               fontWeight: FontWeight.bold,
    //               decoration: TextDecoration.underline)),
    //     )
    //   ],
    // )

    ))]));

  }
  Future createAlertDialog(BuildContext context){
    return showDialog(
        context: context,
        builder: (context){
          return AlertDialog(
            title: Icon(Icons.error),
            content: Text("Login Failed Please Insert Correct Details",
              textAlign: TextAlign.center,
            ),
            actions: <Widget>[
              MaterialButton(
                elevation: 5.0,
                onPressed: Navigator.of(context).pop,
                child:Text("OK"),
              )
            ],
          );
        }
    );
  }
  Future creatAlertDialog(BuildContext context){
    return showDialog(
        context: context,
        builder: (context){
          return AlertDialog(
            title: Icon(Icons.error),
            content: Text("Login Failed Please Insert All The Fields",
              textAlign: TextAlign.center,
            ),
            actions: <Widget>[
              MaterialButton(
                elevation: 5.0,
                onPressed: Navigator.of(context).pop,
                child:Text("OK"),
              )
            ],
          );
        }
    );
  }
}