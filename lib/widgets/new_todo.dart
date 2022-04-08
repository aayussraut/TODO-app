import 'package:flutter/material.dart';

class NewTodo extends StatefulWidget {
  final Function addTodo;

  NewTodo(this.addTodo);

  @override
  State<NewTodo> createState() => _NewTodoState();
}

class _NewTodoState extends State<NewTodo> {
  final _titleController = TextEditingController();
  final _descriptionController = TextEditingController();

  void submitData() {
    String title = _titleController.text;
    String description = _descriptionController.text;
    String id = DateTime.now().toString();
    bool isChecked = false;

    widget.addTodo(id, title, description, isChecked);
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
                TextField(
                  controller: _descriptionController,
                  decoration: const InputDecoration(hintText: "Description"),
                  onSubmitted: (_) => submitData(),
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
