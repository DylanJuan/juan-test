import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ListData extends StatefulWidget {
  const ListData({Key? key}) : super(key: key);

  @override
  State<ListData> createState() => _ListDataState();
}

class _ListDataState extends State<ListData> {
  String? nama;
  String? umur;

  @override
  void initState() {
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.amber,
          title: const Text('List Data Diri'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: nama == null
              ? const Center(
                  child: Text(
                    'Tidak ada data diri',
                    style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 22,
                        fontFamily: 'Raleway',
                        // ignore: deprecated_member_use
                        color: Colors.black54),
                  ),
                )
              : ListView(
                  padding: const EdgeInsets.all(8),
                  children: <Widget>[
                    SizedBox(
                      height: 50,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Nama  : $nama',
                            style: const TextStyle(
                                fontWeight: FontWeight.w700,
                                fontSize: 22,
                                color: Colors.black54),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 50,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Umur  : $umur',
                            style: const TextStyle(
                              fontWeight: FontWeight.w700,
                              fontSize: 22,
                              color: Colors.black54,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
        ));
  }

  void getData() async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    nama = pref.getString('nama');
    umur = pref.getString('umur');
    setState(() {});
  }
}
