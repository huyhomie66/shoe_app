import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:sneakerapp/theme/colors.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    final cartButton = Padding(
      padding: const EdgeInsets.only(bottom: 10, right: 10),
      child: Ink(
        decoration: const ShapeDecoration(
          color: CustomColors.primaryTint,
          shape: CircleBorder(),
        ),
        child: IconButton(
          color: CustomColors.primary,
          icon: const Icon(
            Iconsax.shopping_cart5,
          ),
          onPressed: () {},
        ),
      ),
    );

    const title = Text(
      'Welcome to you',
      style: TextStyle(
          color: CustomColors.titleColor,
          fontSize: 24,
          fontWeight: FontWeight.bold),
    );

    return AppBar(
      centerTitle: false,
      shadowColor: Colors.transparent,
      actions: <Widget>[cartButton],
      backgroundColor: CustomColors.bgColor,
      title: title,
    );
  }
}
