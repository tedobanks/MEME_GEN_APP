import 'package:flutter/material.dart';
import 'package:meme_gen_app/static/dimension.dart';

class ActionButton extends StatelessWidget {
  ActionButton({Key? key, required this.iconData, required this.onTap})
      : super(key: key);

  IconData iconData;
  VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
          width: Dimensions.size50,
          height: Dimensions.size50,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(
              Dimensions.size10,
            ),
            color: Theme.of(context).primaryColor,
          ),
          child: Center(
            child: Icon(
              iconData,
              color: Colors.white,
            ),
          )),
    );
  }
}
