import 'package:flutter/material.dart';
import 'package:flutter_project/constants/styles.dart';
import 'package:flutter_project/widgets/notes_list_widget.dart';

class HomePage extends StatefulWidget {
  HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool listStyle = false;

  List<Map<String, dynamic>> notes = [
    {
      "title": "Groceries",
      "content": "Buy milk and eggs",
      "created_at": DateTime.now().subtract(Duration(hours: 2)),
    },
    {
      "title": "Study",
      "content": "Flutter layout widgets",
      "created_at": DateTime.now().subtract(Duration(days: 1)),
    },
    {
      "title": "Workout",
      "content": "Leg day routine",
      "created_at": DateTime.now().subtract(Duration(minutes: 30)),
    },
    {
      "title": "Project",
      "content": "Finish API integration",
      "created_at": DateTime.now().subtract(Duration(days: 3)),
    },
  ];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
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
          NotesListWidget(notes: notes),
        ],
      ),
    );
  }
}
