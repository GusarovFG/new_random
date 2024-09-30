import 'package:flutter/material.dart';
import 'package:new_random/presentation/Main_screen/Add_bartender_dialog.dart';
import 'package:new_random/presentation/Main_screen/Add_workShift_dialog.dart';
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
    return BottomNavigationBar(
      selectedItemColor: Colors.black,
      unselectedItemColor: Colors.black54,
      showUnselectedLabels: true,
      currentIndex: widget.selectedIndex,
      onTap: widget.onClicked,
      iconSize: 30,
      items: [
        const BottomNavigationBarItem(icon: Icon(Icons.list), label: 'Списки'),
        BottomNavigationBarItem(
            icon: Container(
                decoration: DecorationForContainer.decoration,
                child: IconButton(
                  color: const Color.fromARGB(255, 0, 0, 0),
                  onPressed: () {
                    setState(() {
                      addIsTapped = !addIsTapped;
                      if (!addIsTapped) {
                        Navigator.pop(context);
                        return;
                      }
                      showBottomSheet(
                        context: context,
                        builder: (BuildContext context) {
                          return Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Container(
                                decoration: DecorationForContainer.decoration,
                                height: 80,
                                width: MediaQuery.sizeOf(context).width / 2,
                                child: TextButton(
                                  onPressed: () {
                                    showDialog(
                                        context: context,
                                        builder: (context) =>
                                            const AddWorkShiftDialog());
                                  },
                                  child: const Text(
                                    'Дабавить жребий',
                                    maxLines: 2,
                                    textAlign: TextAlign.center,
                                    style: TextStyle(color: Colors.black),
                                  ),
                                ),
                              ),
                              Container(
                                decoration: DecorationForContainer.decoration,
                                height: 80,
                                width: MediaQuery.sizeOf(context).width / 2,
                                child: TextButton(
                                  onPressed: () {
                                    showDialog(
                                        context: context,
                                        builder: (context) =>
                                            const AddBartenderDialog());
                                  },
                                  child: const Text(
                                    'Дабавить бармена',
                                    maxLines: 2,
                                    textAlign: TextAlign.center,
                                    style: TextStyle(color: Colors.black),
                                  ),
                                ),
                              )
                            ],
                          );
                        },
                      );
                    });
                  },
                  icon: !addIsTapped
                      ? const Icon(Icons.add)
                      : const Icon(Icons.close),
                )),
            label: ''),
        const BottomNavigationBarItem(
            icon: Icon(Icons.watch_later_outlined), label: 'График'),
        const BottomNavigationBarItem(
            icon: Icon(Icons.local_restaurant_outlined), label: 'Ревизия')
      ],
    );
  }
}
