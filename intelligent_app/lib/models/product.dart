
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';

class Product {
  final String id;
  final String title;
  final String subtitle;
  final IconData leftIcon;
  final IconData topRightIcon;
  final IconData bottomRightIcon;
  bool isEnable;

  Product({
    @required this.id,
    @required this.title,
    @required this.subtitle,
    @required this.leftIcon,
    @required this.topRightIcon,
    @required this.bottomRightIcon,
    @required this.isEnable,
  });
}
