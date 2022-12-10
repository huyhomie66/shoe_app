import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:sneakerapp/theme/colors.dart';
import 'package:sneakerapp/theme/screen_size.dart';

class Home extends StatefulWidget {
  const Home({
    super.key,
  });

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> with TickerProviderStateMixin {
  int _bottomNavIndex = 0;
  void onTap(int index) {
    setState(() => _bottomNavIndex = index);
  }

  final iconList = <IconData>[
    Iconsax.home,
    Iconsax.heart,
    Iconsax.notification,
    Iconsax.setting,
  ];

  @override
  Widget build(BuildContext context) {
    var floatButton = FloatingActionButton(
      splashColor: CustomColors.primary,
      focusColor: CustomColors.primary,
      onPressed: () {},
      backgroundColor: CustomColors.primary,
      child: const Icon(Iconsax.shop4),
    );

    return Scaffold(
      appBar: AppBar(
        shadowColor: Colors.transparent,
        leading: Padding(
          padding: const EdgeInsets.only(bottom: 10, left: 16),
          child: Ink(
            decoration: const ShapeDecoration(
              color: Colors.white,
              shape: CircleBorder(),
            ),
            child: IconButton(
              color: Colors.black,
              icon: const Icon(Iconsax.menu),
              onPressed: () {},
            ),
          ),
        ),
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.only(bottom: 10, right: 16),
            child: Ink(
              decoration: const ShapeDecoration(
                color: Colors.white,
                shape: CircleBorder(),
              ),
              child: IconButton(
                color: Colors.black,
                icon: const Icon(Iconsax.shopping_bag),
                onPressed: () {},
              ),
            ),
          )
        ],
        backgroundColor: CustomColors.bgColor,
        title: const Text(
          'shop',
          style: TextStyle(color: Colors.black),
        ),
      ),

      body: Container(), //destination screen
      floatingActionButton: floatButton,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      backgroundColor: CustomColors.bgColor,
      bottomNavigationBar: AnimatedBottomNavigationBar(
        icons: iconList,
        inactiveColor: Colors.blueGrey,
        activeColor: Colors.blue,
        iconSize: 28,
        activeIndex: _bottomNavIndex,
        splashRadius: 20,
        borderWidth: 3,
        gapLocation: GapLocation.center,
        notchSmoothness: NotchSmoothness.softEdge,
        leftCornerRadius: 32,
        rightCornerRadius: 32,
        onTap: onTap,
      ),
    );
  }
}
