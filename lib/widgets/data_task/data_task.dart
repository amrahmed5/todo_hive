
class TaskItem {
  String description;
  bool isCompleted;

  TaskItem({required this.description, this.isCompleted = false});
}

class PanelModel {
  String title;
  List<TaskItem> items;

  PanelModel({required this.title, required this.items});
}