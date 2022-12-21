import 'package:flutter/material.dart';
import 'package:sneakerapp/theme/colors.dart';

class PrimaryButton extends StatelessWidget {
  const PrimaryButton({Key? key, required this.title, this.onPressed})
      : super(key: key);
  final String title;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    final ButtonStyle buttonStyle = ElevatedButton.styleFrom(
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
        shadowColor: CustomColors.primaryTint,
        elevation: 8.0,
        backgroundColor: CustomColors.primaryTint);

    return ElevatedButton(
      onPressed: () {},
      style: buttonStyle,
      child: const Text(
        'Shop now',
        style: TextStyle(
            color: CustomColors.titleColor, fontWeight: FontWeight.w800),
      ),
    );
  }
}
