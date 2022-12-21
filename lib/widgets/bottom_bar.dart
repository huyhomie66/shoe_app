import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:sneakerapp/data/home_data.dart';
import 'package:sneakerapp/theme/colors.dart';

class CustomBottomBar extends StatefulWidget {
  const CustomBottomBar({
    super.key,
  });

  @override
  State<CustomBottomBar> createState() => _CustomBottomBarState();
}

class _CustomBottomBarState extends State<CustomBottomBar> with TickerProviderStateMixin {
  int _bottomNavIndex = 0;
  void onTap(int index) {
    setState(() => _bottomNavIndex = index);
  }

  @override
  Widget build(BuildContext context) {

    final bottomNavigationBar = AnimatedBottomNavigationBar(
      backgroundColor: CustomColors.bannerBg,
      icons: iconList,
      inactiveColor: CustomColors.bgColor,
      activeColor: CustomColors.primary,
      iconSize: 32,
      activeIndex: _bottomNavIndex,
      splashRadius: 20,
      borderWidth: 3,
      gapLocation: GapLocation.center,
      notchSmoothness: NotchSmoothness.softEdge,
      leftCornerRadius: 32,
      rightCornerRadius: 32,
      onTap: onTap,
    );

    return bottomNavigationBar;
  }
}
