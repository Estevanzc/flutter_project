import 'package:flutter/material.dart';
import 'package:provider/provider.dart'; // Import Provider
import 'package:flutter_project/notifiers/data_provider.dart'; // Import DataProvider
import 'package:flutter_project/widgets/to_do_widget.dart';

class ToDoPage extends StatefulWidget {
  ToDoPage({super.key});

  @override
  State<ToDoPage> createState() => _ToDoPageState();
}

class _ToDoPageState extends State<ToDoPage> {
  // We removed the hardcoded 'tasks' list and local functions
  // because the Provider handles them now.

  @override
  Widget build(BuildContext context) {
    // 1. Listen to the DataProvider
    return Consumer<DataProvider>(
      builder: (context, dataProvider, child) {
        
        // Get the real list from the database
        final tasks = dataProvider.tasks;

        return Padding(
          padding: const EdgeInsets.only(top: 8.0),
          child: ListView.builder(
            itemCount: tasks.length,
            itemBuilder: (context, index) {
              final task = tasks[index];

              return Dismissible(
                // Use UniqueKey so Flutter knows exactly which item to delete
                key: UniqueKey(),
                direction: DismissDirection.endToStart,
                
                // 2. Call the Provider to delete
                onDismissed: (direction) {
                  dataProvider.deleteTask(index);
                },

                // 3. Keep your EXACT styling for the delete background
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

                // 4. Map the Task data to your ToDoWidget
                child: ToDoWidget(
                  completed: task.isDone,
                  title: task.title,
                  // Use the description field we added earlier
                  subtitle: task.description, 
                  // Call the Provider to toggle checkbox
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