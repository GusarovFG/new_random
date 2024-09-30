import 'package:flutter/material.dart';
import 'package:new_random/presentation/Application/Bottom_bar.dart';
import 'package:new_random/presentation/Main_screen/Main_screen.dart';
import 'package:new_random/presentation/Persistence/Decoration_for_container.dart';
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
    const MainScreen(),
    const MainScreen(),
    const ScheduleScreen(),
    const RevisionScreen()
  ];

  void onClicked(int index) {
    setState(() {
      switch (index) {
        case 1:
          return;
        default:
          selectedIndex = index;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    var c1 = Colors.grey.shade900;
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(fontFamily: 'pixel'),
      home: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: Container(
              padding: const EdgeInsets.all(5),
              decoration: DecorationForContainer.decoration,
              child: const Text('Жребий')),
          centerTitle: true,
        ),
        body: CustomPaint(
          size: Size(width, height),
          painter: DotPainter(dotColor: c1, dotRadius: 2, spacing: 5),
          child: screens[selectedIndex],
        ),
        bottomNavigationBar: Container(
          decoration: DecorationForContainer.decoration,
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
