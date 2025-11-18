import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class NoteWidget extends StatelessWidget {
  const NoteWidget({
    super.key,
    required this.title,
    required this.text,
    required this.created_at,
  });

  final String title;
  final String text;
  final DateTime created_at;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: double.infinity,
            height: 100,
            padding:  EdgeInsets.all(12),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: Colors.white10,
            ),
            child: Text(text, maxLines: 4, overflow: TextOverflow.ellipsis),
          ),
           SizedBox(height: 8),
          Text(
            title,
            style:  TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
          Text(
            DateFormat("EEE dd/MM/yy").format(created_at),
            style:  TextStyle(fontSize: 14, color: Colors.grey),
          ),
        ],
      ),
    );
  }
}
