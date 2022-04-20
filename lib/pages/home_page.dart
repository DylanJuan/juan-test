import 'package:flutter/material.dart';
import 'package:juan_test/pages/list_articles.dart';
import 'package:juan_test/pages/saved_data.dart';
import 'package:juan_test/widgets/button_widget.dart';

import '../widgets/custom_hamburger_menu.dart';

class Home extends StatefulWidget {
  static const routeName = '/home';
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber,
        title: const Text('TypeForm'),
      ),
      drawer: const HamburgerMenu(title: 'Home'),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            const SizedBox(
              height: 250,
              width: 250,
              child: Image(image: AssetImage('assets/bahaso.png')),
            ),
            const SizedBox(
              height: 10,
            ),
            ButtonWidget(
                text: 'List Articles',
                onClicked: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: ((context) => const ListArticles()),
                    ),
                  );
                }),
            const SizedBox(
              height: 20,
            ),
            ButtonWidget(
                text: 'Submit Data',
                onClicked: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const SavedData(),
                    ),
                  );
                }),
          ],
        ),
      ),
    );
  }
}
