import 'package:flutter/material.dart';
import 'package:flutter_project/widgets/note_widget.dart';

class NotesListWidget extends StatelessWidget {
  const NotesListWidget({super.key, required this.notes});
  final List<Map<String, dynamic>> notes;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5),
      child: GridView.builder(
        padding: const EdgeInsets.all(12),
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: notes.length,
        gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 300,
          crossAxisSpacing: 10,
          mainAxisSpacing: 5,
        ),
        itemBuilder: (context, index) {
          final note = notes[index];
      
          return NoteWidget(
            title: note["title"]!,
            text: note["content"]!,
            created_at: note["created_at"]!,
          );
        },
      ),
    );
  }
}
