import 'dart:convert';

import 'package:app1/Models/user_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ExampleThree extends StatefulWidget {
  const ExampleThree({super.key});

  @override
  State<ExampleThree> createState() => _ExampleThreeState();
}

class _ExampleThreeState extends State<ExampleThree> {
  List<UserModel> userList = [];

  Future<List<UserModel>> getUserAPI() async {
    final response =
        await http.get(Uri.parse('https://jsonplaceholder.typicode.com/users'));
    var data = jsonDecode(response.body.toString());
    if (response.statusCode == 200) {
      for (Map i in data) {
        userList.add(UserModel.fromJson(i));
      }
      return userList;
    } else {
      return userList;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text('Api course'),
        ),
        body: Column(
          children: [
            Expanded(
              child: FutureBuilder(
                future: getUserAPI(),
                builder: (context, AsyncSnapshot<List<UserModel>> snapshot) {
                  if (!snapshot.hasData) {
                    return const CircularProgressIndicator();
                  } else {
                    return ListView.builder(
                        itemCount: userList.length,
                        itemBuilder: (context, index) {
                          return Card(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                children: [
                                  ReusableRow(
                                      title: 'name:  ',
                                      value: snapshot.data![index].name
                                          .toString()),
                                  ReusableRow(
                                      title: 'email:  ',
                                      value: snapshot.data![index].email
                                          .toString()),
                                  ReusableRow(
                                      title: 'address:  ',
                                      value: snapshot
                                              .data![index].address!.street
                                              .toString() +
                                          ', ' +
                                          snapshot.data![index].address!.city
                                              .toString()),
                                  ReusableRow(
                                      title: 'geo:  ',
                                      value: snapshot
                                          .data![index].address!.geo!.lat
                                          .toString()),
                                ],
                              ),
                            ),
                          );
                        });
                  }
                },
              ),
            )
          ],
        ));
  }
}

class ReusableRow extends StatelessWidget {
  String title, value;
  ReusableRow({required this.title, required this.value, super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(title),
        Text(value),
      ],
    );
  }
}
