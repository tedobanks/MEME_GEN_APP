import 'package:flutter/material.dart';
import 'package:meme_gen_app/services/app_provider.dart';
import 'package:meme_gen_app/static/dimension.dart';
import 'package:provider/provider.dart';

class InfoCollection extends StatefulWidget {
  InfoCollection({Key? key}) : super(key: key);

  @override
  State<InfoCollection> createState() => _InfoCollectionState();
}

class _InfoCollectionState extends State<InfoCollection> {
  final controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Consumer<AppProvider>(
      builder: (context, value, child) => Scaffold(
        body: SingleChildScrollView(
          child: Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: Dimensions.size60,
                ),
                Image.asset('assets/images/onboard.png'),
                SizedBox(
                  height: Dimensions.size30,
                ),
                Container(
                  margin: EdgeInsets.only(left: Dimensions.size15),
                  child: Text(
                    'Sign Up',
                    style: TextStyle(
                        fontFamily: 'Nunito',
                        fontWeight: FontWeight.bold,
                        fontSize: Dimensions.size30),
                  ),
                ),
                SizedBox(height: Dimensions.size30),
                Container(
                  margin: EdgeInsets.only(left: Dimensions.size15),
                  child: SizedBox(
                    width: Dimensions.size360,
                    child: TextField(
                      keyboardType: TextInputType.name,
                      style: TextStyle(
                          fontFamily: 'Nunito', fontSize: Dimensions.size15),
                      controller: controller,
                      decoration: InputDecoration(
                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Color(0xFF44A4CF)),
                              borderRadius:
                                  BorderRadius.circular(Dimensions.size15)),
                          hintText: 'What\'s your name?',
                          hintStyle: TextStyle(
                            fontFamily: 'Nunito',
                            fontSize: Dimensions.size15,
                          ),
                          border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.circular(Dimensions.size15))),
                    ),
                  ),
                ),
                SizedBox(
                  height: Dimensions.size30,
                ),
                Container(
                  margin: EdgeInsets.only(left: Dimensions.size15),
                  child: SizedBox(
                    width: Dimensions.size120,
                    child: OutlinedButton(
                        style: OutlinedButton.styleFrom(
                            padding: EdgeInsets.all(Dimensions.size10),
                            shape: RoundedRectangleBorder(
                                side: BorderSide(width: 3),
                                borderRadius:
                                    BorderRadius.circular(Dimensions.size10))),
                        onPressed: () =>
                            value.navigateToHomepage(controller.text, context),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Go',
                              style: TextStyle(
                                  fontSize: Dimensions.size20,
                                  fontFamily: 'Nunito',
                                  fontWeight: FontWeight.bold),
                            ),
                            Text('🚀')
                          ],
                        )),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
