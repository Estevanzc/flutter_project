import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_project/notifiers/data_provider.dart';
import 'package:flutter_project/widgets/to_do_widget.dart';

class ToDoPage extends StatefulWidget {
  ToDoPage({super.key});

  @override
  State<ToDoPage> createState() => _ToDoPageState();
}

class _ToDoPageState extends State<ToDoPage> {

  @override
  Widget build(BuildContext context) {
    return Consumer<DataProvider>(
      builder: (context, dataProvider, child) {
        
        final tasks = dataProvider.tasks;

        return Padding(
          padding: const EdgeInsets.only(top: 8.0),
          child: ListView.builder(
            itemCount: tasks.length,
            itemBuilder: (context, index) {
              final task = tasks[index];

              return Dismissible(
                key: UniqueKey(),
                direction: DismissDirection.endToStart,
                
                onDismissed: (direction) {
                  dataProvider.deleteTask(index);
                },

                background: Container(
                  margin: EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 6,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.red.shade400,
                    borderRadius: BorderRadius.circular(14),
                  ),
                  alignment: Alignment.centerRight,
                  padding: EdgeInsets.only(right: 20),
                  child: Icon(Icons.delete, color: Colors.white),
                ),

                child: ToDoWidget(
                  completed: task.isDone,
                  title: task.title,
                  subtitle: task.description, 
                  onToggle: () => dataProvider.toggleTask(index), 
                ),
              );
            },
          ),
        );
      },
    );
  }
}