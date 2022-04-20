import 'package:flutter/material.dart';
import 'package:juan_test/models/users_models.dart';
import 'package:juan_test/services/repository.dart';

class ListArticles extends StatefulWidget {
  static const routeName = '/list-articles';
  const ListArticles({Key? key}) : super(key: key);

  @override
  State<ListArticles> createState() => _ListArticlesState();
}

class _ListArticlesState extends State<ListArticles> {
  // final TypeformModelBloc _typeformModelBloc = TypeformModelBloc();

  List<UsersModel> users = [];
  Repository repository = Repository();

  getData() async {
    users = await repository.getData();
    setState(() {});
  }

  @override
  void initState() {
    getData();
    // _typeformModelBloc.add(GetTypeFormList());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('List Articles'),
      ),
      body: _buildListArticles(),
    );
  }

  Widget _buildListArticles() {
    return Container(
      margin: const EdgeInsets.all(10),
      child: ListView.builder(
        itemCount: users.length,
        itemBuilder: ((context, index) {
          return Card(
            child: ListTile(
              subtitle: Text(users[index].body!),
              trailing: Text(users[index].id!.toString()),
              title: Text(users[index].title!),
            ),
          );
        }),
      ),
    );
    // return Container(
    //   margin: const EdgeInsets.all(8),
    //   child: BlocProvider(
    //     create: (_) => _typeformModelBloc,
    //     child: BlocBuilder<TypeformModelBloc, TypeformModelState>(
    //       builder: (context, state) {

    //         if (state is TypeformModelSuccess) {
    //           return ListView.builder(
    //             itemBuilder: (context, index) {
    //               return Container(
    //                 child: Text(''),
    //               );
    //             },
    //           );
    //         }
    //         return Center(
    //           child: CircularProgressIndicator(),
    //         );
    //       },
    //     ),
    //   ),
    // );
  }
}
