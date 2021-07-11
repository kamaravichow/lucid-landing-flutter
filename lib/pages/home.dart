import 'package:flutter/material.dart';
import 'package:safedot/components/buttons.dart';
import 'package:safedot/components/tabbar.dart';
import 'package:safedot/responsive.dart';
import 'package:url_launcher/url_launcher.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
  double _windowWidth = 0;
  double _windowHeight = 0;

  var _tabController;

  @override
  void initState() {
    _tabController = TabController(length: 4, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    _windowHeight = MediaQuery.of(context).size.height;
    _windowWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.white,
      body: ListView(
        shrinkWrap: true,
        children: [
          Header(windowWidth: _windowWidth, tabController: _tabController),
          CustomHero(windowWidth: _windowWidth),
        ],
      ),
    );
  }
}

class Features extends StatelessWidget {
  const Features({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(20),
            child: Text(
              "Features",
              style: Theme.of(context).textTheme.headline4,
            ),
          ),
          Wrap(
            alignment: WrapAlignment.center,
            direction: Axis.horizontal,
            crossAxisAlignment: WrapCrossAlignment.center,
            children: [
              FeatureItem(),
              FeatureItem(),
              FeatureItem(),
              FeatureItem(),
            ],
          ),
        ],
      ),
    );
  }
}

class FeatureItem extends StatelessWidget {
  const FeatureItem({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      width: 300,
      padding: EdgeInsets.all(10),
      child: Column(
        children: [
          Image.asset(
            "assets/images/safe-dot.png",
            height: 100,
            width: 100,
          ),
          Text(
            "The third-party apps on your phone might be secretly spying on you. SafeDot is designed to protect you from them.",
            style: Theme.of(context).textTheme.subtitle1,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}

class CustomHero extends StatelessWidget {
  const CustomHero({
    Key? key,
    required double windowWidth,
  })  : _windowWidth = windowWidth,
        super(key: key);

  final double _windowWidth;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: _windowWidth,
      height: 500,
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(3),
      ),
      child: Flex(
        direction: Axis.horizontal,
        children: [
          Expanded(
            flex: 1,
            child: Container(
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.grey.shade100,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "PRIVACY INDICATORS",
                    style: Theme.of(context).textTheme.overline,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 20),
                    child: Text(
                      "Your Privacy is Protected By Us",
                      style: Theme.of(context).textTheme.headline2,
                    ),
                  ),
                  Text(
                    "The third-party apps on your phone might be secretly spying on you. SafeDot is designed to protect you from them.",
                    style: Theme.of(context).textTheme.subtitle1,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      GestureDetector(
                        onTap: () {
                          launch(
                              "https://play.google.com/store/apps/details?id=com.aravi.dot");
                        },
                        child: Image.asset(
                          "assets/images/google-play-badge.png",
                          height: 120,
                          width: 160,
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          launch("https://www.fdroid.com");
                        },
                        child: Image.asset(
                          "assets/images/fdroid.png",
                          height: 120,
                          width: 170,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Visibility(
            visible: !Responsive.isMobile(context),
            child: Expanded(
              flex: 1,
              child: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: FractionalOffset(0, -1),
                    end: FractionalOffset(2, 0),
                    colors: [
                      Colors.purpleAccent,
                      Colors.purpleAccent.shade200,
                      Colors.deepPurple,
                      Colors.deepPurple.shade500,
                      Colors.redAccent.shade400,
                      Colors.redAccent.shade400,
                    ],
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

class Header extends StatelessWidget {
  const Header({
    Key? key,
    required double windowWidth,
    required tabController,
  })  : _windowWidth = windowWidth,
        _tabController = tabController,
        super(key: key);

  final double _windowWidth;
  final TabController _tabController;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: _windowWidth,
      height: 58,
      padding: EdgeInsets.symmetric(horizontal: 20),
      decoration: BoxDecoration(color: Colors.white),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Image.asset(
            "assets/images/transparent-safedot.png",
            height: 28,
            width: 28,
          ),
          Text(
            "  SAFEDOT  ",
            style: Theme.of(context).textTheme.headline1,
          ),
          Spacer(),
          CustomTabBar(
              windowWidth: _windowWidth, tabController: _tabController),
          Spacer(),
          Visibility(
            visible: !Responsive.isMobile(context),
            child: FilledButton(
              text: "Source Code",
              backgroundColor: Colors.white,
              textColor: Colors.black,
              onClicked: () {
                launch("https://github.com/kamaravichow/safe-dot-android");
              },
            ),
          ),
          FilledButton(
            text: "Direct Download",
            backgroundColor: Colors.blue.shade800,
            onClicked: () {
              launch("https://github.com/kamaravichow/safe-dot-android/releases");
            },
          ),
        ],
      ),
    );
  }
}
