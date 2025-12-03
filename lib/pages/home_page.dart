import 'package:flutter/material.dart';
import 'package:provider/provider.dart'; // Import Provider
import 'package:flutter_project/constants/styles.dart';
import 'package:flutter_project/widgets/notes_list_widget.dart';
import 'package:flutter_project/notifiers/data_provider.dart'; // Import your DataProvider

class HomePage extends StatefulWidget {
  HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool listStyle = false;

  @override
  Widget build(BuildContext context) {
    // 1. Listen to the DataProvider
    return Consumer<DataProvider>(
      builder: (context, dataProvider, child) {
        
        // 2. Convert the Database Notes (Objects) to Maps
        // This ensures your existing NotesListWidget works without changing its code.
        List<Map<String, dynamic>> notes = dataProvider.notes.map((note) {
          return {
            "title": note.title,
            "content": note.content,
            "created_at": note.date, // Map the 'date' field to 'created_at'
          };
        }).toList();

        return SingleChildScrollView(
          child: Column(
            children: [
              // --- TOGGLE BUTTON (Style preserved exactly) ---
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
                              padding: EdgeInsets.symmetric(
                                horizontal: 10,
                                vertical: 5,
                              ),
                              decoration: !listStyle
                                  ? (Theme.of(context).brightness == Brightness.dark
                                      ? Styles.choosenSwitchDark
                                      : Styles.choosenSwitchwhite)
                                  : null,
                              child: Icon(Icons.window),
                            ),
                            Container(
                              width: 50,
                              padding: EdgeInsets.symmetric(
                                horizontal: 10,
                                vertical: 5,
                              ),
                              decoration: listStyle
                                  ? (Theme.of(context).brightness == Brightness.dark
                                      ? Styles.choosenSwitchDark
                                      : Styles.choosenSwitchwhite)
                                  : null,
                              child: Icon(Icons.list),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              // --- NOTES LIST ---
              // Now passing the dynamic data converted to the format your widget expects
              // Note: If you want the listStyle toggle to work, you might need to pass 
              // 'listStyle' to this widget, e.g., NotesListWidget(notes: notes, isGrid: !listStyle)
              NotesListWidget(notes: notes),
            ],
          ),
        );
      },
    );
  }
}