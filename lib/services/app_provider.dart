import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:flutter/material.dart';
import 'package:meme_gen_app/screens/homepage.dart';
import 'package:meme_gen_app/screens/info_collection.dart';
import 'package:meme_gen_app/services/remote_service.dart';
import 'package:meme_gen_app/static/models.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppProvider extends ChangeNotifier {
  bool isLastPage = false;
  bool isLoaded = false;
  String userName = '';

  List<Meme>? memes;

  void assignLastPage(int index) {
    isLastPage = index == 2;
    notifyListeners();
  }

  void navigateToSignUpPage(BuildContext context) {
    Navigator.of(context).push(MaterialPageRoute(
      builder: (context) => InfoCollection(),
    ));
  }

  void navigateToHomepage(String name, BuildContext context) {
    userName = name;
    var snackBar = SnackBar(
        elevation: 0,
        behavior: SnackBarBehavior.floating,
        backgroundColor: Colors.transparent,
        content: AwesomeSnackbarContent(
            title: 'Oops!',
            message: 'Please fill in your name before continuing',
            contentType: ContentType.failure));

    userName.isEmpty
        ? ScaffoldMessenger.of(context).showSnackBar(snackBar)
        : Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(
              builder: (context) => HomePage(),
            ),
            (Route<dynamic> route) => false);
    print(userName.length);
    print(userName.isEmpty);
    print(userName);
    saveNameData();
    notifyListeners();
  }

  void getData() async {
    memes = await RemoteService().getMemes();

    if (memes != null) {
      isLoaded = true;
    }

    notifyListeners();
  }

  void saveNameData() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('name', userName);
  }

  void loadNameData() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    String? stringValue = prefs.getString('name');

    if (stringValue != null) {
      userName = stringValue;
    }
    print(userName);
    notifyListeners();
  }

  void initialize() async {
    getData();
    loadNameData();
  }
}
