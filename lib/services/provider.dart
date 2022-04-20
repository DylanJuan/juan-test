

// class ApiProvider {
//   final Dio _dio = Dio();
//   final String _url =
//       'https://jsonplaceholder.typicode.com/posts?_start=0&_limit=20';

//   Future<UsersModel> fetchUserList() async {
//     try {
//       Response response = await _dio.get(_url);
//       return UsersModel.fromJson(response.data);
//     } catch (error, stacktrace) {
//       // ignore: avoid_print
//       print("Exception occured: $error stackTrace: $stacktrace");
//       // return UsersModel.withError("Data not found / Connection issue");
//     }
//   }
// }
