import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

class TodoList extends StatefulWidget {
  @override
  State<TodoList> createState() => _TodoListState();
}

class _TodoListState extends State<TodoList> {
  final todoBox = Hive.box('todos');

  void deleteTask(int index) {}
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.builder(
        itemBuilder: (context, int index) {
          final task = todoBox.getAt(index);
          return Card(
            // color: ThemeData().copyWith().,
            margin: const EdgeInsets.all(8),
            child: CheckboxListTile(
              side: const BorderSide(color: Colors.white),
              activeColor: const Color(0xff344FA1),
              checkColor: Colors.white,
              // leading: const Icon(
              //   Icons.calendar_month,
              //   color: Colors.white,
              // ),
              value: task.isChecked,
              controlAffinity: ListTileControlAffinity.leading,
              title: Text(
                task.title,
                style: TextStyle(
                  decoration:
                      task.isChecked ? TextDecoration.lineThrough : null,
                ),
              ),
              secondary: IconButton(
                icon: const Icon(
                  Icons.delete,
                  color: Colors.red,
                ),
                onPressed: () {
                  setState(() {
                    todoBox.deleteAt(index);
                  });
                },
              ),

              onChanged: (bool? value) {
                setState(() {
                  task.isChecked = value!;
                });
              },
              // trailing: IconButton(
              //   icon: const Icon(
              //     Icons.delete,
              //     color: Colors.red,
              //   ),
              //   onPressed: () {},
              // ),
            ),
          );
        },
        itemCount: todoBox.length,
      ),
    );
  }
}
