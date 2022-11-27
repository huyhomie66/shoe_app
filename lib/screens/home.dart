// ignore_for_file: prefer_const_literals_to_create_immutables, sort_child_properties_last, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sneakerapp/theme/assets.dart';
import 'package:sneakerapp/theme/screen_size.dart';
import 'package:sneakerapp/widgets/button.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key, required this.title});

  final String title;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  void onNext() {}
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Column(
        children: <Widget>[
          Column(
            children: <Widget>[
              // SvgPicture.asset(SvgAssets.onboard),
              Image.asset(
                PngAssets.onboard,
                fit: BoxFit.fill,
                width: ScreenSize.width,
              ),
              Text(
                'Start Journey With Nike',
                style: TextStyle(
                  color: Color.fromRGBO(26, 36, 47, 1),
                  // fontSize: 40,
                  fontWeight: FontWeight.normal,
                ),
              ),
              const Text(
                'Smart, Gorgeous & Fashionable Collection',
                style: TextStyle(
                  color: Color.fromRGBO(112, 123, 129, 1),
                  // fontSize: 20,
                  fontWeight: FontWeight.normal,
                ),
              )
            ],
          ),
          Row(
            children: [
              const SizedBox(
                  height: 54,
                  width: 165,
                  child: PrimaryButton(
                    title: 'Get Started',
                  ))
            ],
          )
        ],
      ),
    ));
  }
}
