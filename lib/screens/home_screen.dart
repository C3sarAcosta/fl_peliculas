import 'package:fl_peliculas/widgets/card_swiper.dart';
import 'package:fl_peliculas/widgets/movie_slider.dart';
import 'package:flutter/material.dart';
import 'package:card_swiper/card_swiper.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [CardSwiper(), MovieSlider()],
        ),
      ),
    );
  }
}
