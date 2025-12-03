import 'package:flutter/material.dart';
import 'package:flutter_project/constants/config.dart';
import 'package:flutter_project/notifiers/theme_provider.dart';
import 'package:flutter_project/pages/home_page.dart';
import 'package:flutter_project/pages/profile_page.dart';
import 'package:flutter_project/pages/settings_page.dart';
import 'package:flutter_project/pages/to_do_page.dart';
import 'package:provider/provider.dart';
import 'package:flutter_project/notifiers/data_provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ThemeProvider()),
        ChangeNotifierProvider(create: (_) => DataProvider()..loadData()),
      ],
      child: MyApp(),
    ),
  );
}

// 1. MyApp handles Theme and Setup ONLY
class MyApp extends StatelessWidget {
  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeProvider>(
      builder: (context, themeNotifier, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: Config.lightTheme,
          darkTheme: Config.darkTheme,
          themeMode: themeNotifier.isSimpleDarkMode
              ? ThemeMode.dark
              : ThemeMode.light,
          home: MainPage(),
        );
      },
    );
  }
}

// 2. MainPage handles your UI, Logic, and State
class MainPage extends StatefulWidget {
  MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _pageIndex = 1;
  final List<Widget> _pages = [HomePage(), ToDoPage()];
  final TextEditingController _noteController = TextEditingController();
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();

  @override
  void dispose() {
    _noteController.dispose();
    super.dispose();
  }

  void _openAddNoteSheet() {
    bool isNote = _pageIndex == 0;

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) => Padding(
        padding: EdgeInsets.only(
          bottom: MediaQuery.of(context).viewInsets.bottom,
          left: 20,
          right: 20,
          top: 20,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              isNote ? "Add New Note" : "Add New Task",
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 15),
            if (isNote)
              Column(
                children: [
                  TextField(
                    controller: _titleController,
                    decoration: InputDecoration(
                      labelText: "Title (Optional)",
                      border: OutlineInputBorder(),
                    ),
                  ),
                  SizedBox(height: 15),
                ],
              ),
            TextField(
              controller: _noteController,
              autofocus: true,
              decoration: InputDecoration(
                labelText: isNote
                    ? "Write something..."
                    : "What needs to be done?",
                border: const OutlineInputBorder(),
              ),
              maxLines: isNote ? 3 : 1,
            ),
            const SizedBox(height: 20),
            if (!isNote)
              Column(
                children: [
                  TextField(
                    controller: _descriptionController,
                    decoration: InputDecoration(
                      labelText: "Task Description (Optional)",
                      border: OutlineInputBorder(),
                    ),
                  ),
                  SizedBox(height: 15),
                ],
              ),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  String titleText = _titleController.text.trim();
                  String contentText = _noteController.text.trim();

                  if (contentText.isNotEmpty) {
                    final dataProvider = Provider.of<DataProvider>(
                      context,
                      listen: false,
                    );

                    if (isNote) {
                      dataProvider.addNote(
                        titleText.isEmpty ? "No Title" : titleText,
                        contentText,
                      );
                    } else {
                      dataProvider.addTask(
                        contentText,
                        _descriptionController.text
                            .trim(),
                      );
                    }

                    Navigator.of(context).pop();
                    _noteController.clear();
                    _titleController.clear();
                  }
                },
                child: const Text("Save"),
              ),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    bool isDark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      appBar: AppBar(
        title: Text("My Keeps", style: TextStyle(fontFamily: "Garet")),
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.search)),
          IconButton(
            icon: Icon(Icons.settings),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => SettingsPage()),
              );
            },
          ),
        ],
        actionsPadding: EdgeInsets.only(right: 10),
      ),
      body: _pages[_pageIndex],
      floatingActionButton: FloatingActionButton.extended(
        onPressed: _openAddNoteSheet,
        backgroundColor: isDark ? Colors.white10 : Colors.blue[200],
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        label: Padding(
          padding: EdgeInsets.symmetric(horizontal: 8.0),
          child: Row(
            children: [
              Icon(
                _pageIndex == 0 ? Icons.edit : Icons.add,
                color: isDark ? Colors.white : Colors.black,
                size: 20,
              ),
              SizedBox(width: 15),
              Text(
                _pageIndex == 0 ? "Write a new note" : "Add a new task",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: isDark ? Colors.white : Colors.black,
                ),
              ),
            ],
          ),
        ),
      ),
      drawer: Drawer(
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 50),
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.only(left: 16, right: 16, bottom: 15),
                child: Text(
                  'Fast menu',
                  style: TextStyle(
                    fontSize: 24,
                    fontFamily: "Roboto",
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Divider(),
              ),
              Container(
                color: _pageIndex == 0
                    ? (isDark ? Colors.white10 : Colors.grey.shade300)
                    : null,
                child: ListTile(
                  leading: Icon(Icons.home),
                  title: Text('Notes'),
                  onTap: () {
                    setState(() {
                      _pageIndex = 0;
                    });
                    Navigator.pop(context);
                  },
                ),
              ),
              Container(
                color: _pageIndex == 1
                    ? (isDark ? Colors.white10 : Colors.grey.shade300)
                    : null,
                child: ListTile(
                  leading: Icon(Icons.list),
                  title: Text('To do'),
                  onTap: () {
                    setState(() {
                      _pageIndex = 1;
                    });
                    Navigator.pop(context);
                  },
                ),
              ),
              Spacer(),
              ListTile(
                leading: Icon(Icons.person),
                title: Text('Profile'),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ProfilePage()),
                  );
                },
              ),
              ListTile(
                leading: Icon(Icons.settings),
                title: Text('Settings'),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => SettingsPage()),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
