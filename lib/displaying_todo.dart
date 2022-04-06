import 'package:flutter/material.dart';
import 'package:todo/todo.dart';

class TodoList extends StatelessWidget {
  final List<Todo> _todoList;
  TodoList(this._todoList);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.builder(
        itemBuilder: (context, index) {
          return Card(
            margin: const EdgeInsets.all(8),
            child: ListTile(
              leading: const Icon(Icons.calendar_month),
              title: Text(_todoList[index].title),
              subtitle: Text(_todoList[index].description),
              trailing: IconButton(
                icon: Icon(
                  Icons.delete,
                  color: Colors.red,
                ),
                onPressed: () {},
              ),
            ),
          );
        },
        itemCount: _todoList.length,
      ),
    );
  }
}
