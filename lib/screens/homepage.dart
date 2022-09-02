import 'package:flutter/material.dart';
import 'package:meme_gen_app/services/app_provider.dart';
import 'package:meme_gen_app/static/dimension.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Consumer<AppProvider>(
      builder: (context, value, child) => Scaffold(
        body: Padding(
          padding: EdgeInsets.all(Dimensions.size15),
          child: SingleChildScrollView(
              child: Column(
            children: [
              Container(
                margin: EdgeInsets.only(top: Dimensions.size15),
                child: Row(
                  children: [
                    Text(
                      'Hello,',
                      style: TextStyle(
                          fontFamily: 'Nunito',
                          fontSize: Dimensions.size25,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      width: Dimensions.size5,
                    ),
                    Text(
                      value.userName,
                      style: TextStyle(
                          fontFamily: 'Nunito',
                          fontSize: Dimensions.size25,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
              SizedBox(height: Dimensions.size10),
              value.memes == null
                  ? CircularProgressIndicator()
                  : Text('Successful'),
            ],
          )),
        ),
      ),
    );
  }
}
