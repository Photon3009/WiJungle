import 'package:bitsdojo_window/bitsdojo_window.dart';
import 'package:flutter/material.dart';

class WindowButtons extends StatefulWidget {
  const WindowButtons({super.key});

  @override
  State<WindowButtons> createState() => _WindowButtonsState();
}

class _WindowButtonsState extends State<WindowButtons> {
  final WindowButtonColors buttonColors = WindowButtonColors(
    iconNormal: const Color(0xFF161639),
    mouseOver: Colors.white,
    mouseDown: const Color(0xFF161639),
    iconMouseOver: const Color(0xFF161639),
    iconMouseDown: Colors.white,
  );

  void maximizeOrRestore() {
    setState(() {
      appWindow.maximizeOrRestore();
    });
  }

  Widget buildWindowButton(Widget button) {
    return Container(
      height: 30,
      width: 30,
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.grey,
          width: 1.0,
        ),
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: button,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        buildWindowButton(MinimizeWindowButton(colors: buttonColors)),
        const SizedBox(width: 8.0),
        buildWindowButton(
          appWindow.isMaximized
              ? RestoreWindowButton(
                  colors: buttonColors,
                  onPressed: maximizeOrRestore,
                )
              : MaximizeWindowButton(
                  colors: buttonColors,
                  onPressed: maximizeOrRestore,
                ),
        ),
        const SizedBox(width: 8.0),
        buildWindowButton(CloseWindowButton(colors: buttonColors)),
      ],
    );
  }
}
