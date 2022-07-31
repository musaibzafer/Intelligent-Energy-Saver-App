import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/options.dart';
import './option_items.dart';

class OptionsGrid extends StatelessWidget {
  static const routeName = '/Screens';
  @override
  Widget build(BuildContext context) {
    final optionsData = Provider.of<Options>(context);
    final options = optionsData.items;
    return Container(

        child:GridView.builder(
          padding: const EdgeInsets.all(10.0),
          itemCount: options.length,
          itemBuilder: (ctx, i) => OptionItem(
            options[i].id,
            options[i].title,
            options[i].subtitle,
            options[i].leftIcon,
           options[i].topRightIcon,
           options[i].bottomRightIcon,
           options[i].isEnable,
          ),

          gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(

            maxCrossAxisExtent: 400,
            childAspectRatio: 6/2 ,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,

          ),





    ))
    ;
  }
}
