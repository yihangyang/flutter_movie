import 'package:flutter/material.dart';
import 'package:movieapp/pages/home/home.dart';
import 'package:movieapp/pages/main/bottom_bar_item.dart';
import 'package:movieapp/pages/subject/subject.dart';

List<BottomBarItem> items = [
  BottomBarItem("home","Home"),
  BottomBarItem("subject","Subject"),
  BottomBarItem("group","Group"),
  BottomBarItem("mall","Mall"),
  BottomBarItem("profile","My"),
];

List<Widget> pages = [
  HomePage(),
  SubjectPage(),
  SubjectPage(),
  SubjectPage(),
  SubjectPage()
];