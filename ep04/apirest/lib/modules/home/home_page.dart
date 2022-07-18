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
  List<dynamic> photos = [];

  final client = Dio(
    BaseOptions(baseUrl: "https://jsonplaceholder.typicode.com/"),
  );

  Future<void> _getPosts() async {
    final response = await client.get("/posts");
    posts = response.data;

    setState(() {});
  }

  Future<void> _photos() async {
    final response = await client.get("/photos");
    photos = response.data;

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: ListView.builder(
        itemCount: photos.length,
        itemBuilder: (_, index) => Card(
          
          child: Image(image: NetworkImage(photos[index]["url"]),
            
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          //await _getPosts();
          await _photos();
        },
        tooltip: '',
        child: const Icon(Icons.photo_camera_back_outlined),
      ),
    );
  }
}