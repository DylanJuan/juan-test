class UsersModel {
  UsersModel({
    this.userId,
    this.id,
    this.title,
    this.body,
  });

  int? userId;
  int? id;
  String? title;
  String? body;
  // String? error;

  factory UsersModel.fromJson(Map<String, dynamic> json) {
    return UsersModel(
      userId: json['userId'],
      id: json['id'],
      title: json['title'],
      body: json['body'],
    );
  }

  // UsersModel.withError(String errorMessages) {
  //   error = errorMessages;
  // }
}
