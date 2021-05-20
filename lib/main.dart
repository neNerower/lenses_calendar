import 'package:flutter/material.dart';

import 'screen/main_screen.dart';

void main() {
  runApp(MyApp());
}

// TODO: ADD DATE SELECTING
// TODO: ADD LENSES CICLE VIEWING
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SafeArea(
        child: MainScreen(),
      ),
    );
  }
}
