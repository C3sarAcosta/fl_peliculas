import 'package:fl_peliculas/providers/movies_provider.dart';
import 'package:fl_peliculas/widgets/card_swiper.dart';
import 'package:fl_peliculas/widgets/movie_slider.dart';
import 'package:flutter/material.dart';
import 'package:card_swiper/card_swiper.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final moviesProvider = Provider.of<MoviesProvider>(context, listen: true);
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            CardSwiper(
              movies: moviesProvider.onDisplayMovies,
            ),
            MovieSlider()
          ],
        ),
      ),
    );
  }
}
