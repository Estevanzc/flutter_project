import 'package:flutter/material.dart';
import 'package:flutter_project/notifiers/theme_provider.dart';
import 'package:provider/provider.dart';
import 'package:flutter_project/constants/styles.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final themeNotifier = Provider.of<ThemeProvider>(context);

    return Scaffold(
      appBar: AppBar(title: Text("Settings", style: Styles.pageTitle)),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Preferences", style: Styles.settingsTitle),
                SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: Column(
                    children: [
                      GestureDetector(
                        onTap: () {
                          bool newValue = !themeNotifier.isSimpleDarkMode;
                          Provider.of<ThemeProvider>(
                            context,
                            listen: false,
                          ).toggleTheme(newValue);
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Dark mode", style: Styles.settingsOption),
                            Switch(
                              value: themeNotifier.isSimpleDarkMode,
                              onChanged: (value) {
                                Provider.of<ThemeProvider>(
                                  context,
                                  listen: false,
                                ).toggleTheme(value);
                              },
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 10),
                      GestureDetector(
                        onTap: () {},
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Text font", style: Styles.settingsOption),
                            DropdownButton(
                              value: 0,
                              items: [
                                DropdownMenuItem(
                                  value: 0,
                                  child: Text(
                                    "Roboto",
                                    style: TextStyle(fontFamily: "Roboto"),
                                  ),
                                ),
                                DropdownMenuItem(
                                  value: 1,
                                  child: Text(
                                    "Poppins",
                                    style: TextStyle(fontFamily: "Poppins"),
                                  ),
                                ),
                              ],
                              onChanged: (value) {},
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 10),
                      Padding(
                        padding: const EdgeInsets.only(top: 10.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Text(
                                  "Text size:",
                                  style: Styles.settingsOption,
                                ),
                                SizedBox(width: 10),
                                Text("24"),
                              ],
                            ),
                            Slider.adaptive(
                              value: 0,
                              onChanged: (value) {},
                              max: 1,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
