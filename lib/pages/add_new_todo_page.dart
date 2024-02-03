import 'package:flutter/material.dart';
import 'package:learn_provider_g9/controllers/todo_controller.dart';
import 'package:provider/provider.dart';

class AddingNewTodo extends StatelessWidget {
  AddingNewTodo({super.key});

  TextEditingController titleController = TextEditingController();
  TextEditingController contentController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: (){
              context.read<TodoController>().addNewTodo(title: titleController.text, content: contentController.text);
              Navigator.pop(context);
            },
            icon: const Icon(Icons.save),
          )
        ],
      ),
      body: Center(
        child: Column(
          children: [
            TextField(
              controller: titleController,
              decoration: const InputDecoration(
                hintText: "Title"
              ),
            ),
            TextField(
              controller: contentController,
              decoration: const InputDecoration(
                  hintText: "Content"
              ),
            ),
          ],
        ),
      ),
    );
  }
}
