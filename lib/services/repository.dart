import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:juan_test/models/users_models.dart';

class Repository {
  final String _baseUrl =
      'https://jsonplaceholder.typicode.com/posts?_start=0&_limit=20';

  Future getData() async {
    try {
      final response = await http.get(Uri.parse(_baseUrl));
      if (response.statusCode == 200) {
        Iterable i = jsonDecode(response.body);
        List<UsersModel> users = i.map((e) => UsersModel.fromJson(e)).toList();
        return users;
      }
    } catch (e) {
      // ignore: avoid_print
      print(e.toString());
    }
  }
}

// class ApiRepository {
//   final _provider = ApiProvider();

//   Future<UsersModel> fetchUserList() {
//     return _provider.fetchUserList();
//   }
// }

// class NetworkError extends Error {}
