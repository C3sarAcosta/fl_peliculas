import 'package:fl_peliculas/providers/movies_provider.dart';
import 'package:fl_peliculas/screens/details_screen.dart';
import 'package:fl_peliculas/screens/home_screen.dart';
//import 'package:fl_peliculas/screens/screens.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() => runApp(AppState());

class AppState extends StatelessWidget {
  const AppState({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => MoviesProvider(),
          lazy: false,
        )
      ],
      child: MyApp(),
    );
  }
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.light()
          .copyWith(appBarTheme: const AppBarTheme(color: Colors.purple)),
      title: 'Material App',
      initialRoute: 'home',
      routes: {
        'home': (_) => HomeScreen(),
        'details': (_) => DetailsScreen(),
      },
    );
  }
}
