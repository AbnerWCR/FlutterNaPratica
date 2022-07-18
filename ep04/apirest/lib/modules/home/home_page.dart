import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<dynamic> posts = [];

  final client = Dio(
    BaseOptions(baseUrl: "https://jsonplaceholder.typicode.com/"),
  );

  Future<void> _getPosts() async {
    final response = await client.get("/posts");
    posts = response.data;

    setState(() {
      
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: ListView.builder(
        itemCount: posts.length,
        itemBuilder: (_, index) => Card(
          child: ListTile(
            title: Text(posts[index]['title']),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          await _getPosts();
        },
        tooltip: '',
        child: const Icon(Icons.get_app_outlined),
      ),
    );
  }
}