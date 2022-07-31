

import 'package:facultytransportsystem/screens/Data.dart';
import 'package:facultytransportsystem/screens/createAccount.dart';
import 'package:facultytransportsystem/screens/dashboardAdmin.dart';
import 'package:facultytransportsystem/screens/dashboardUser.dart';
import 'package:facultytransportsystem/screens/location.dart';
import 'package:facultytransportsystem/screens/mainscreen.dart';
import 'package:facultytransportsystem/screens/signupadmin.dart';
import 'package:facultytransportsystem/screens/signinUser.dart';
import 'package:facultytransportsystem/screens/speedometer.dart';
import 'package:facultytransportsystem/screens/submit.dart';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
      home: MainScreen(),
      routes:{
        SignupPage.routeName:(ctx)=>SignupPage(),
        SigninPage.routeName:(ctx)=>SigninPage(),
        MainScreen.routeName:(ctx)=>MainScreen(),
        DashboardAdmin.routeName:(ctx)=>DashboardAdmin(),
        DashboardUser.routeName:(ctx)=>DashboardUser(),
        CreateAccount.routeName:(ctx)=>CreateAccount(),
        Speed.routeName:(ctx)=>Speed(),
        Data.routeName:(ctx)=>Data(),
        Location.routeName:(ctx)=>Location(),
        Submit.routeName:(ctx)=>Submit(),
      },
    );
  }
}
