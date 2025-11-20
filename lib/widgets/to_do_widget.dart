import 'package:flutter/material.dart';
import 'package:flutter_project/constants/styles.dart';
import 'package:provider/provider.dart';
import 'package:flutter_project/notifiers/theme_provider.dart';

class ToDoWidget extends StatelessWidget {
  final bool completed;
  final String title;
  final String? subtitle;
  final VoidCallback onToggle;
  final VoidCallback? onDelete;

  const ToDoWidget({
    super.key,
    required this.completed,
    required this.title,
    this.subtitle,
    required this.onToggle,
    this.onDelete,
  });
  BoxDecoration taskStyle (context, isDark) {
    BoxDecoration taskStyle = BoxDecoration();
    if (completed) {
      taskStyle = isDark ? Styles.taskCompletedBlack : Styles.taskCompletedWhite;
    } else {
      taskStyle = isDark ? Styles.taskBlack : Styles.taskWhite;
    }
    return taskStyle;
  }

  @override
  Widget build(BuildContext context) {
    bool isDark = Theme.of(context).brightness == Brightness.dark;
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 6, horizontal: 12),
      padding: const EdgeInsets.all(14),
      decoration: taskStyle(context, isDark),
      child: Row(
        children: [
          GestureDetector(
            onTap: onToggle,
            child: AnimatedContainer(
              duration: Duration(milliseconds: 200),
              height: 24,
              width: 24,
              decoration: BoxDecoration(
                color: completed ? Colors.green : Colors.white,
                borderRadius: BorderRadius.circular(6),
                border: Border.all(
                  color: completed ? Colors.green : Colors.grey.shade400,
                  width: 2,
                ),
              ),
              child: completed
                  ? Icon(Icons.check, color: Colors.white, size: 18)
                  : null,
            ),
          ),

          SizedBox(width: 12),

          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    decoration:
                        completed ? TextDecoration.lineThrough : null,
                    color: completed
                        ? Colors.grey.shade600
                        : (isDark ? Colors.grey.shade300 : Colors.grey.shade900),
                  ),
                ),

                if (subtitle != null)
                  Text(
                    subtitle!,
                    style: TextStyle(
                      fontSize: 13,
                      color: Colors.grey.shade600,
                    ),
                  ),
              ],
            ),
          ),

          if (onDelete != null)
            IconButton(
              icon: Icon(Icons.delete_outline, color: Colors.red.shade400),
              onPressed: onDelete,
            ),
        ],
      ),
    );
  }
}
