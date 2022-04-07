import 'package:flutter/material.dart';
import 'models/todo.dart';
import 'widgets/displaying_todo.dart';
import "widgets/new_todo.dart";

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

  void addTodo(String id, String title, String description) {
    final newTodo = Todo(id: id, title: title, description: description);

    setState(
      () {
        todoList.add(newTodo);
      },
    );
  }

  void _startAddTodo(BuildContext context) {
    showModalBottomSheet(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(25.0),
        ),
      ),
      isScrollControlled: true,
      context: context,
      builder: (context) {
        return NewTodo(addTodo);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(centerTitle: true, title: const Text("TODO"), actions: [
        IconButton(
          onPressed: () => _startAddTodo(context),
          icon: const Icon(Icons.add),
        )
      ]),
      body: TodoList(todoList),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        onPressed: () => _startAddTodo(context),
        child: const Icon(Icons.add),
      ),
    );
  }
}
