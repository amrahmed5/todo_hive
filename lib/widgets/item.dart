import 'package:flutter/material.dart';
import '../model/todo.dart';

class ToDoItem extends StatelessWidget {
  final ToDo todo;
  final void Function(ToDo) onToDoChanged;
  final void Function(String) onDeleteItem;
  final void Function(ToDo) onEditItem;

  ToDoItem({
    required this.todo,
    required this.onToDoChanged,
    required this.onDeleteItem,
    required this.onEditItem,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 10),
      decoration: BoxDecoration(
        color: Colors.black87, // Background color of each item
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Colors.white), // White border color
      ),
      child: ListTile(
        contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              todo.todoText!,
              style: TextStyle(
                fontSize: 16,
                color: Colors.white, // Text color
                decoration: todo.isDone ? TextDecoration.lineThrough : null,
              ),
            ),
            if (todo.time != null) // Display time if available
              Text(
                '${todo.time!.hour}:${todo.time!.minute}',
                style: TextStyle(color: Colors.white54),
              ),
          ],
        ),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Checkbox(
              value: todo.isDone,
              onChanged: (bool? value) {
                if (value != null) {
                  onToDoChanged(todo);
                }
              },
              checkColor: Colors.black, // Check color inside the checkbox
              activeColor: Colors.white, // Border color of checkbox
            ),
            IconButton(
              icon: Icon(Icons.edit, color: Colors.amber),
              onPressed: () {
                onEditItem(todo);
              },
            ),
            IconButton(
              icon: Icon(Icons.delete, color: Colors.redAccent),
              onPressed: () {
                onDeleteItem(todo.id!);
              },
            ),
          ],
        ),
      ),
    );
  }
}