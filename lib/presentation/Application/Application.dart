import 'package:flutter/material.dart';
import 'package:new_random/presentation/Application/Bottom_bar.dart';
import 'package:new_random/presentation/Bartenders_screen/Bartenders_screen.dart';
import 'package:new_random/presentation/Main_screen/Workshifts_screen.dart';
import 'package:new_random/presentation/Revision_screen/Revision_screen.dart';
import 'package:new_random/presentation/Schedule_screen/Schedule_screen.dart';
import 'package:pattern_background/pattern_background.dart';

class Application extends StatefulWidget {
  const Application({super.key});

  @override
  State<Application> createState() => _ApplicationState();
}

class _ApplicationState extends State<Application> {
  int selectedIndex = 0;
  final screens = [
    const WorkshiftsScreen(),
    const BartendersScreen(),
    const ScheduleScreen(),
    const RevisionScreen()
  ];

  void onClicked(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    var c1 = Colors.grey.shade900;
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(fontFamily: 'kinetika', brightness: Brightness.dark),
      home: Scaffold(
        body: CustomPaint(
          size: Size(width, height),
          painter: DotPainter(dotColor: c1, dotRadius: 2, spacing: 5),
          child: screens[selectedIndex],
        ),
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.all(5.0),
          child: BottomBar(
            buildContext: context,
            selectedIndex: selectedIndex,
            onClicked: onClicked,
          ),
        ),
      ),
    );
  }
}
