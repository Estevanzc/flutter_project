import 'package:flutter/material.dart';
import 'package:flutter_project/widgets/to_do_widget.dart';

class ToDoPage extends StatefulWidget {
  ToDoPage({super.key});

  @override
  State<ToDoPage> createState() => _ToDoPageState();
}

class _ToDoPageState extends State<ToDoPage> {
  List<Map> tasks = [
    {
      "title": "Buy groceries",
      "description": "Milk, eggs, bread, fruit",
      "completed": false,
    },
    {
      "title": "Clean the house",
      "description": "Vacuum living room and wash dishes",
      "completed": false,
    },
    {
      "title": "Study Flutter",
      "description": "Finish state management lesson",
      "completed": false,
    },
    {
      "title": "Workout",
      "description": "30 minutes of cardio and stretching",
      "completed": false,
    },
    {
      "title": "Call mom",
      "description": "Check in and talk about weekend plans",
      "completed": false,
    },
  ];

  void taskValue(int index) {
    setState(() {
      tasks[index]["completed"] = !tasks[index]["completed"];
    });
  }

  void deleteTask(int index) {
    setState(() {
      tasks.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0),
      child: ListView.builder(
        itemCount: tasks.length,
        itemBuilder: (context, index) {
          return Dismissible(
            key: Key(tasks[index]["title"]),
            direction: DismissDirection.endToStart,
            background: Container(
              padding: EdgeInsets.only(right: 20),
              alignment: Alignment.centerRight,
              color: Colors.red,
              child: Icon(Icons.delete, color: Colors.white),
            ),
            onDismissed: (direction) {
              deleteTask(index);
            },
            child: Dismissible(
              key: Key(tasks[index]["title"]),
              direction: DismissDirection.endToStart,
              onDismissed: (direction) {
                setState(() {
                  tasks.removeAt(index);
                });
              },
      
              background: Container(
                margin: EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 6,
                ),
                decoration: BoxDecoration(
                  color: Colors.red.shade400,
                  borderRadius: BorderRadius.circular(
                    14,
                  ),
                ),
                alignment: Alignment.centerRight,
                padding: EdgeInsets.only(right: 20),
                child: Icon(Icons.delete, color: Colors.white),
              ),
              child: ToDoWidget(
                completed: tasks[index]["completed"],
                title: tasks[index]["title"],
                subtitle: tasks[index]["description"],
                onToggle: () => taskValue(index),
              ),
            ),
          );
        },
      ),
    );
  }
}
