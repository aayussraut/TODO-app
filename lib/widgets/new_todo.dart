import 'package:flutter/material.dart';

class NewTodo extends StatefulWidget {
  final Function addTodo;

  NewTodo(this.addTodo);

  @override
  State<NewTodo> createState() => _NewTodoState();
}

class _NewTodoState extends State<NewTodo> {
  final _titleController = TextEditingController();

  void submitData() {
    String title = _titleController.text;
    bool isChecked = false;
    widget.addTodo(title, isChecked);
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Card(
        elevation: 5,
        child: Container(
          color: Colors.white,
          padding: MediaQuery.of(context).viewInsets,
          // padding: const EdgeInsets.only(
          //   top: 10,
          //   right: 10,
          //   left: 10,
          //   bottom:
          // ),
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                TextField(
                  style: const TextStyle(
                    color: Color(0xff031956),
                  ),
                  controller: _titleController,
                  autofocus: true,
                  decoration: const InputDecoration(
                    hintText: "Create a task.",
                  ),
                  onSubmitted: (_) => submitData(),
                ),
                const SizedBox(
                  height: 3,
                ),
                const SizedBox(
                  height: 5,
                ),
                ElevatedButton(
                  onPressed: submitData,
                  child: const Text(
                    "Add Task  ^",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
