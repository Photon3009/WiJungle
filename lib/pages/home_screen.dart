import 'package:bitsdojo_window/bitsdojo_window.dart';
import 'package:flutter/material.dart';
import 'package:wi_jungle/widgets/left_side.dart';
import 'package:wi_jungle/widgets/right_side.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

const borderColor = Color(0xFF805306);

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: WindowBorder(
        color: borderColor,
        width: 1,
        child: const Row(
          children: [LeftSide(), RightSide()],
        ),
      ),
    );
  }
}
