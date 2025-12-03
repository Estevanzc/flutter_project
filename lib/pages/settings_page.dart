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
                const SizedBox(height: 20),
                
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: Column(
                    children: [
                      GestureDetector(
                        onTap: () {
                          themeNotifier.toggleTheme(!themeNotifier.isSimpleDarkMode);
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Dark mode", style: Styles.settingsOption),
                            Switch(
                              value: themeNotifier.isSimpleDarkMode,
                              onChanged: (value) {
                                themeNotifier.toggleTheme(value);
                              },
                            ),
                          ],
                        ),
                      ),
                      
                      const SizedBox(height: 20),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Text font", style: Styles.settingsOption),
                          DropdownButton<String>(
                            value: themeNotifier.fontFamily,
                            underline: Container(),
                            items: const [
                              DropdownMenuItem(
                                value: "Roboto",
                                child: Text("Roboto", style: TextStyle(fontFamily: "Roboto")),
                              ),
                              DropdownMenuItem(
                                value: "Poppins",
                                child: Text("Poppins", style: TextStyle(fontFamily: "Poppins")),
                              ),
                            ],
                            onChanged: (String? newValue) {
                              if (newValue != null) {
                                themeNotifier.setFontFamily(newValue);
                              }
                            },
                          ),
                        ],
                      ),

                      const SizedBox(height: 20),

                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("Text size:", style: Styles.settingsOption),
                              Text(
                                themeNotifier.fontSize.toStringAsFixed(1),
                                style: TextStyle(
                                  fontSize: 16, 
                                  fontWeight: FontWeight.bold,
                                  color: Colors.grey[600],
                                ),
                              ),
                            ],
                          ),
                          Slider.adaptive(
                            value: themeNotifier.fontSize,
                            min: 12.0,
                            max: 30.0,
                            divisions: 18,
                            label: themeNotifier.fontSize.toStringAsFixed(1),
                            onChanged: (value) {
                              themeNotifier.setFontSize(value);
                            },
                          ),
                          Center(
                            child: Padding(
                              padding: const EdgeInsets.only(top: 10),
                              child: Text(
                                "Preview Text",
                                style: TextStyle(
                                  fontFamily: themeNotifier.fontFamily,
                                  fontSize: themeNotifier.fontSize,
                                ),
                              ),
                            ),
                          )
                        ],
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