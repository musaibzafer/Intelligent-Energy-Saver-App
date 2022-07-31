import 'package:flutter/material.dart';
import '../providers/products.dart';
import 'package:provider/provider.dart';

class ProductDetailScreen extends StatelessWidget {
  static const routeName = '/product-detail';

  @override
  Widget build(BuildContext context) {
    final productId = ModalRoute.of(context).settings.arguments as String;
    final loadedProduct = Provider.of<Products>(context,listen:false,)
        .items
        .firstWhere((prod) => prod.id == productId);
    return Scaffold(
      appBar: AppBar(
        title: Text(loadedProduct.title,
            style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold)),
        backgroundColor: Colors.amberAccent,
      ),
    );
  }
}
