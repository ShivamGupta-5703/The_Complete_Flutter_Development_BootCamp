import 'package:flutter/material.dart';
import 'package:to_do_list_app/modules/task.dart';
import 'package:collection/collection.dart';

class TaskData extends ChangeNotifier {
  List<Task> _tasks = [
<<<<<<< HEAD
    Task(text: 'Prodigy Internship'),
    Task(text: 'DSA'),
    Task(text: 'Android-Development'),
=======
    Task(text: 'Buy Milk'),
    Task(text: 'Buy Milk'),
    Task(text: 'Buy Milk'),
>>>>>>> a40618ca8d1d7406ccc9147392a8b1e5b9658e5f
  ];

  //this is done so that we cannot directly access our tasks list so we make private cannot be modified and its properties can be accessed.
  UnmodifiableListView<Task> get tasks {
    return UnmodifiableListView(_tasks);
  }

  //getter method to get length whenever required
  int get taskCount {
    return _tasks.length;
  }

  //ADD TASK
  void addTask(String newTaskTitle) {
    final task = Task(text: newTaskTitle);
    _tasks.add(task);
    notifyListeners();
  }

  //checkbox
  void updateTask(Task task) {
    task.toggleDone();
    notifyListeners();
  }

  //delete task
  void deleteTask(Task task) {
    _tasks.remove(task);
    notifyListeners();
  }
}
