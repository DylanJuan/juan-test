import 'package:flutter/material.dart';
import 'package:juan_test/pages/home_page.dart';
import 'package:juan_test/pages/list_articles.dart';
import 'package:juan_test/pages/saved_data.dart';
import 'package:juan_test/pages/splash_page.dart';

Future main() async {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'TypeForm',
        theme: ThemeData(
          primarySwatch: Colors.amber,
          // ignore: deprecated_member_use
          accentColor: Colors.pinkAccent,
          canvasColor: const Color.fromRGBO(255, 254, 229, 1),
          fontFamily: 'Raleway',
          textTheme: ThemeData.light().textTheme.copyWith(
              bodyText1: const TextStyle(
                color: Color.fromRGBO(20, 51, 51, 1),
              ),
              bodyText2: const TextStyle(
                color: Color.fromRGBO(20, 51, 51, 1),
              ),
              subtitle1: const TextStyle(
                fontSize: 18,
                fontFamily: 'RobotoCondensed',
                fontWeight: FontWeight.bold,
              )),
        ),
        routes: {
          '/': (context) => const SplashPage(),
          SavedData.routeName: (context) => const SavedData(),
          Home.routeName: (context) => const Home(),
          ListArticles.routeName: (context) => const ListArticles(),
        });
  }
}
