import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(home: HomePage()));
}

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final stickyNotes = <String>[];

  int counter = 0;

  void addReminder(String reminder) {
    stickyNotes.add(reminder);
    setState(() {});
  }

  void removeReminder(String reminder) {
    stickyNotes.remove(reminder);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Home Page"),
        ),
        body: ListView(
          children: stickyNotes
              .map((e) => ListTile(
                    title: Text(
                      e,
                      style: const TextStyle(fontSize: 26),
                    ),
                  ))
              .toList(),
        ),
        floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.add),
          onPressed: () {
            addReminder("Reminder $counter");
            counter++;
          },
        ));
  }
}
