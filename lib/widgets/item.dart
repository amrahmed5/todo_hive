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
        color: const Color.fromARGB(255, 49, 60, 64), // Background color of each item
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
                color: const Color.fromARGB(255, 255, 255, 255), // Text color
                decoration: todo.isDone ? TextDecoration.lineThrough : null, // Strikethrough if isDone is true
                decorationThickness: 4,
                decorationColor: const Color.fromARGB(255, 13, 12, 12),
              ),
            ),
            // Display time if available

          ],
        ),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Checkbox to toggle the isDone state
            Checkbox(
              value: todo.isDone,
              onChanged: (bool? value) {
                if (value != null) {
                  onToDoChanged(todo);  // Just pass the existing todo object
                }
              },
              activeColor: const Color.fromARGB(255, 46, 158, 50), // Change the checkbox active color
            ),
            IconButton(
              icon: Icon(Icons.edit, color: const Color.fromARGB(255, 144, 192, 241)),
              onPressed: () {
                onEditItem(todo);
              },
            ),
            IconButton(
              icon: Icon(Icons.delete, color: const Color.fromARGB(255, 218, 77, 89)),
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