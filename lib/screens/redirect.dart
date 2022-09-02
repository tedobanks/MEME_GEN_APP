import 'package:flutter/material.dart';
import 'package:meme_gen_app/screens/homepage.dart';
import 'package:meme_gen_app/screens/onboarding.dart';
import 'package:meme_gen_app/services/app_provider.dart';
import 'package:provider/provider.dart';

class Redirect extends StatefulWidget {
  Redirect({Key? key}) : super(key: key);

  @override
  State<Redirect> createState() => _RedirectState();
}

class _RedirectState extends State<Redirect> {
  @override
  Widget build(BuildContext context) {
    return Consumer<AppProvider>(
      builder: (context, value, child) =>
          value.userName.isEmpty ? OnboardingScreen() : HomePage(),
    );
  }
}
