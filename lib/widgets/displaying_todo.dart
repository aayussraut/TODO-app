import 'package:flutter/material.dart';
import 'package:todo/models/todo.dart';

class TodoList extends StatefulWidget {
  final List<Todo> _todoList;
  TodoList(this._todoList);

  @override
  State<TodoList> createState() => _TodoListState();
}

class _TodoListState extends State<TodoList> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.builder(
        itemBuilder: (context, index) {
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
              value: widget._todoList[index].isChecked,
              controlAffinity: ListTileControlAffinity.leading,
              title: Text(
                widget._todoList[index].title,
                style: TextStyle(
                  decoration: widget._todoList[index].isChecked
                      ? TextDecoration.lineThrough
                      : null,
                ),
              ),
              secondary: const IconButton(
                icon: Icon(
                  Icons.delete,
                  color: Colors.red,
                ),
                onPressed: null,
              ),
              subtitle: Text(widget._todoList[index].description),
              onChanged: (bool? value) {
                setState(() {
                  widget._todoList[index].isChecked = value!;
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
        itemCount: widget._todoList.length,
      ),
    );
  }
}
