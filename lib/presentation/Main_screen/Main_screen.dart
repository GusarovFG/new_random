import 'package:flutter/material.dart';
import 'package:new_random/presentation/Lists_screen/Add_bartender_dialog.dart';
import 'package:new_random/presentation/Lists_screen/Bartendres_list.dart';
import 'package:new_random/presentation/Lists_screen/Work_shifts_list.dart';
import 'package:new_random/presentation/Persistence/Decoration_for_container.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        children: [
          const Expanded(
            flex: 2,
            child: WorkShiftsList(),
          ),
          const SizedBox(
            height: 10,
          ),
          Container(
            padding: EdgeInsets.all(5),
            decoration: DecorationForContainer.decoration,
            child: const Text('Бармены'),
          ),
          const SizedBox(
            height: 15,
          ),
          const Expanded(
            child: BartendresList(),
          ),
          Container(
            decoration: DecorationForContainer.decoration,
            child: IconButton(
              color: const Color.fromARGB(255, 0, 0, 0),
              onPressed: () {
                showDialog(
                    context: context,
                    builder: (context) => AddBartenderDialog());
              },
              icon: Icon(Icons.add),
            ),
          ),
        ],
      ),
    );
  }
}
