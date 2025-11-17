import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          GestureDetector(
            child: Row(
              children: [
                Container(child: Icon(Icons.window)),
                Container(child: Icon(Icons.list)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
