import 'package:flutter/material.dart';
import 'package:new_random/presentation/Persistence/Decoration_for_container.dart';

// ignore: must_be_immutable
class BottomBar extends StatefulWidget {
  final int selectedIndex;
  ValueChanged<int> onClicked;
  final BuildContext buildContext;
  BottomBar(
      {super.key,
      required this.buildContext,
      required this.selectedIndex,
      required this.onClicked});

  @override
  State<BottomBar> createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  bool addIsTapped = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: DecorationForContainer.decoration,
      child: ClipRRect(
        borderRadius: const BorderRadius.all(
          Radius.circular(25),
        ),
        child: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          selectedItemColor: Colors.white,
          unselectedItemColor: const Color.fromARGB(255, 196, 36, 196),
          showUnselectedLabels: true,
          currentIndex: widget.selectedIndex,
          onTap: widget.onClicked,
          iconSize: 30,
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.list), label: 'ЖРЕБИЙ'),
            BottomNavigationBarItem(icon: Icon(Icons.person), label: 'БАРМЕНЫ'),
            BottomNavigationBarItem(
                icon: Icon(Icons.watch_later_outlined), label: 'ГРАФИК'),
            BottomNavigationBarItem(
                icon: Icon(Icons.local_restaurant_outlined), label: 'РЕВИЗИЯ')
          ],
        ),
      ),
    );
  }
}
