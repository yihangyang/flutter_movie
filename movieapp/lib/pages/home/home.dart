import 'package:flutter/material.dart';
import 'package:movieapp/pages/home/home_content.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text("HomePage"),
        )
      ),
      body: HomeContent(),
    );
  }
}