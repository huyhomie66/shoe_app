// ignore_for_file: prefer_const_constructors
// ignore_for_file: prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:sneakerapp/theme/colors.dart';
import 'package:sneakerapp/theme/screen_size.dart';

class ProductCard extends StatefulWidget {
  const ProductCard(
      {super.key,
      required this.name,
      required this.price,
      required this.type,
      required this.image,
      required this.isFavorite,
      required this.colors});

  final String name;
  final String price;
  final String type;
  final String image;
  final bool isFavorite;
  final List<Color> colors;

  @override
  State<ProductCard> createState() => _ProductCardState();
}

class _ProductCardState extends State<ProductCard>
    with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
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
                CircleAvatar(
                  backgroundColor: CustomColors.primaryTint,
                  radius: 14,
                  child: IconButton(
                    padding: EdgeInsets.zero,
                    icon: Icon(
                      Iconsax.heart,
                      size: 14,
                    ),
                    color: CustomColors.primary,
                    onPressed: () {},
                  ),
                ),
                Image.asset(
                  widget.image,
                  height: 90.h,
                  width: 124.w,
                  fit: BoxFit.fill,
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.only(top: 8),
              child: Text(
                widget.type,
                style: TextStyle(
                  color: CustomColors.primary,
                  fontSize: 12,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(bottom: 12.h, top: 6.h),
              child: Text(
                widget.name,
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  widget.price,
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
                ),
                SizedBox(
                  child: Row(children: [
                    Wrap(
                      direction: Axis.horizontal,
                      children: widget.colors
                          .map((color) => Icon(
                                Icons.circle,
                                color: color,
                                size: 16,
                              ))
                          .toList(),
                    ),
                  ]),
                )
              ],
            )
          ]),
        ));
  }
}
