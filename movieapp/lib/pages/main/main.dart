import 'package:flutter/material.dart';
import 'package:movieapp/pages/main/initialized_items.dart';

class MainPage extends StatefulWidget {
  
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _curIndex = 0;
  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      body: IndexedStack(
        index: _curIndex,
        children: pages,
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedFontSize: 14,
        // selectedItemColor: Colors.pink,
        currentIndex: _curIndex,
        type: BottomNavigationBarType.fixed,
        items: items,
        onTap: (index) {
          setState(() {
            _curIndex = index;
          });
        },
      ),
    );
  }
}

