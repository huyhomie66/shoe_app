import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:sneakerapp/data/home_data.dart';
import 'package:sneakerapp/widgets/banner.dart';

class CarouselWidget extends StatelessWidget {
  const CarouselWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      options: CarouselOptions(),
      items: images.map((item) => const BannerWidget()).toList(),
    );
  }
}
