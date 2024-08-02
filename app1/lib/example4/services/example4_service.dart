import 'dart:convert';

import 'package:app1/Models/posts4_model.dart';
import 'package:app1/constants/error_handling.dart';
import 'package:app1/constants/utils.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Post4Services {
  Future<List<Posts4Model>> getPost4API(BuildContext context) async {
    // final userProvider = Provider.of<UserProvider>(context, listen: false);
    List<Posts4Model> postList = [];
    try {
      http.Response res = await http.get(
          Uri.parse('https://jsonplaceholder.typicode.com/posts'),
          headers: {
            'Content-Type': 'application/json; charset=UTF-8',
            // 'x-auth-token': userProvider.user.token,
          });

      httpErrorHandle(
        response: res,
        context: context,
        onSuccess: () {
          for (int i = 0; i < jsonDecode(res.body).length; i++) {
            postList.add(
              Posts4Model.fromJson(
                jsonEncode(
                  jsonDecode(res.body)[i],
                ),
              ),
            );
          }
        },
      );
    } catch (e) {
      showSnackBar(context, e.toString());
    }
    return postList;
  }
}
