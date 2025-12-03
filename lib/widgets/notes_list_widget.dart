import 'package:flutter/material.dart';
import 'package:flutter_project/widgets/note_widget.dart';

class NotesListWidget extends StatelessWidget {
  const NotesListWidget({
    super.key, 
    required this.notes,
    this.onNoteTap, // 1. Accept the callback
  });

  final List<Map<String, dynamic>> notes;
  final void Function(int index)? onNoteTap; // 2. Define the callback type

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
      
          // 3. Wrap in GestureDetector to handle taps
          return GestureDetector(
            onTap: () {
              if (onNoteTap != null) {
                onNoteTap!(index);
              }
            },
            child: NoteWidget(
              title: note["title"]!,
              text: note["content"]!,
              created_at: note["created_at"]!,
            ),
          );
        },
      ),
    );
  }
}