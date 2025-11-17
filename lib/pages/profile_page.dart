import 'package:flutter/material.dart';
import 'package:flutter_project/constants/styles.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          leading: IconButton(onPressed: () => Navigator.pop(context), icon: Icon(Icons.arrow_back)),
          title: Text("Your Profile", style: Styles.pageTitle),
        ),
        body: Container(child: Text("profile")),
      ),
    );
  }
}
