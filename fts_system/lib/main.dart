import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import './providers/options.dart';
import './screens/options_overview_screen.dart';
import './screens/option_details_screen.dart';
void main() {

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of the application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      // ignore: deprecated_member_use
      builder: (ctx) => Options(),
      child :MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            primarySwatch: Colors.purple,
            accentColor: Colors.deepOrange,


          ),
          home: OptionsOverviewScreen(),
          routes: {
           // ProductDetailScreen.routeName: (ctx)=> ProductDetailScreen(),
            //Temperature.routeName:(ctx)=>Temperature(),
            //Humidity.routeName:(ctx)=>Humidity(),
            //Light.routeName:(ctx)=>Light(),
            //ThermostatScreen.routeName:(ctx)=>ThermostatScreen(),
            //Fan.routeName:(ctx)=>Fan(),
            //HomePage.routeName:(ctx)=>HomePage(),
            //ProductsOverviewScreen.routeName:(ctx)=>ProductsOverviewScreen(),
            //ProductsGrid.routeName:(ctx)=>ProductsGrid(),
          }),
    );
  }
}