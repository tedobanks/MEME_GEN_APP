import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:meme_gen_app/services/app_provider.dart';
import 'package:meme_gen_app/static/dimension.dart';
import 'package:meme_gen_app/widgets/pageview_element.dart';
import 'package:provider/provider.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnboardingScreen extends StatefulWidget {
  OnboardingScreen({Key? key}) : super(key: key);

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final controller = PageController();

  @override
  Widget build(BuildContext context) {
    return Consumer<AppProvider>(
      builder: (context, value, child) => Scaffold(
        body: Column(
          children: [
            Stack(
              children: [
                Container(
                    margin: EdgeInsets.only(
                        top: Dimensions.size30,
                        left: Dimensions.size10,
                        right: Dimensions.size10),
                    height: Dimensions.size650,
                    child: PageView(
                      onPageChanged: (index) => value.assignLastPage(index),
                      controller: controller,
                      children: [
                        buildPage(
                            bgColor: Color(0xFFFFBF69),
                            textColor: Colors.white,
                            bgImage: 'assets/images/Background1.png',
                            text:
                                'Flex on your friends with the best memes in the world!😉'),
                        buildPage(
                          bgColor: Color(0xFF6FDA9C),
                          textColor: Colors.white,
                          bgImage: 'assets/images/Background2.png',
                          text: 'An endless amount of memes to pick from!😁',
                        ),
                        buildPage(
                          bgColor: Color(0xFF44A4CF),
                          textColor: Colors.white,
                          bgImage: 'assets/images/Background3.png',
                          text: 'Jump in and start exploring🎉',
                        )
                      ],
                    )),
              ],
            ),
            SizedBox(
              height: Dimensions.size20,
            ),
            Container(
              margin: EdgeInsets.only(
                  left: Dimensions.size15, right: Dimensions.size15),
              child: Column(
                children: [
                  SmoothPageIndicator(
                    controller: controller,
                    count: 3,
                    effect: WormEffect(radius: Dimensions.size10),
                    onDotClicked: (index) => controller.animateToPage(index,
                        duration: Duration(milliseconds: 500),
                        curve: Curves.easeIn),
                  ),
                  SizedBox(
                    height: Dimensions.size20,
                  ),
                  value.isLastPage
                      ? SizedBox(
                          width: Dimensions.size360,
                          child: ElevatedButton(
                            onPressed: () =>
                                value.navigateToSignUpPage(context),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Text(
                                  'Get Started',
                                  style: TextStyle(
                                      fontFamily: 'Nunito',
                                      fontSize: Dimensions.size20),
                                ),
                                SizedBox(width: Dimensions.size10),
                                Icon(FontAwesomeIcons.arrowRight),
                                SizedBox(
                                  width: Dimensions.size20,
                                )
                              ],
                            ),
                            style: ElevatedButton.styleFrom(
                                padding: EdgeInsets.symmetric(
                                  vertical: Dimensions.size25,
                                ),
                                primary: Colors.black,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(
                                        Dimensions.size40))),
                          ),
                        )
                      : Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            TextButton(
                                onPressed: () => controller.jumpToPage(2),
                                child: Text(
                                  'Skip',
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontFamily: 'Nunito',
                                      fontSize: Dimensions.size15),
                                )),
                            ElevatedButton(
                              onPressed: () => controller.nextPage(
                                  duration: Duration(milliseconds: 500),
                                  curve: Curves.easeInOut),
                              child: Icon(FontAwesomeIcons.arrowRight),
                              style: ElevatedButton.styleFrom(
                                  primary: Colors.black,
                                  shape: CircleBorder(),
                                  padding: EdgeInsets.all(Dimensions.size20)),
                            )
                          ],
                        )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
