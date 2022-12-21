import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:sneakerapp/theme/colors.dart';
import 'package:sneakerapp/widgets/bottom_bar.dart';
import 'package:sneakerapp/widgets/carousel.dart';
import 'package:sneakerapp/widgets/product_list.dart';

class Home extends StatefulWidget {
  const Home({
    super.key,
  });

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> with TickerProviderStateMixin {
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

    return Scaffold(
        appBar: AppBar(
          centerTitle: false,
          shadowColor: Colors.transparent,
          actions: <Widget>[cartButton],
          backgroundColor: CustomColors.bgColor,
          title: title,
        ),
        body: SizedBox(
          child: Stack(children: <Widget>[
            // CarouselWidget(),
            GridView.count(
              // Create a grid with 2 columns. If you change the scrollDirection to
              // horizontal, this produces 2 rows.
              crossAxisCount: 2,
              children: List.generate(10, (index) {
                return Center(
                  child: Text(
                    'Item $index',
                    style: Theme.of(context).textTheme.headline5,
                  ),
                );
              }),
            ),
          ]),
        ), //destination screen
        floatingActionButton: floatButton,
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        backgroundColor: CustomColors.bgColor,
        bottomNavigationBar: const CustomBottomBar());
  }
}
