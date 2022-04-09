import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

import 'models/todo.dart';
import 'widgets/displaying_todo.dart';
import "widgets/new_todo.dart";

class TodoHomePage extends StatefulWidget {
  const TodoHomePage({Key? key}) : super(key: key);

  @override
  State<TodoHomePage> createState() => _TodoHomePageState();
}

class _TodoHomePageState extends State<TodoHomePage> {
  void addTodo(String title, bool isChecked) {
    final newTodo = Todo(title: title, isChecked: isChecked);
    final todoBox = Hive.box('todos');
    setState(() {
      todoBox.add(newTodo);
    });
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
      body: TodoList(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        onPressed: () => _startAddTodo(context),
        child: const Icon(Icons.add),
      ),
    );
  }
}
