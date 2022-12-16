import 'package:carousel_slider/carousel_slider.dart';
import 'package:drop_shadow/drop_shadow.dart';
import 'package:flutter/material.dart';
import 'package:sneakerapp/data/home_data.dart';
import 'package:sneakerapp/theme/assets.dart';
import 'package:sneakerapp/theme/colors.dart';
import 'package:sneakerapp/theme/screen_size.dart';

class CarouselWidget extends StatelessWidget {
  const CarouselWidget({
    super.key,
  });

  Widget renderBanner() {
    final ButtonStyle buttonStyle = ElevatedButton.styleFrom(
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
        elevation: 0.0,
        shadowColor: CustomColors.primary,
        backgroundColor: CustomColors.primaryTint);

    return Stack(children: [
      Positioned(
          child: DropShadow(
        offset: const Offset(6, 8),
        blurRadius: 6,
        opacity: 0.9,
        borderRadius: 20,
        spread: 0.9,
        child: Container(
          padding: const EdgeInsets.only(left: 16),
          decoration: BoxDecoration(
            color: CustomColors.bannerBg,
            borderRadius: BorderRadius.circular(20),
          ),
          height: 128.h,
          width: ScreenSize.width,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                // ignore: prefer_const_literals_to_create_immutables
                children: [
                  const Text(
                    '20% discount',
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(
                      top: 4,
                    ),
                    child: Text(
                      'on your first purchase',
                      style: TextStyle(color: CustomColors.subTitle),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(top: 16),
                child: ButtonTheme(
                    minWidth: 96.w,
                    child: ElevatedButton(
                      onPressed: () {},
                      style: buttonStyle,
                      child: const Text(
                        'Shop now',
                        style: TextStyle(color: CustomColors.primary),
                      ),
                    )),
              )
            ],
          ),
        ),
      )),
      Positioned(
          right: -6,
          top: -20,
          child: Image.asset(
            PngAssets.airPresto,
            height: 194.h,
            fit: BoxFit.fill,
          ))
    ]);
  }

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      options: CarouselOptions(),
      items: images.map((item) => renderBanner()).toList(),
    );
  }
}
