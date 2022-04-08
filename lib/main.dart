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
      theme: ThemeData().copyWith(
          bottomSheetTheme:
              const BottomSheetThemeData(backgroundColor: Colors.transparent),
          textTheme: Theme.of(context).textTheme.apply(
                bodyColor: Colors.white,
                displayColor: Colors.white,
              ),
          cardColor: const Color.fromARGB(255, 25, 54, 140),
          colorScheme: ThemeData().colorScheme.copyWith(
                primary: const Color(0xff031956),
                secondary: const Color(0xff344FA1),
              )),
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
    Todo(
        id: "1",
        title: "Gym",
        description: "Go to Gym EveryDay",
        isChecked: false),
    Todo(
        id: "2",
        title: "Coding",
        description: "1-2 Hours HackerRank EveryDay",
        isChecked: false),
  ];

  void addTodo(String id, String title, String description, bool isChecked) {
    final newTodo = Todo(
        id: id, title: title, description: description, isChecked: isChecked);

    setState(
      () {
        todoList.add(newTodo);
      },
    );
  }

  void _startAddTodo(BuildContext context) {
    showModalBottomSheet(
      backgroundColor: Colors.white,
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
      backgroundColor: const Color(0xff031956),
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
