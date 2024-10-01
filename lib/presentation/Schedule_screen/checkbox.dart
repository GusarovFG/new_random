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
        decoration: BoxDecoration(
            border: Border.all(
                color: const Color.fromARGB(255, 196, 36, 196), width: 2),
            borderRadius: const BorderRadius.all(Radius.circular(15))),
        child: Padding(
          padding: const EdgeInsets.all(5.0),
          child: Container(
            decoration: BoxDecoration(
              color: !_isTapped
                  ? const Color.fromARGB(255, 37, 37, 37)
                  : Colors.white,
              borderRadius: const BorderRadius.all(
                Radius.circular(10),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
