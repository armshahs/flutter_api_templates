import 'dart:convert';

class Posts4Model {
  int? userId;
  int? id;
  String? title;
  String? body;

  Posts4Model({
    this.userId,
    this.id,
    this.title,
    this.body,
  });

  Map<String, dynamic> toMap() {
    return {
      'userId': userId,
      'id': id,
      'title': title,
      'body': body,
    };
  }

  factory Posts4Model.fromMap(Map<String, dynamic> map) {
    return Posts4Model(
      userId: map['userId'],
      id: map['id'],
      title: map['title'],
      body: map['body'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Posts4Model.fromJson(String source) =>
      Posts4Model.fromMap(json.decode(source));

  // Posts4Model.fromJson(dynamic json) {
  //   userId = json['userId'];
  //   id = json['id'];
  //   title = json['title'];
  //   body = json['body'];
  // }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['userId'] = this.userId;
//     data['id'] = this.id;
//     data['title'] = this.title;
//     data['body'] = this.body;
//     return data;
//   }
//
}
