import 'package:flutter/material.dart';
import 'package:flutter_project/constants/styles.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Your Profile", style: Styles.pageTitle)),
      body: Container(child: Text("profile")),
    );
  }
}
