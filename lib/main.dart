import 'package:flutter/material.dart';
import 'package:flutter_project/constants/config.dart';
import 'package:flutter_project/notifiers/theme_provider.dart';
import 'package:flutter_project/pages/home_page.dart';
import 'package:flutter_project/pages/profile_page.dart';
import 'package:flutter_project/pages/settings_page.dart';
import 'package:flutter_project/pages/to_do_page.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(create: (_) => ThemeProvider(), child: MyApp()),
  );
}

class MyApp extends StatefulWidget {
  MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int _pageIndex = 1;
  final List<Widget> _pages = [HomePage(), ToDoPage()];

  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeProvider>(
      builder: (context, themeNotifier, child) {
        bool isDark = Theme.of(context).brightness == Brightness.dark;
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: Config.lightTheme,
          darkTheme: Config.darkTheme,
          themeMode: themeNotifier.isSimpleDarkMode
              ? ThemeMode.dark
              : ThemeMode.light,
          home: Builder(
            builder: (context) {
              return Scaffold(
                appBar: AppBar(
                  title: Text(
                    "My Keeps",
                    style: TextStyle(fontFamily: "Garet"),
                  ),
                  actions: [
                    IconButton(onPressed: () {}, icon: Icon(Icons.search)),
                    IconButton(
                      icon: const Icon(Icons.settings),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const SettingsPage(),
                          ),
                        );
                      },
                    ),
                  ],
                  actionsPadding: EdgeInsets.only(right: 10),
                ),
                body: _pages[_pageIndex],
                floatingActionButton: FloatingActionButton.extended(
                  onPressed: () {},
                  backgroundColor:
                      Theme.of(context).brightness == Brightness.dark
                      ? Colors.white10
                      : Colors.blue[200],
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  label: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Row(
                      children: [
                        Icon(
                          _pageIndex == 0 ? Icons.edit : Icons.add,
                          color: Theme.of(context).brightness == Brightness.dark
                              ? Colors.white
                              : Colors.black,
                          size: 20,
                        ),
                        SizedBox(width: 15),
                        Text(
                          _pageIndex == 0
                              ? "Write a new note"
                              : "Add a new task",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color:
                                Theme.of(context).brightness == Brightness.dark
                                ? Colors.white
                                : Colors.black,
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
                          padding: EdgeInsets.only(
                            left: 16,
                            right: 16,
                            bottom: 15,
                          ),
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
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: Divider(),
                        ),

                        Container(
                          color: _pageIndex == 0
                              ? (Theme.of(context).brightness == Brightness.dark
                                    ? Colors.white10
                                    : Colors.grey.shade300)
                              : null,
                          child: ListTile(
                            leading: const Icon(Icons.home),
                            title: const Text('Notes'),
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
                              ? (Theme.of(context).brightness == Brightness.dark
                                    ? Colors.white10
                                    : Colors.grey.shade300)
                              : null,
                          child: ListTile(
                            leading: const Icon(Icons.list),
                            title: const Text('To do'),
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
                          leading: const Icon(Icons.person),
                          title: const Text('Profile'),
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => ProfilePage(),
                              ),
                            );
                          },
                        ),
                        ListTile(
                          leading: const Icon(Icons.settings),
                          title: const Text('Settings'),
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => SettingsPage(),
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        );
      },
    );
  }
}
