import 'package:flutter/material.dart';
import 'package:new_random/presentation/Lists_screen/Work_shifts_list.dart';
import 'package:new_random/presentation/Main_screen/Add_workShift_dialog.dart';
import 'package:new_random/presentation/persistence/Bar_appBar.dart';
import 'package:pattern_background/pattern_background.dart';

class WorkshiftsScreen extends StatefulWidget {
  const WorkshiftsScreen({super.key});

  @override
  State<WorkshiftsScreen> createState() => _WorkshiftsScreenState();
}

class _WorkshiftsScreenState extends State<WorkshiftsScreen> {
  bool addIsTapped = false;

  @override
  Widget build(BuildContext context) {
    var c1 = Colors.grey.shade900;
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return Scaffold(
      extendBodyBehindAppBar: false,
      appBar: const BarAppBar(
        nameOfAsset: 'assets/jrebiy.png',
        revision: false,
      ),
      body: CustomPaint(
        size: Size(width, height),
        painter: DotPainter(dotColor: c1, dotRadius: 2, spacing: 5),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Stack(
            children: [
              Column(
                children: [
                  const Expanded(
                    flex: 2,
                    child: WorkShiftsList(),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Container(
                    width: 50,
                    height: 50,
                    decoration: const BoxDecoration(
                      color: Color.fromARGB(255, 196, 36, 196),
                      borderRadius: BorderRadius.all(
                        Radius.circular(25),
                      ),
                    ),
                    child: IconButton(
                      color: Colors.white,
                      onPressed: () {
                        showDialog(
                            context: context,
                            builder: (context) => const AddWorkShiftDialog());
                      },
                      icon: const Icon(Icons.add),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
