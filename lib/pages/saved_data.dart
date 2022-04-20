import 'package:flutter/material.dart';

import 'package:juan_test/pages/list_data.dart';
import 'package:juan_test/widgets/button_widget.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SavedData extends StatefulWidget {
  static const routeName = '/saved-data';
  const SavedData({Key? key}) : super(key: key);

  @override
  State<SavedData> createState() => _SavedDataState();
}

class _SavedDataState extends State<SavedData> {
  final nameController = TextEditingController();
  final ageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Simpan Data Diri'),
        backgroundColor: Colors.amber,
      ),
      body: Container(
          margin: const EdgeInsets.all(20),
          child: ListView(
            children: [
              TextFormField(
                controller: nameController,
                decoration: const InputDecoration(hintText: 'Input Nama ...'),
              ),
              TextFormField(
                controller: ageController,
                decoration: const InputDecoration(hintText: 'Input Umur ...'),
                keyboardType: TextInputType.number,
              ),
              const SizedBox(
                height: 15,
              ),
              ButtonWidget(
                text: 'Submit Data',
                onClicked: () {
                  final snackBar = SnackBar(
                    content: const Text('Data berhasil di submit!'),
                    action: SnackBarAction(
                      label: 'Undo',
                      onPressed: () {},
                    ),
                  );
                  setData(nameController.text, ageController.text);
                  ScaffoldMessenger.of(context).showSnackBar(snackBar);
                },
              ),
              const SizedBox(
                height: 20,
              ),
              ButtonWidget(
                  text: 'Lihat List',
                  onClicked: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const ListData()));
                  })
            ],
          )),
    );
  }
}

Future<void> setData(nama, umur) async {
  final SharedPreferences pref = await SharedPreferences.getInstance();
  pref.setString('nama', nama);
  pref.setString('umur', umur);
}
