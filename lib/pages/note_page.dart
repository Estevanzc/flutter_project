import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_project/notifiers/data_provider.dart';

class NotePage extends StatefulWidget {
  final int noteIndex;

  const NotePage({super.key, required this.noteIndex});

  @override
  State<NotePage> createState() => _NotePageState();
}

class _NotePageState extends State<NotePage> {
  late TextEditingController _titleController;
  late TextEditingController _contentController;

  @override
  void initState() {
    super.initState();
    // 1. Get the note data using the index
    final note = Provider.of<DataProvider>(context, listen: false).notes[widget.noteIndex];
    
    // 2. Pre-fill the controllers
    _titleController = TextEditingController(text: note.title);
    _contentController = TextEditingController(text: note.content);
  }

  @override
  void dispose() {
    _titleController.dispose();
    _contentController.dispose();
    super.dispose();
  }

  // 3. Save changes automatically
  void _save() {
    Provider.of<DataProvider>(context, listen: false).updateNote(
      widget.noteIndex,
      _titleController.text,
      _contentController.text,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Theme.of(context).iconTheme.color),
          onPressed: () => Navigator.pop(context),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.delete_outline, color: Colors.redAccent),
            onPressed: () {
              Provider.of<DataProvider>(context, listen: false).deleteNote(widget.noteIndex);
              Navigator.pop(context);
            },
          ),
          const SizedBox(width: 10),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          children: [
            // Title Field (View & Edit combined)
            TextField(
              controller: _titleController,
              onChanged: (_) => _save(), // Autosave
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
              decoration: const InputDecoration(
                hintText: "Title",
                border: InputBorder.none,
                hintStyle: TextStyle(color: Colors.grey),
              ),
            ),
            const Divider(),
            // Content Field (View & Edit combined)
            Expanded(
              child: TextField(
                controller: _contentController,
                onChanged: (_) => _save(), // Autosave
                maxLines: null, // Unlimited lines
                expands: true,
                style: const TextStyle(fontSize: 18),
                decoration: const InputDecoration(
                  hintText: "Start typing...",
                  border: InputBorder.none,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}