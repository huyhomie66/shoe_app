// ignore_for_file: prefer_const_constructors
// ignore_for_file: prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:sneakerapp/theme/assets.dart';
import 'package:sneakerapp/theme/colors.dart';
import 'package:sneakerapp/theme/screen_size.dart';
import 'package:sneakerapp/widgets/app_bar.dart';
import 'package:sneakerapp/widgets/bottom_bar.dart';
import 'package:sneakerapp/widgets/carousel.dart';
import 'package:sneakerapp/widgets/product_card.dart';

class Home extends StatefulWidget {
  const Home({
    super.key,
  });

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> with TickerProviderStateMixin {
  Widget renderProductCard() {
    return Container(
        width: 157.w,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: Colors.white,
          boxShadow: [
            const BoxShadow(color: CustomColors.bannerBg, spreadRadius: 0.1),
          ],
        ),
        child: Padding(
          padding: EdgeInsets.all(16),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Stack(
              children: [
                Icon(
                  Iconsax.heart,
                  size: 16,
                ),
                Image.asset(
                  PngAssets.airMax,
                  height: 81.h,
                  width: 125.w,
                  fit: BoxFit.fill,
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.only(top: 16.h),
              child: const Text(
                'Best Seller',
                style: TextStyle(
                  color: CustomColors.primary,
                  fontSize: 12,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(bottom: 12.h, top: 4.h),
              child: const Text(
                'Nike Jordan',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
              ),
            ),
            Row(
              children: [
                const Text(
                  '68',
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
                ),
                Icon(
                  Icons.circle,
                  color: Colors.green,
                  size: 16,
                )
              ],
            )
          ]),
        ));
  }

  @override
  Widget build(BuildContext context) {
    final floatButton = FloatingActionButton(
      splashColor: CustomColors.primary,
      focusColor: CustomColors.primary,
      onPressed: () {},
      backgroundColor: CustomColors.primaryTint,
      child: const Icon(
        Iconsax.shop5,
        color: CustomColors.primary,
      ),
    );

    return Scaffold(
        appBar: const PreferredSize(
          preferredSize: Size.fromHeight(60),
          child: CustomAppBar(),
        ),
        body: ListView(
          children: [
            SizedBox(
              height: 30.h,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  Chip(
                    backgroundColor: CustomColors.primaryTint,
                    label: const Text('nike'),
                    avatar: CircleAvatar(
                      backgroundColor: CustomColors.primary,
                      child: Icon(Iconsax.activity2),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.all(16),
              child: Column(children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Popular',
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                          color: CustomColors.titleColor),
                    ),
                    Text(
                      'See all',
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 12,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ProductCard(
                        name: 'Nike Air',
                        price: '49',
                        type: 'Best Seller',
                        image: PngAssets.airMax,
                        isFavorite: false,
                        colors: [Colors.green, Colors.yellow]),
                    ProductCard(
                        name: 'Nike Air',
                        price: '49',
                        type: 'Best Seller',
                        image: PngAssets.airMax,
                        isFavorite: false,
                        colors: [Colors.green, Colors.yellow])
                  ],
                ),
              ]),
            ),
            const CarouselWidget(),
          ],
        ),
        floatingActionButton: floatButton,
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        backgroundColor: CustomColors.bgColor,
        bottomNavigationBar: const CustomBottomBar());
  }
}
