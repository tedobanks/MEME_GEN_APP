import 'package:flutter/material.dart';
import 'package:meme_gen_app/static/dimension.dart';

class Pill extends StatelessWidget {
  String textValue;

  Pill({Key? key, required this.textValue}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(Dimensions.size10),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(Dimensions.size5),
          border: Border.all(
              color: Theme.of(context).primaryColorDark,
              width: Dimensions.size5)),
      child: Text(
        textValue,
        style: TextStyle(
            fontFamily: 'Nunito',
            fontSize: Dimensions.size10,
            fontWeight: FontWeight.bold,
            color: Colors.black87),
      ),
    );
  }
}
