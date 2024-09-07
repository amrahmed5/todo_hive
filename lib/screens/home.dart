import 'package:flutter/material.dart';
 // Add this import for date formatting
import '../model/todo.dart';
import '../widgets/item.dart';


class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // Initialize with predefined tasks
  final List<ToDo> _todos = [
    ToDo(
      id: '01',
      todoText: 'Check Emails',
      time: DateTime.now().add(Duration(hours: 1)),
    ),
  ];

  void _handleToDoChanged(ToDo todo) {
    setState(() {
      todo.isDone = !todo.isDone;
    });
  }

  void _handleDeleteItem(String id) {
    setState(() {
      _todos.removeWhere((todo) => todo.id == id);
    });
  }

  void _handleEditItem(ToDo todo) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        TextEditingController _textController = TextEditingController(text: todo.todoText);
        DateTime _selectedTime = todo.time ?? DateTime.now();

        return AlertDialog(
          title: Text('Edit '),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: _textController,
                decoration: InputDecoration(labelText: 'Task'),
              ),
              SizedBox(height:20),
              Row(
                children: [

                  Spacer(),
                  IconButton(
                    icon: Icon(Icons.access_time),
                    onPressed: () async {
                      final TimeOfDay? picked = await showTimePicker(
                        context: context,
                        initialTime: TimeOfDay.fromDateTime(_selectedTime),
                      );
                      if (picked != null) {
                        setState(() {
                          _selectedTime = DateTime(
                            _selectedTime.year,
                            _selectedTime.month,
                            _selectedTime.day,
                            picked.hour,
                            picked.minute,
                          );
                        });
                      }
                    },
                  ),
                ],
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                setState(() {
                  todo.todoText = _textController.text;
                  todo.time = _selectedTime;
                });
                Navigator.of(context).pop();
              },
              child: Text('Save'),
            ),
          ],
        );
      },
    );
  }

  void _handleAddTask() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        TextEditingController _textController = TextEditingController();
        DateTime _selectedTime = DateTime.now();

        return AlertDialog(
          title: Text('Add Task'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: _textController,
                decoration: InputDecoration(labelText: 'Task'),
              ),
              SizedBox(height: 10),
              Row(
                children: [

                  Spacer(),
                  IconButton(
                    icon: Icon(Icons.access_time),
                    onPressed: () async {
                      final TimeOfDay? picked = await showTimePicker(
                        context: context,
                        initialTime: TimeOfDay.fromDateTime(_selectedTime),
                      );
                      if (picked != null) {
                        setState(() {
                          _selectedTime = DateTime(
                            _selectedTime.year,
                            _selectedTime.month,
                            _selectedTime.day,
                            picked.hour,
                            picked.minute,
                          );
                        });
                      }
                    },
                  ),
                ],
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                setState(() {
                  _todos.add(ToDo(
                    id: DateTime.now().toString(),
                    todoText: _textController.text,
                    time: _selectedTime,
                  ));
                });
                Navigator.of(context).pop();
              },
              child: Text('Add'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ToDo List'),
        automaticallyImplyLeading: false, // Removes the leading icon
      ),
      body: ListView(
        children: _todos.map((todo) => ToDoItem(
          todo: todo,
          onToDoChanged: _handleToDoChanged,
          onDeleteItem: _handleDeleteItem,
          onEditItem: _handleEditItem,
        )).toList(),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _handleAddTask,
        child: Icon(Icons.add),
      ),
    );
  }
}