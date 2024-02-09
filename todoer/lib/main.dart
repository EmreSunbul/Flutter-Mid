import 'package:flutter/material.dart';
import 'package:todoer/screens/home.dart';



void main() {
  runApp(const Main());
}


class Main extends StatefulWidget {
  const Main({super.key});

  @override
  State<Main> createState() => _MainState();
}

class _MainState extends State<Main> {
  
  @override
  Widget build(BuildContext context) {
      return  const MaterialApp(
      home:HomeScreen(),
    );
}
}