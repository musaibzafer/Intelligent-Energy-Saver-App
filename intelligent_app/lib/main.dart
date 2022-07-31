import 'package:flutter/material.dart';
import 'package:intelligentapp/Widgets/products_grid.dart';
import './Screens/chart.dart';
import './Screens/thermostat_screen.dart';
import './Screens/light.dart';
import './Screens/fan.dart';
import './Screens/Temperature.dart';
import 'package:provider/provider.dart';
import './Screens/products_overview_screen.dart';
import './Screens/product_details_screen.dart';
import './providers/products.dart';
import 'Screens/Humidity.dart';



void main() {

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of the application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      // ignore: deprecated_member_use
      builder: (ctx) => Products(),
      child :MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            primarySwatch: Colors.purple,
            accentColor: Colors.deepOrange,


          ),
          home: ProductsOverviewScreen(),
          routes: {
            ProductDetailScreen.routeName: (ctx)=> ProductDetailScreen(),
            Temperature.routeName:(ctx)=>Temperature(),
            Humidity.routeName:(ctx)=>Humidity(),
            Light.routeName:(ctx)=>Light(),
            ThermostatScreen.routeName:(ctx)=>ThermostatScreen(),
            Fan.routeName:(ctx)=>Fan(),
            HomePage.routeName:(ctx)=>HomePage(),
            ProductsOverviewScreen.routeName:(ctx)=>ProductsOverviewScreen(),
            ProductsGrid.routeName:(ctx)=>ProductsGrid(),
          }),
    );
  }
}

