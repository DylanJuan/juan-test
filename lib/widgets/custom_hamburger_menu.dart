import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HamburgerMenu extends StatefulWidget {
  final String title;

  const HamburgerMenu({
    Key? key,
    required this.title,
  }) : super(key: key);

  @override
  State<HamburgerMenu> createState() => _HamburgerMenuState();
}

void clearPreferences() async {
  final prefs = await SharedPreferences.getInstance();
  await prefs.clear();
}

class _HamburgerMenuState extends State<HamburgerMenu> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        // Important: Remove any padding from the ListView.
        padding: EdgeInsets.zero,
        children: [
          SizedBox(
            height: 120,
            child: DrawerHeader(
              decoration: const BoxDecoration(
                color: Colors.amber,
              ),
              margin: const EdgeInsets.only(bottom: 10),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: const EdgeInsets.only(right: 30),
                    width: 60,
                    height: 60,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        image: AssetImage('assets/logo.png'),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      // ignore: prefer_const_literals_to_create_immutables
                      children: [
                        Container(
                          margin: const EdgeInsets.only(top: 10),
                          child: const Text(
                            'User',
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        const SizedBox(
                          height: 6,
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
          ListTile(
            title: Container(
                margin: const EdgeInsets.only(bottom: 3),
                decoration: const BoxDecoration(
                    border: Border(
                        bottom: BorderSide(width: 1.0, color: Colors.grey))),
                child: const Text('Home')),
            onTap: () {
              bool isNewRouteSameAsCurrent = false;

              Navigator.popUntil(context, (route) {
                if (route.settings.name == '/home') {
                  isNewRouteSameAsCurrent = true;
                }
                return true;
              });

              if (!isNewRouteSameAsCurrent) {
                Navigator.pushNamedAndRemoveUntil(
                    context, '/home', (router) => false);
              }
            },
          ),
          ListTile(
            title: Container(
              margin: const EdgeInsets.only(bottom: 3),
              decoration: const BoxDecoration(
                  border: Border(
                      bottom: BorderSide(width: 1.0, color: Colors.grey))),
              child: const Text(
                'List Articles',
              ),
            ),
            onTap: () {
              bool isNewRouteSameAsCurrent = false;

              Navigator.popUntil(context, (route) {
                if (route.settings.name == '/list-articles') {
                  isNewRouteSameAsCurrent = true;
                }
                return true;
              });

              if (!isNewRouteSameAsCurrent) {
                Navigator.pushNamed(context, '/list-articles');
              }
            },
          ),
          ListTile(
            title: Container(
              margin: const EdgeInsets.only(bottom: 3),
              decoration: const BoxDecoration(
                  border: Border(
                      bottom: BorderSide(width: 1.0, color: Colors.grey))),
              child: const Text(
                'Save Data',
              ),
            ),
            onTap: () {
              bool isNewRouteSameAsCurrent = false;

              Navigator.popUntil(context, (route) {
                if (route.settings.name == '/saved-data') {
                  isNewRouteSameAsCurrent = true;
                }
                return true;
              });

              if (!isNewRouteSameAsCurrent) {
                Navigator.pushNamed(context, '/saved-data');
              }
            },
          ),
          ListTile(
            title: Container(
              margin: const EdgeInsets.only(bottom: 3),
              decoration: const BoxDecoration(
                  border: Border(
                      bottom: BorderSide(width: 1.0, color: Colors.grey))),
              child: const Text(
                'Logout',
              ),
            ),
            onTap: () => showDialog(
              context: context,
              builder: (BuildContext context) => AlertDialog(
                title: const Text('Konfirmasi logout'),
                content: const Text('Apakah anda yakin untuk logout?'),
                actions: <Widget>[
                  TextButton(
                    onPressed: () => Navigator.pop(context),
                    child: const Text('CANCEL'),
                  ),
                  TextButton(
                    onPressed: () async {
                      clearPreferences();
                      Navigator.pushNamedAndRemoveUntil(
                          context, '/', (route) => false);
                    },
                    child: const Text('OK'),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
