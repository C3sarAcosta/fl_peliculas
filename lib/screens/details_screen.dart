import 'package:flutter/material.dart';

class DetailsScreen extends StatelessWidget {
  const DetailsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //TODO: Cambiar por una instancia de pelicula
    //Obtener los argumentos
    final String movie =
        ModalRoute.of(context)?.settings.arguments.toString() ?? 'no-movie';
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          _CustomAppBar(),
          SliverList(
            delegate: SliverChildListDelegate([_PosterAndTitle(), _Overview()]),
          )
        ],
      ),
    );
  }
}

class _CustomAppBar extends StatelessWidget {
  const _CustomAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      //Color
      backgroundColor: Colors.purple,
      //Tamaño
      expandedHeight: 200,
      floating: false,
      //No desaparece
      pinned: true,
      flexibleSpace: FlexibleSpaceBar(
        centerTitle: true,
        title: Text('Movie.Title'),
        background: FadeInImage(
          placeholder: NetworkImage('https://via.placeholder.com/500x300'),
          image: NetworkImage('https://via.placeholder.com/500x300'),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}

class _PosterAndTitle extends StatelessWidget {
  const _PosterAndTitle({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final themeData = Theme.of(context).textTheme;
    final size = MediaQuery.of(context).size;
    return Container(
      //Separacion entre los widgets
      margin: EdgeInsets.only(top: 20),
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        children: [
          FadeInImage(
            placeholder: NetworkImage('https://via.placeholder.com/200x300'),
            image: NetworkImage('https://via.placeholder.com/200x300'),
            height: size.height * 0.2,
          ),
          SizedBox(
            width: 20,
          ),
          Container(
            width: size.width * 0.55,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Aliqua qui ad magna cillum id irure',
                  style: themeData.headline5,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                ),
                Text(
                  'Aliqua qui ad magna cillum id irure quis enim esse ea tempor laborum duis adipisicing.',
                  style: themeData.subtitle1,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                ),
                Row(
                  children: [
                    Icon(
                      Icons.star,
                      size: 15,
                      color: Colors.purple,
                    ),
                    Text(
                      '3.5',
                      style: themeData.caption,
                    )
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

class _Overview extends StatelessWidget {
  const _Overview({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Text(
        'Ea aliquip dolor et incididunt incididunt ipsum ut fugiat dolor officia consequat dolor. Esse adipisicing dolore enim labore voluptate velit commodo velit duis eiusmod ad duis dolore ex. Enim nostrud officia dolore cillum et adipisicing magna do dolor. Fugiat sit eu nulla voluptate amet excepteur.',
        style: Theme.of(context).textTheme.bodyText1,
        textAlign: TextAlign.justify,
      ),
    );
  }
}
