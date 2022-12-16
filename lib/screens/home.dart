import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:sneakerapp/data/home_data.dart';
import 'package:sneakerapp/theme/colors.dart';
import 'package:sneakerapp/theme/screen_size.dart';
import 'package:sneakerapp/widgets/carousel.dart';

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
        centerTitle: false,
        shadowColor: Colors.transparent,
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.only(bottom: 10, right: 10),
            child: Ink(
              decoration: const ShapeDecoration(
                color: CustomColors.primaryTint,
                shape: CircleBorder(),
              ),
              child: IconButton(
                color: CustomColors.primary,
                icon: const Icon(
                  Iconsax.shopping_cart,
                ),
                onPressed: () {},
              ),
            ),
          )
        ],
        backgroundColor: CustomColors.bgColor,
        title: const Text(
          'Welcome to you',
          style: TextStyle(color: Colors.black, fontSize: 20),
        ),
      ),

      body: Container(
        child: Column(children: [CarouselWidget()]),
      ), //destination screen
      floatingActionButton: floatButton,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      backgroundColor: CustomColors.bgColor,
      bottomNavigationBar: AnimatedBottomNavigationBar(
        icons: iconList,
        inactiveColor: Colors.blueGrey,
        activeColor: Colors.blue,
        iconSize: 32,
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
