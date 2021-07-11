import 'package:flutter/material.dart';
import 'package:safedot/responsive.dart';

class CustomTabBar extends StatelessWidget {
  const CustomTabBar({
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
    if (Responsive.isMobile(context)) {
      return Spacer();
    } else {
      return SizedBox(
        width: _windowWidth / 3,
        child: Center(
          child: TabBar(
            isScrollable: true,
            controller: _tabController,
            labelColor: Colors.black,
            labelStyle: Theme.of(context).textTheme.button,
            indicatorColor: Colors.transparent,
            tabs: [
              Tab(
                text: "Home",
              ),
              Tab(
                text: "Features",
              ),
              Tab(
                text: "About",
              ),
              Tab(
                text: "Contact",
              ),
            ],
          ),
        ),
      );
    }
  }
}
