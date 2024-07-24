import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:meme_gen_app/screens/favorites.dart';
import 'package:meme_gen_app/services/app_provider.dart';
import 'package:meme_gen_app/static/categories_list.dart';
import 'package:meme_gen_app/static/dimension.dart';
import 'package:meme_gen_app/widgets/action_buttons.dart';
import 'package:meme_gen_app/widgets/drawer_listtile.dart';
import 'package:meme_gen_app/widgets/pill.dart';
import 'package:provider/provider.dart';
import 'package:skeletons/skeletons.dart';

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
        backgroundColor: Colors.white,
        appBar: AppBar(
            iconTheme: const IconThemeData(color: Colors.black),
            backgroundColor: Colors.white,
            elevation: 0,
            title: Container(
              child: Row(
                children: [
                  Text(
                    'Hello,',
                    style: TextStyle(
                        fontFamily: 'Nunito',
                        fontSize: Dimensions.size25,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                  ),
                  SizedBox(
                    width: Dimensions.size5,
                  ),
                  Text(
                    value.userName,
                    style: TextStyle(
                        fontFamily: 'Nunito',
                        fontSize: Dimensions.size25,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                  ),
                ],
              ),
            )),
        endDrawer: Padding(
          padding: EdgeInsets.only(
              top: Dimensions.size40,
              bottom: Dimensions.size30,
              right: Dimensions.size10),
          child: Drawer(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(Dimensions.size15)),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  ListTile(
                    trailing: GestureDetector(
                      child: const Icon(FontAwesomeIcons.xmark),
                      onTap: () => Navigator.pop(context),
                      onDoubleTap: () => Navigator.pop(context),
                      onLongPress: () => Navigator.pop(context),
                    ),
                  ),
                  SizedBox(
                    height: Dimensions.size15,
                  ),
                  DrawerListTile(
                    text: 'Favorites',
                    iconData: FontAwesomeIcons.heart,
                    onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (_) => const FavoritesScreen())),
                  )
                ],
              ),
            ),
          ),
        ),
        body: Padding(
          padding: EdgeInsets.all(Dimensions.size15),
          child: SingleChildScrollView(
              child: Column(
            children: [
              SizedBox(height: Dimensions.size20),
              Container(
                margin: EdgeInsets.all(Dimensions.size10),
                padding: EdgeInsets.symmetric(
                    vertical: Dimensions.size10, horizontal: Dimensions.size5),
                height: Dimensions.size160,
                width: double.infinity,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(Dimensions.size10),
                    border: Border.all(
                        color: Theme.of(context).primaryColor,
                        width: Dimensions.size5)),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: Dimensions.size5),
                      child: Text(
                        'Categories',
                        style: TextStyle(
                            fontFamily: 'Nunito',
                            fontSize: Dimensions.size20,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    SizedBox(height: Dimensions.size20),
                    SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: Categories.categoriesList
                              .map((e) => Padding(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: Dimensions.size5),
                                    child: GestureDetector(
                                      onTap: () => value.changeApiUrl(e),
                                      child: Pill(textValue: e),
                                    ),
                                  ))
                              .toList(),
                        )),
                  ],
                ),
              ),
              SizedBox(
                height: Dimensions.size25,
              ),
              value.memes == null
                  ? Padding(
                      padding: EdgeInsets.all(Dimensions.size20),
                      child: SkeletonItem(
                          child: SkeletonAvatar(
                        style: SkeletonAvatarStyle(
                            borderRadius:
                                BorderRadius.circular(Dimensions.size10),
                            width: double.infinity,
                            height: Dimensions.size360),
                      )),
                    )
                  : Padding(
                      padding: EdgeInsets.all(Dimensions.size10),
                      child: Container(
                        width: double.infinity,
                        height: Dimensions.size360,
                        decoration: BoxDecoration(
                            border: Border.all(
                                color: Colors.black, width: Dimensions.size5)),
                        child: Center(
                          child: Image.network(
                            value.memes!.url,
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                    ),
              SizedBox(
                height: Dimensions.size10,
              ),
              Padding(
                padding: EdgeInsets.all(Dimensions.size10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    ActionButton(
                        iconData: FontAwesomeIcons.heart, onTap: () => {}),
                    ActionButton(
                        iconData: FontAwesomeIcons.download, onTap: () => {}),
                    ActionButton(
                        iconData: FontAwesomeIcons.arrowRotateRight,
                        onTap: () => value.renew())
                  ],
                ),
              )
            ],
          )),
        ),
      ),
    );
  }
}
