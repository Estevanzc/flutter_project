import 'package:flutter/material.dart';
import 'package:flutter_project/pages/note_page.dart';
import 'package:provider/provider.dart';
import 'package:flutter_project/constants/styles.dart';
import 'package:flutter_project/widgets/notes_list_widget.dart';
import 'package:flutter_project/notifiers/data_provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool listStyle = false;

  void _navigateToNote(int index) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => NotePage(noteIndex: index),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // 1. Listen to Provider
    return Consumer<DataProvider>(
      builder: (context, dataProvider, child) {
        
        // 2. Convert Data to Maps (to keep your Widget happy)
        List<Map<String, dynamic>> notes = dataProvider.notes.map((note) {
          return {
            "title": note.title,
            "content": note.content,
            "created_at": note.date,
          };
        }).toList();

        return SingleChildScrollView(
          child: Column(
            children: [
              // --- YOUR ORIGINAL TOGGLE UI ---
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          listStyle = !listStyle;
                        });
                      },
                      child: Container(
                        decoration: Theme.of(context).brightness == Brightness.dark
                            ? Styles.switchDark
                            : Styles.switchWhite,
                        child: Row(
                          children: [
                            Container(
                              width: 50,
                              padding: const EdgeInsets.symmetric(
                                horizontal: 10,
                                vertical: 5,
                              ),
                              decoration: !listStyle
                                  ? (Theme.of(context).brightness == Brightness.dark
                                      ? Styles.choosenSwitchDark
                                      : Styles.choosenSwitchwhite)
                                  : null,
                              child: const Icon(Icons.window),
                            ),
                            Container(
                              width: 50,
                              padding: const EdgeInsets.symmetric(
                                horizontal: 10,
                                vertical: 5,
                              ),
                              decoration: listStyle
                                  ? (Theme.of(context).brightness == Brightness.dark
                                      ? Styles.choosenSwitchDark
                                      : Styles.choosenSwitchwhite)
                                  : null,
                              child: const Icon(Icons.list),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              // --- YOUR ORIGINAL LIST WIDGET ---
              // I'm passing 'onNoteTap' so you can connect the click.
              // You might need to update NotesListWidget to accept this function.
              NotesListWidget(
                notes: notes, 
                // Pass listStyle if your widget supports grid/list switching
                // isGrid: !listStyle, 
                onNoteTap: _navigateToNote, 
              ),
            ],
          ),
        );
      },
    );
  }
}