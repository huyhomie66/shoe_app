import 'package:flutter/material.dart';
import 'package:sneakerapp/utils/colors.dart';

class PrimaryButton extends StatelessWidget {
  const PrimaryButton({Key? key, required this.title}) : super(key: key);
  final String title;
  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {},
      style: ButtonStyle(
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(50.0),
        )),
        backgroundColor:
            const MaterialStatePropertyAll<Color>(CustomColors.primary),
      ),
      child: Text(
        title,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 18,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}
