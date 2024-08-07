import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:meme_gen_app/screens/redirect.dart';
import 'package:meme_gen_app/services/app_provider.dart';
import 'package:meme_gen_app/static/theme_colors.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(ChangeNotifierProvider(
      create: (context) => AppProvider()..initialize(), child: const MyApp(),),);
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      themeMode: ThemeMode.light,
      theme: ThemeColors.lightTheme,
      debugShowCheckedModeBanner: false,
      home: Redirect(),
    );
  }
}
