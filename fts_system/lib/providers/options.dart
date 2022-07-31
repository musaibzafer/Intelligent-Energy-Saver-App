import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import '../models/option.dart';

class Options with ChangeNotifier{
  List<Option>_items=[
    Option(
        id: 'p1',
        title : 'A/C',
        subtitle : '24 C',
        leftIcon : MdiIcons.arrowDownBold,
        topRightIcon : Icons.supervised_user_circle,
        bottomRightIcon: Icons.threesixty,
        isEnable : true),
    Option(
        id: 'p2',
        title : 'Fan',
        subtitle : 'Turned off',
        leftIcon : MdiIcons.fan,
        topRightIcon : Icons.threesixty,
        bottomRightIcon: Icons.threesixty,
        isEnable : false),
  /*  Option(
        id: 'p3',
        title : 'Temperature',
        subtitle : 'Sweet Home',
        leftIcon : MdiIcons.temperatureCelsius,
        topRightIcon : Icons.router,
        bottomRightIcon: Icons.threesixty,
        isEnable : true),
    Option(
        id: 'p4',
        title : 'Light',
        subtitle : '70 % brightness',
        leftIcon : MdiIcons.lightbulbOnOutline,
        topRightIcon : Icons.threesixty,
        bottomRightIcon: Icons.threesixty,
        isEnable : true),*/
  ];
  List<Option> get items{
    return[..._items];
  }

  void addProduct(){
    //_items.add(value);
    notifyListeners();

  }
}