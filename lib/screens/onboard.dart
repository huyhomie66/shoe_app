// ignore_for_file: prefer_const_literals_to_create_immutables, sort_child_properties_last, prefer_const_constructors

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:sneakerapp/theme/assets.dart';
import 'package:sneakerapp/theme/colors.dart';
import 'package:sneakerapp/theme/screen_size.dart';
import 'package:sneakerapp/widgets/button.dart';
import 'package:sneakerapp/widgets/dots_decorator.dart';
import 'package:sneakerapp/widgets/dots_indicator.dart';

class Onboard extends StatefulWidget {
  const Onboard({super.key, required this.title});

  final String title;

  @override
  State<Onboard> createState() => _OnboardState();
}

final List<String> shoesList = [
  PngAssets.shoe,
  PngAssets.nikeShoe,
  PngAssets.pumaShoe
];

class Title {
  String title = '';
  String subTitle = '';

  Title({
    required this.title,
    required this.subTitle,
  });
}

final List<Title> titleList = [
  Title(
    title: 'Start Journey With Nike',
    subTitle: 'Smart, Gorgeous & Fashionable Collection',
  ),
  Title(
    title: 'Follow Latest Style Shoes',
    subTitle: 'There Are Many Beautiful And Attractive Plants To Your Room',
  ),
  Title(
    title: 'Summer Shoes Nike 2023',
    subTitle: 'Amet Minim Lit Nodeseru Saku Nandu sit Alique Dolor',
  ),
];

class _OnboardState extends State<Onboard> with TickerProviderStateMixin {
  bool _visible = false;
  int currentShoe = 0;
  double position = 0;

  late final AnimationController _controller = AnimationController(
    duration: const Duration(seconds: 3),
    vsync: this,
  )..repeat(reverse: true);

  late final Animation<AlignmentGeometry> _animation = Tween<AlignmentGeometry>(
    begin: Alignment.topRight,
    end: Alignment.bottomCenter,
  ).animate(
    CurvedAnimation(
      parent: _controller,
      curve: Curves.decelerate,
    ),
  );

  late final Animation<double> _dotAnimation = CurvedAnimation(
    parent: _controller,
    curve: Curves.decelerate,
  );

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Widget renderShoeWidget(id) {
    return AlignTransition(
      alignment: _animation,
      child: Image.asset(
        shoesList[id],
        fit: BoxFit.fill,
        height: 196.h,
      ),
    );
  }

  Widget renderTextWidget(String title, String subTitle) {
    return Padding(
      padding: EdgeInsets.only(top: 40.h, bottom: 40.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(
              color: Color.fromRGBO(26, 36, 47, 1),
              fontSize: 40,
              height: 1.6,
              fontWeight: FontWeight.w500,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 8.h),
            child: Text(
              subTitle,
              style: TextStyle(
                height: 1.6,
                color: CustomColors.subTitle,
                fontSize: 20,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
        ],
      ),
    );
  }

  void onStartAnimation() {
    Timer(
        Duration(seconds: 1),
        () => setState(() {
              _visible = !_visible;
            }));
  }

  @override
  void initState() {
    super.initState();
    onStartAnimation();
  }

  void onNext() {
    setState(() {
      if (currentShoe <= 1) {
        currentShoe = currentShoe + 1;
        position = position + 1;
      } else {
        currentShoe = 0;
        position = 0;
      }
      setState(() {
        _visible = !_visible;
      });
      onStartAnimation();
    });
  }

  @override
  Widget build(BuildContext context) {
    var bottomWidget = Positioned(
      bottom: 36.h,
      left: 0,
      right: 0,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          DotsIndicator(
            dotsCount: 3,
            position: position,
            decorator: DotsDecorator(
              size: const Size.square(9.0),
              activeSize: const Size(18.0, 9.0),
              activeShape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5.0)),
            ),
          ),
          PrimaryButton(
            onPressed: onNext,
            title: 'Get Started',
          )
        ],
      ),
    );

    var textWidget = IndexedStack(
        index: currentShoe,
        children: titleList
            .map((e) => renderTextWidget(e.title, e.subTitle))
            .toList());

    var shoeWidget = SizedBox(
      child: Stack(
        children: [
          Positioned(
            child: AnimatedOpacity(
              opacity: _visible ? 1 : 0.0,
              duration: const Duration(seconds: 1),
              child: Image.asset(
                PngAssets.nike,
                fit: BoxFit.fitWidth,
                height: 240.h,
              ),
            ),
          ),
          Positioned(
            child: RotationTransition(
              turns: _dotAnimation,
              child: Image.asset(
                width: ScreenSize.width,
                height: 200.h,
                PngAssets.dotBg,
                fit: BoxFit.fitHeight,
              ),
            ),
          ),
          Positioned(
            height: 214.h,
            width: ScreenSize.width * 0.8,
            child: IndexedStack(
                index: currentShoe,
                children: [0, 1, 2].map((e) => renderShoeWidget(e)).toList()),
          ),
        ],
      ),
    );

    return Scaffold(
      body: Padding(
          padding: EdgeInsets.only(left: 20.w, right: 20.w),
          child: Stack(
            children: <Widget>[
              Column(
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Image.asset(
                        PngAssets.onboardHeaderBg,
                        fit: BoxFit.fitWidth,
                        height: 180.h,
                      ),
                    ],
                  ),
                  shoeWidget,
                  textWidget
                ],
              ),
              bottomWidget
            ],
          )),
    );
  }
}
