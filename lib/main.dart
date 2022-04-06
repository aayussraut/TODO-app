import 'package:flutter/material.dart';
import 'todo.dart';
import 'displaying_todo.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "TODO",
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<Todo> todoList = [
    Todo(id: "1", title: "Gym", description: "Go to Gym EveryDay"),
    Todo(
        id: "2", title: "Coding", description: "1-2 Hours HackerRank EveryDay"),
  ];

  // void addTodo(String id, String title, String description) {
  //   final newTodo = Todo(id: id, title: title, description: description);

  //   setState(() {
  //     todo_list.add(newTodo);
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(centerTitle: true, title: const Text("TODO"), actions: [
        IconButton(
          onPressed: () {},
          icon: const Icon(Icons.add),
        )
      ]),
      body: TodoList(todoList),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.add),
      ),
    );
  }
}
