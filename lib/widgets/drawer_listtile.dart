import 'package:flutter/material.dart';

import '../static/dimension.dart';

class DrawerListTile extends StatelessWidget {
  DrawerListTile(
      {Key? key,
      required this.text,
      required this.iconData,
      required this.onTap})
      : super(key: key);

  String text;
  IconData iconData;
  VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: onTap,
        child: ListTile(
          title: Text(
            text,
            style: TextStyle(
                fontFamily: "Nunito",
                fontWeight: FontWeight.bold,
                fontSize: Dimensions.size25),
          ),
          trailing: Icon(iconData),
        ));
  }
}
