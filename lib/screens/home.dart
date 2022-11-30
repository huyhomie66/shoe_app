// ignore_for_file: prefer_const_literals_to_create_immutables, sort_child_properties_last, prefer_const_constructors

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:sneakerapp/theme/assets.dart';
import 'package:sneakerapp/theme/colors.dart';
import 'package:sneakerapp/theme/screen_size.dart';
import 'package:sneakerapp/widgets/button.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key, required this.title});

  final String title;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  bool _visible = false;
  int currentShoe = 0;

  final List<String> shoesList = [
    PngAssets.shoe,
    PngAssets.nikeShoe,
    PngAssets.pumaShoe
  ];

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
      } else {
        currentShoe = 0;
      }
      setState(() {
        _visible = !_visible;
      });
      onStartAnimation();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
      padding: EdgeInsets.only(left: 20, right: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Image.asset(
                PngAssets.onboardHeaderBg,
                fit: BoxFit.fitWidth,
                height: 120.h,
              ),
            ],
          ),
          SizedBox(
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
                  height: 224.h,
                  width: ScreenSize.width * 0.85,
                  child: IndexedStack(
                    index: currentShoe,
                    children: [
                      renderShoeWidget(0),
                      renderShoeWidget(1),
                      renderShoeWidget(2),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 40.h, bottom: 40.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Start Journey With Nike',
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
                    'Smart, Gorgeous & Fashionable Collection',
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
          ),
          Row(
            children: [
              PrimaryButton(
                onPressed: onNext,
                title: 'Get Started',
              )
            ],
          )
        ],
      ),
    ));
  }
}
