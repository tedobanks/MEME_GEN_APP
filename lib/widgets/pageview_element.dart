import 'package:flutter/material.dart';
import 'package:meme_gen_app/static/dimension.dart';

class buildPage extends StatelessWidget {
  buildPage(
      {required this.bgColor,
      required this.textColor,
      required this.bgImage,
      required this.text});

  Color bgColor;
  Color textColor;
  String bgImage;
  String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(Dimensions.size10),
      height: Dimensions.size650,
      decoration: BoxDecoration(
          color: bgColor, borderRadius: BorderRadius.circular(20)),
      child: Column(
        children: [
          SizedBox(
            height: Dimensions.size30,
          ),
          Divider(),
          Container(
            height: Dimensions.size360,
            child: Image.asset(
              bgImage,
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(
            height: Dimensions.size30,
          ),
          Container(
            width: Dimensions.size360,
            padding: EdgeInsets.all(Dimensions.size20),
            child: Center(
              child: Text(
                text,
                style: TextStyle(
                  fontFamily: 'Nunito',
                  fontWeight: FontWeight.bold,
                  fontSize: Dimensions.size25,
                  color: textColor,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          )
        ],
      ),
    );
  }
}
