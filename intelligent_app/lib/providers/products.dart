import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import '../models/product.dart';

class Products with ChangeNotifier{
  List<Product>_items=[
    Product(
        id: 'p1',
        title : 'A/C',
        subtitle : '24 C',
        leftIcon : MdiIcons.snowflake,
        topRightIcon : Icons.threesixty,
        bottomRightIcon: Icons.threesixty,
        isEnable : true),
    Product(
        id: 'p2',
        title : 'Fan',
        subtitle : 'Turned off',
        leftIcon : MdiIcons.fan,
        topRightIcon : Icons.threesixty,
        bottomRightIcon: Icons.threesixty,
        isEnable : false),
    Product(
        id: 'p3',
        title : 'Temperature',
        subtitle : 'Sweet Home',
        leftIcon : MdiIcons.temperatureCelsius,
        topRightIcon : Icons.router,
        bottomRightIcon: Icons.threesixty,
        isEnable : true),
    Product(
        id: 'p4',
        title : 'Light',
        subtitle : '70 % brightness',
        leftIcon : MdiIcons.lightbulbOnOutline,
        topRightIcon : Icons.threesixty,
        bottomRightIcon: Icons.threesixty,
        isEnable : true),
  ];
  List<Product> get items{
    return[..._items];
  }

  void addProduct(){
    //_items.add(value);
    notifyListeners();

  }
}