import 'package:flutter/material.dart';
import 'package:learn_provider_g9/controllers/todo_controller.dart';
import 'package:provider/provider.dart';

import 'add_new_todo_page.dart';

class DetailPage extends StatelessWidget {
  const DetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Todo"),
      ),
      body: Consumer<TodoController>(
        builder: (context, con, child) {
          return ListView.builder(
            itemCount: con.todo.length,
            itemBuilder: (context, index){
              return Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Checkbox(
                    value: con.todo[index].isCompleted,
                    onChanged: (value){
                      context.read<TodoController>().changeValue(con.todo[index]);
                    },
                  ),
                  Expanded(
                    child: ListTile(
                      title: Text(con.todo[index].title),
                      subtitle: Text(con.todo[index].content),
                      trailing: IconButton(
                        onPressed: (){
                          context.read<TodoController>().deleteTodo(con.todo[index]);
                        },
                        icon: const Icon(Icons.delete),
                      ),
                    ),
                  ),
                ],
              );
            },
          );
        }
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          Navigator.push(context, MaterialPageRoute(builder: (context) => AddingNewTodo()));
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
