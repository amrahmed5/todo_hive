class ToDo {
  String? id;
  String? todoText;
  bool isDone;
  DateTime? time;

  ToDo({
    required this.id,
    required this.todoText,
    this.isDone = false,
    this.time,
  });

  static List<ToDo> todoList() {
    return [
      ToDo(
        id: '1',
        todoText: 'Wake up',
        //isDone: true,
        time: DateTime.now().add(Duration(hours: 4)),
      ),
      ToDo(
        id: '1',
        todoText: 'palying',
        time: DateTime.now().add(Duration(hours: 3)),
      ),
      ToDo(
        id: '3',
        todoText: 'working',
        time: DateTime.now().add(Duration(hours: 2)),
      ),
      ToDo(
        id: '4',
        todoText: 'Go To Gym',
        time: DateTime.now().add(Duration(hours: 1)),
      ),
    ];
  }
}