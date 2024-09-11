import 'package:flutter/material.dart';

class DayCheckbox extends StatefulWidget {
  const DayCheckbox({super.key});

  @override
  State<DayCheckbox> createState() => _DayCheckboxState();
}

class _DayCheckboxState extends State<DayCheckbox> {
  bool _isTapped = false;

  void changeColor() {
    setState(() {
      _isTapped = !_isTapped;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => changeColor(),
      child: Container(
        height: 30,
        width: 30,
        decoration:
            BoxDecoration(border: Border.all(color: Colors.black, width: 2)),
        child: Padding(
          padding: const EdgeInsets.all(3.0),
          child: ColoredBox(
            color: !_isTapped ? Colors.white : Colors.black,
          ),
        ),
      ),
    );
  }
}
