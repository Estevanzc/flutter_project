import 'package:flutter/material.dart';
import 'package:flutter_project/pages/home_page.dart';
import 'package:flutter_project/pages/profile_page.dart';
import 'package:flutter_project/pages/settings_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.blue[200],
        brightness: Brightness.dark,
      ),
      home: Builder(
        builder: (context) {
          return Scaffold(
            appBar: AppBar(
              title: Text("My Keeps", style: TextStyle(fontFamily: "Garet")),
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
            body: HomePage(),
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
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Divider(),
                    ),

                    ListTile(
                      leading: const Icon(Icons.home),
                      title: const Text('Notes'),
                      onTap: () {
                        Navigator.pop(context);
                      },
                    ),
                    ListTile(
                      leading: const Icon(Icons.list),
                      title: const Text('To do'),
                      onTap: () {
                        Navigator.pop(context);
                      },
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
  }
}
