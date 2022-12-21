import 'package:drop_shadow/drop_shadow.dart';
import 'package:flutter/material.dart';
import 'package:sneakerapp/theme/assets.dart';
import 'package:sneakerapp/theme/colors.dart';
import 'package:sneakerapp/theme/screen_size.dart';
import 'package:sneakerapp/widgets/button.dart';

class BannerWidget extends StatelessWidget {
  const BannerWidget({
    super.key,
  });

  Widget renderBanner() {
    return Stack(children: [
      Positioned(
          child: DropShadow(
        blurRadius: 5,
        borderRadius: 20,
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
                    style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: CustomColors.primary),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(
                      top: 4,
                    ),
                    child: Text(
                      'on your first purchase',
                      style: TextStyle(
                        fontSize: 14,
                        color: CustomColors.subTitle,
                      ),
                    ),
                  )
                ],
              ),
              const Padding(
                padding: EdgeInsets.only(top: 18),
                child: PrimaryButton(
                  title: 'Shop now',
                ),
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
    return renderBanner();
  }
}
