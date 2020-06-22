import 'package:flutter/material.dart';
import 'package:movieapp/pages/main/main.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        highlightColor: Colors.transparent
      ),
      // home: MyHomePage(),
      home: MainPage(),
    );
  }
}

// class MyHomePage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         centerTitle: true ,
//         title: Text("Login"),
//       ),
//       body: Center(
//         child: Text("Hello"),
//       ),
      
//     );
//   }
// }

