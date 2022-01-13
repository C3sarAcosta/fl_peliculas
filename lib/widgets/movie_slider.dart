// ignore_for_file: unnecessary_const

import 'package:fl_peliculas/models/movie.dart';
import 'package:flutter/material.dart';

class MovieSlider extends StatelessWidget {
  final List<Movie> movies;
  final String? title;
  const MovieSlider({Key? key, required this.movies, this.title})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    //Obtenemos el tamaño de la pantalla
    final size = MediaQuery.of(context).size;
    return Container(
      //Establecemos el ancho del contenedor
      width: double.infinity,
      //Establecemos el alto del contenedor
      height: size.height * 0.3,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (title != null)
            const Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: const Text(
                //TODO: Error en el titulo
                'Populares',
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          //El list view obtendra el tamaño restante del padre
          Expanded(
            child: ListView.builder(
              //Direccion del scroll
              scrollDirection: Axis.horizontal,
              //Tamaño de la lista
              itemCount: movies.length,
              //Lo que vamos a construir dentro de la lista
              itemBuilder: (_, index) => _MoviePoster(movie: movies[index]),
            ),
          ),
        ],
      ),
    );
  }
}

class _MoviePoster extends StatelessWidget {
  final Movie movie;
  const _MoviePoster({Key? key, required this.movie}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      width: size.width * 0.3,
      height: size.height * 0.25,
      child: Column(
        children: [
          GestureDetector(
            onTap: () =>
                Navigator.pushNamed(context, 'details', arguments: 'movie'),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: FadeInImage(
                placeholder:
                    NetworkImage('https://via.placeholder.com/300x400'),
                image: NetworkImage(movie.fullPosterImg),
                height: size.height * 0.18,
                fit: BoxFit.cover,
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            movie.title,
            overflow: TextOverflow.ellipsis,
            maxLines: 2,
            textAlign: TextAlign.center,
          )
        ],
      ),
    );
  }
}
