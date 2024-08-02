import 'package:app1/Models/posts4_model.dart';
import 'package:app1/example4/services/example4_service.dart';
import 'package:flutter/material.dart';

class HomeScreen4 extends StatefulWidget {
  const HomeScreen4({super.key});

  @override
  State<HomeScreen4> createState() => _HomeScreen4State();
}

class _HomeScreen4State extends State<HomeScreen4> {
  List<Posts4Model> postList = []; // for GET request

  final Post4Services adminServices = Post4Services(); // for GET request

  @override // for GET request
  void initState() {
    super.initState();
    getPost4API();
  }

  //for GET request
  Future<List<Posts4Model>> getPost4API() async {
    postList = await adminServices.getPost4API(context);
    // // Print individual Posts4Model objects
    // for (var post in postList) {
    //   print('userId: ${post.userId}');
    //   print('id: ${post.id}');
    //   print('title: ${post.title}');
    //   print('body: ${post.body}');
    //   print('------------------');
    // }
    return postList;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('API app'),
        centerTitle: true,
        backgroundColor: Colors.orange,
      ),
      body: Column(
        children: [
          Expanded(
            child: FutureBuilder(
                future: getPost4API(),
                builder: (context, snapshot) {
                  // print('snapshot');
                  // print(snapshot);
                  if (!snapshot.hasData) {
                    return Text('Loading');
                  } else {
                    return ListView.builder(
                        itemCount: postList.length,
                        itemBuilder: (context, index) {
                          return Card(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    'Title',
                                    style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text(postList[index].title.toString()),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  const Text(
                                    'Description',
                                    style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text(postList[index].body.toString()),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                ],
                              ),
                            ),
                          );
                        });
                  }
                }),
          )
        ],
      ),
    );
  }
}
